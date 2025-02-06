using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
public partial class reset_password : System.Web.UI.Page
{
    public string Getconnection()
    {
        return
            System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void code_verified()
    {
        SqlConnection cn = new SqlConnection(Getconnection());

        try
        {
            if (cn.State == ConnectionState.Closed)
            {
                cn.Open();
            }

            SqlCommand cmd = new SqlCommand("code_verified", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cn;
            cmd.Parameters.AddWithValue("@code",verify_code.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            
        }
        catch (SqlException ex)
        {
        }
        finally
        {
            cn.Close();
        }
    }


    public void verify_secret_code()
    {
        SqlConnection cn = new SqlConnection(Getconnection());
        DataTable dt = new DataTable();
        string secret_code = verify_code.Text;
        int row_count;
        int i;
        try
        {
            if (cn.State == ConnectionState.Closed)
            {
                cn.Open();
            }
           
            SqlCommand cmd = new SqlCommand("select code from secret_code where used=0", cn);
            cmd.CommandType = CommandType.Text;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            row_count = dt.Rows.Count -1;

            if (row_count > 0)
            {
                for (i = 0; i <= row_count; i++)
                {
                   string code_exist = dt.Rows[i]["code"].ToString();

                   if (secret_code == code_exist)
                   {
                       code_verified();
                       verify_code.Enabled = false;
                       verify_code.Visible = false;
                       Verify.Visible = false;
                       re_reset_password.Visible = true;
                       reset_password_1.Visible = true;
                       reset_password_button.Visible = true;
                       password.Visible = true;
                       password_2.Visible = true;
                       secret_code_status.Text = "Reset Your Password";
                       status.Text = "Thank You! "+"     "+"Your code has been successfully verified";
                   }
                   
                }
            }
            else
            {
                status.ForeColor = System.Drawing.Color.Red;
                status.BackColor = System.Drawing.Color.White;
                status.Text = "Invalid OR Already Used Code";
            }

        }
        catch (SqlException ex)
        {
            status.Text = ex.ToString();
        }
        finally
        {
            cn.Close();
        }
    }
    protected void Verify_Click(object sender, EventArgs e)
    {
        verify_secret_code();
    }
    protected void reset_password_button_Click(object sender, EventArgs e)
    {
        string userid = Request.QueryString["Verified_ID"].ToString();
        string password1 = FormsAuthentication.HashPasswordForStoringInConfigFile(reset_password_1.Text, "SHA1");
        string password2 = FormsAuthentication.HashPasswordForStoringInConfigFile(re_reset_password.Text, "SHA1");
        SqlConnection cn = new SqlConnection(Getconnection());
        if (reset_password_1.Text != "" && password1 == password2)
        {
            try
            {
                if (cn.State == ConnectionState.Closed)
                {
                    cn.Open();
                }

                SqlCommand cmd = new SqlCommand("changepassword", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = cn;
                cmd.Parameters.AddWithValue("@userid", userid);
                cmd.Parameters.AddWithValue("@password", password2);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                status.BackColor = System.Drawing.Color.White;
                status.ForeColor = System.Drawing.Color.Blue;
                login.Visible = true;
                re_reset_password.Visible = false;
                reset_password_1.Visible = false;
                reset_password_button.Visible = false;
                password.Visible = false;
                password_2.Visible = false;
                status.Text = "Congratulation!" + "     " + "Your Password Has been Successfully Changed";
            }
            catch (SqlException ex)
            {
            }
            finally
            {
                cn.Close();
            }
        }
    }
    protected void login_Click(object sender, EventArgs e)
    {
        Response.Redirect("default.aspx");
    }
}