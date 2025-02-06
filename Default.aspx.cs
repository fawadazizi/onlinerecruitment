using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Security;
public partial class _Default : System.Web.UI.Page
{
    public string Getconnection()
    {
        return
            System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Check_Session();
    }


    public void Check_Session()
    {
        if (Session["Username"] != null && Session["Role"].ToString() == "jobseeker")
        {
            Response.Redirect("/users/jobseeker/JobSeekerMain.aspx?Username=" +
                    Session["Username"].ToString() + "&UserID=" + Session["UserID"].ToString());
        }
        else if (Session["Username"] != null && Session["Role"].ToString() == "employer")
        {
            Response.Redirect("/users/employer/EmployerMain.aspx?Username=" +
                        Session["Username"].ToString() + "&UserID=" + Session["UserID"].ToString());
        }
        else if (Session["Username"] != null && Session["Role"].ToString() == "admin")
        {
            Response.Redirect("/users/administrator/AdminMain.aspx?Username=" +
                        Session["Username"].ToString() + "&UserID=" + Session["UserID"].ToString());
        }
        else
        {
            return;
        }
    }



    // Check For Existing User
    public void login_user()
    {
        
        SqlConnection cn = new SqlConnection(Getconnection());

        DataTable dt = new DataTable();
        int i;
        int row_count;
        string user_role, userexist, passexist, idexist;
        if (username.Text != "" || password.Text != "")
        {
            try
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("SELECT id,username,password,user_role from users WHERE deleted = 0", cn);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                row_count = dt.Rows.Count - 1;

                for (i = 0; i <= row_count; i++)
                {
                    idexist = dt.Rows[i]["id"].ToString();
                    userexist = dt.Rows[i]["username"].ToString();
                    passexist = dt.Rows[i]["password"].ToString();
                    user_role = dt.Rows[i]["user_role"].ToString();

                    string EncryptedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(password.Text, "SHA1");

                    if (username.Text == userexist && EncryptedPass == passexist && user_role == "jobseeker")
                    {

                        Session["Username"] = userexist;
                        Session["UserID"] = idexist;
                        Session["Role"] = user_role;
                        Login_Update();
                        Response.Redirect("/users/jobseeker/JobSeekerMain.aspx?Username=" +
                            Session["Username"].ToString() + "&UserID=" + Session["UserID"].ToString());

                    }
                    else if (username.Text == userexist && EncryptedPass == passexist && user_role == "employer")
                    {
                        Session["Username"] = userexist;
                        Session["UserID"] = idexist;
                        Session["Role"] = user_role;
                        Login_Update();
                        Response.Redirect("/users/employer/EmployerMain.aspx?Username=" +
                            Session["Username"].ToString() + "&UserID=" + Session["UserID"].ToString());
                    }
                    else if (username.Text == userexist && EncryptedPass == passexist && user_role == "admin")
                    {
                        Session["Username"] = userexist;
                        Session["UserID"] = idexist;
                        Session["Role"] = user_role;
                        Login_Update();
                        Response.Redirect("/users/administrator/AdminMain.aspx?Username=" +
                            Session["Username"].ToString() + "&UserID=" + Session["UserID"].ToString());
                    }

                    else
                    {
                        wrong.ForeColor = System.Drawing.Color.Red;
                        wrong.Text = "Username/Password Incorrect";

                    }

                }

            }
            catch (SqlException ex)
            {

            }
            finally
            {
                cn.Close();
            }

        }
        else
        {
            wrong.ForeColor = System.Drawing.Color.Red;
            wrong.Text = "Username/Password Empty";
        }


    }

    // users session update during LOGIN
    public void Login_Update()
    {
        SqlConnection cn = new SqlConnection(Getconnection());

        DataSet ds = new DataSet();

        try
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE users SET last_login=GETDATE() WHERE id=" + Session["UserID"].ToString(), cn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            cmd.ExecuteNonQuery();

        }
        catch (SqlException ex)
        {

        }
        finally
        {
            cn.Close();


        }
    }
    protected void login_Click(object sender, EventArgs e)
    {
        login_user();
    }
}