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

public partial class Apply : System.Web.UI.Page
{
    public string Getconnection()
    {
        return
            System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString();
    }
    string filename;

    
    protected void Page_Load(object sender, EventArgs e)
    {
        reg_password.Attributes.Add("value", reg_password.Text);
        retype_reg_password.Attributes.Add("value", retype_reg_password.Text);
        Check_Session(); 
        getcountries();
      
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
    public void getcountries()
    {
        SqlConnection cn = new SqlConnection(Getconnection());
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT CountryName from Country", cn);
            cn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
               countrylist.Items.Add(dr["CountryName"].ToString());

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

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static string[] SearchCountry(string prefixText, int count)
    {
        SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString());

        List<string> items = new List<string>();
        SqlCommand cmd = new SqlCommand("SELECT CountryName from Country WHERE CountryName Like @country + '%'", cn);
        cmd.Parameters.AddWithValue("@country", prefixText);
        cn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            items.Add(dr["CountryName"].ToString());
        }

        string[] prefixTextArray = items.ToArray<string>();

        return prefixTextArray;

       

    }

    
/*
    public void Country_List()
    {
        SqlConnection cn = new SqlConnection(Getconnection());

        SqlCommand cmd = new SqlCommand("SELECT CountryName from Country WHERE CountryName Like @country + '%'", cn);
        cmd.Parameters.AddWithValue("@country", reg_user_country.Text);
        cn.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        List<string> str = new List<string>();
        while (dr.Read())
        {
          str.Add(dr["CountryName"].ToString());
        }
       
      
        
        
        countrylist.DataSource = str;
        countrylist.DataBind();
        cn.Close();
        dr.Close();

        
    } */

    

    public  void valid_age()
    {
        string datetime = reg_BirthDate.Text;
        DateTime birthdate = Convert.ToDateTime(datetime);
        int age = ((DateTime.Now.Year - birthdate.Year) * 372 + (DateTime.Now.Month - birthdate.Month) * 31
            + (DateTime.Now.Day - birthdate.Day)) / 372;

        if (age < 18)
        {
            register_user_button.Enabled = false;
            register_user_button.Text = "Invalid Age";
            display_age.ForeColor = System.Drawing.Color.Red;
            display_age.Text = "Not Valid Age";
        }
        else if (age > 18)
        {
            register_user_button.Enabled = true;
            register_user_button.Text = "Next";
            display_age.ForeColor = System.Drawing.Color.Green;
            display_age.Text = age.ToString();
        }
        else {
            register_user_button.Enabled = false;
            register_user_button.Text = "InvalidValue";

        
        }

       
    }


    // Check For Existing User
    public void login()
    {
        SqlConnection cn =  new SqlConnection(Getconnection());
       
        DataTable dt = new DataTable();
        int i;
        int row_count;
        string user_role, userexist, passexist, idexist;
        if (username.Text != "" || userpassword.Text != "")
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

                    string EncryptedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(userpassword.Text, "SHA1");

                    if (username.Text == userexist && EncryptedPass == passexist && user_role == "jobseeker")
                    {
                        
                        Session["Username"] = userexist;
                        Session["UserID"] = idexist;
                        Session["Role"] = user_role;
                        Login_Update();
                Response.Redirect("/users/jobseeker/JobSeekerMain.aspx?Username="+
                    Session["Username"].ToString()+"&UserID="+Session["UserID"].ToString());
                
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
                        wrongpass.ForeColor = System.Drawing.Color.Red;
                        wrongpass.Text = "Username/Password Incorrect";

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
            wrongpass.ForeColor = System.Drawing.Color.Red;
            wrongpass.Text = "Username/Password Empty";
        }
       

    }

    // users session update during LOGIN
    public void Login_Update()
    {
        SqlConnection cn = new SqlConnection(Getconnection());

        DataSet ds = new DataSet();

        try {
            cn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE users SET last_login=GETDATE() WHERE id="+Session["UserID"].ToString() , cn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            cmd.ExecuteNonQuery();
        
        }
        catch(SqlException ex) {
        
        }
        finally {
            cn.Close();

        
        }
    }
    
    protected void register_user_button_Click(object sender, EventArgs e)
    {
        if (reg_password.Text == retype_reg_password.Text)
        {
            string EncryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(reg_password.Text, "SHA1");

            Response.Redirect("register.aspx?username=" + reg_username.Text + "&password=" + EncryptedPassword + "&firstname=" + reg_first_name.Text + "&lastname=" + reg_last_name.Text +
               "&email=" + emailid.Text + "&birthdate=" + reg_BirthDate.Text + "&gender=" + gender.Text + "&exp=" + reg_exp.Text +
               "&edu=" + reg_education.Text + "&country=" + reg_user_country.Text +
               "&province=" + reg_user_province.Text + "&city=" + reg_user_city.Text + "&phone=" + reg_phone.Text +
               "&address=" + reg_address.Text
                );

        }
        else
        {
            wrongpass.Text = "Password didn't Match";
        }
        
       
    }
    protected void educationselect_SelectedIndexChanged(object sender, EventArgs e)
    {
        reg_education.Text = educationselect.SelectedValue;
    }
    protected void expselect_SelectedIndexChanged(object sender, EventArgs e)
    {
        reg_exp.Text = expselect.SelectedValue;
    }
    protected void genderselect_SelectedIndexChanged(object sender, EventArgs e)
    {
        gender.Text = genderselect.SelectedValue;
    }



    protected void login_user_button_Click(object sender, EventArgs e)
    {
        login();
    }


    /*

    public static string CheckUsername(string username)
    {
        string constring = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

        string returnvalue = string.Empty;

        try
        {
            SqlConnection conn = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand("CheckUserAvailability", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserName", username.Trim());
            conn.Open();
            returnvalue = cmd.ExecuteScalar().ToString();
            conn.Close();

        }
        catch  {
            returnvalue = "error";
        }
        return returnvalue;
    }
     */
    protected void reg_username_TextChanged(object sender, EventArgs e)
    {
        int username_lenght = reg_username.Text.Length;
       
        if (!string.IsNullOrEmpty(reg_username.Text))
        {
            SqlConnection cn = new SqlConnection(Getconnection());
            try
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("SELECT username FROM users WHERE username=@UserName", cn);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@UserName", reg_username.Text);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    checkuser.ForeColor = System.Drawing.Color.Red;
                    checkuser.Text = "NotAvailable";
                    register_user_button.Enabled = false;
                    register_user_button.Text = "UserTaken";
                }
                else
                {
                    checkuser.ForeColor = System.Drawing.Color.Green;
                    checkuser.Text =  "Available";
                    register_user_button.Enabled = true;
                    register_user_button.Text = "Next";
                }
            }
            catch ( SqlException ex)
            {
            }
            finally {
                cn.Close();
            }

          

        }
        
        
    }
    protected void reg_BirthDate_TextChanged(object sender, EventArgs e)
    {
        valid_age();
    }



    protected void provincelist_SelectedIndexChanged(object sender, EventArgs e)
    {
        reg_user_province.Text = provincelist.SelectedValue;
    }
    protected void citylist_SelectedIndexChanged(object sender, EventArgs e)
    {
        reg_user_city.Text = citylist.SelectedValue;
    }
    protected void countrylist_SelectedIndexChanged(object sender, EventArgs e)
    {

        reg_user_country.Text = countrylist.SelectedValue;
        if (countrylist.SelectedIndex == 0)
        {
            provinceExtender.Enabled = true;
            provincelist.Visible = true;
            cityExternder.Enabled = true;
            citylist.Visible = true;
            SqlConnection cn = new SqlConnection(Getconnection());
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT province,city from afg_provinces ORDER BY province", cn);
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    provincelist.Items.Add(dr["province"].ToString());
                    citylist.Items.Add(dr["city"].ToString());

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
            provinceExtender.Enabled = false;
            provincelist.Visible = false;
            cityExternder.Enabled = false;
            citylist.Visible = false;
        }

        }






    protected void Clear_form2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Apply.aspx");
    }

    public void Check_Email()
    {
        if (!String.IsNullOrEmpty(emailid.Text))
        {
            SqlConnection cn = new SqlConnection(Getconnection());
            try
            {
                cn.Open();
                SqlCommand cmd = new SqlCommand("SELECT username FROM users WHERE email=@Email", cn);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Email", emailid.Text);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    email_result.ForeColor = System.Drawing.Color.Red;
                    email_result.Text = "Email Already Registered";
                    register_user_button.Enabled = false;
                    register_user_button.Text = "Email Exist";
                }
                else
                {
                    email_result.ForeColor = System.Drawing.Color.Green;
                    email_result.Text = "Available";
                    register_user_button.Enabled = true;
                    register_user_button.Text = "Next";
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
    }
    protected void emailid_TextChanged(object sender, EventArgs e)
    {
        Check_Email();
    }
}