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

public partial class register : System.Web.UI.Page
{
    public string Getconnection()
    {
        return
            System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            wrong.Text = Request.QueryString["password"];
           
            getvalues();
        }
        
    }

    public void getvalues()
    {

        


        string username,password, firstname,lastname,email,birthdate,gender1,exp,edu,country,province,city,phone,address;
        username = Request.QueryString["username"].ToString();
        password = Request.QueryString["password"].ToString();
        firstname = Request.QueryString["firstname"].ToString();
        lastname = Request.QueryString["lastname"].ToString();
        email = Request.QueryString["email"].ToString();
        birthdate = Request.QueryString["birthdate"].ToString();
        gender1 = Request.QueryString["gender"].ToString();
        exp = Request.QueryString["exp"].ToString();
        edu = Request.QueryString["edu"].ToString();
        country = Request.QueryString["country"].ToString();
        province = Request.QueryString["province"].ToString();
        city = Request.QueryString["city"].ToString();
        phone = Request.QueryString["phone"].ToString();
        address = Request.QueryString["address"].ToString();

        reg_username.Enabled = false;
        reg_password.Enabled = false;
        reg_first_name.Enabled = false;
        reg_last_name.Enabled = false;
        emailid.Enabled = false;
        reg_BirthDate.Enabled = false;
        gender.Enabled = false;
        reg_exp.Enabled = false;
        reg_education.Enabled = false;
        reg_user_country.Enabled = false;
        reg_user_province.Enabled = false;
        reg_address.Enabled = false;
        reg_phone.Enabled = false;
        retype_reg_password.Enabled = false;
        reg_user_city.Enabled = false;
        //---------------------------------------------
        reg_username.Text = username;
        reg_password.Text = password;
        reg_first_name.Text = firstname;
        reg_last_name.Text = lastname;
        emailid.Text = email;
        reg_BirthDate.Text = birthdate;
        gender.Text = gender1;
        reg_exp.Text = exp;
        reg_education.Text = edu;
        reg_user_country.Text = country;
        reg_user_province.Text = province;
        reg_user_city.Text = city;
        reg_phone.Text = phone;
        reg_address.Text = address;


    }
    protected void AjaxFileUpload_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {

       
            string strLongFilePath = e.FileName;
            string FileExtenstion = System.IO.Path.GetExtension(strLongFilePath);
            char[] ch = new char[] { '\\' };
            string[] strPath = strLongFilePath.Split(ch);
            string strInternalFilename = reg_first_name.Text + reg_last_name.Text + "_"+ reg_phone.Text + FileExtenstion;
            string DestinationPath = Server.MapPath("~/uploads/");
            AjaxFileUpload.SaveAs(@DestinationPath + strInternalFilename);
       
            
       
        
    }
    protected void register_user_button_Click(object sender, EventArgs e)
    {

        register_job_seeker();
        
      
        
    }
    // Check For Existing User
    public void check_user()
    {
        SqlConnection cn = new SqlConnection(Getconnection());

        DataTable dt = new DataTable();
        int i;
        int row_count;
        string userexits, emailexist;

        try
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand("SELECT username,email FROM users", cn);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            row_count = dt.Rows.Count -1;

            for (i = 0; i <= row_count; i++)
            {
                userexits = dt.Rows[i]["username"].ToString();
                emailexist = dt.Rows[i]["email"].ToString();
               
                if (userexits == reg_username.Text || emailexist == emailid.Text)
                {
                    Response.Redirect("UserExist.aspx");
                }
                else
                {
                    

                }

            }

        }
        catch (SqlException ex)
        {
            success.Text = ex.ToString();
        }
        finally
        {
            cn.Close();
        }

    }
    //job seekr registeration method
    public void register_job_seeker()
    {
        int maxSize = 9000000;
        int file_size = imageupload.PostedFile.ContentLength;
        if (imageupload.HasFile && file_size <= maxSize)
        {
            byte[] image = new byte[imageupload.PostedFile.ContentLength];
            HttpPostedFile post = imageupload.PostedFile;
            post.InputStream.Read(image, 0, (int)imageupload.PostedFile.ContentLength);

            SqlConnection con = new SqlConnection(Getconnection());
            string EncryptedPassword = Request.QueryString["password"];


            SqlCommand cmd = new SqlCommand("create_jobseeker", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;

            cmd.Parameters.AddWithValue("@username", reg_username.Text);
            cmd.Parameters.AddWithValue("@password", EncryptedPassword);
            cmd.Parameters.AddWithValue("@user_role", "jobseeker");
            cmd.Parameters.AddWithValue("@first_name", reg_first_name.Text);
            cmd.Parameters.AddWithValue("@last_name", reg_last_name.Text);
            cmd.Parameters.AddWithValue("@email", emailid.Text);
            cmd.Parameters.AddWithValue("@dob", reg_BirthDate.Text);
            cmd.Parameters.AddWithValue("@gender", gender.Text);
            cmd.Parameters.AddWithValue("@expr", reg_exp.Text);
            cmd.Parameters.AddWithValue("@edu", reg_education.Text);
            cmd.Parameters.AddWithValue("@country", reg_user_country.Text);
            cmd.Parameters.AddWithValue("@province", reg_user_province.Text);
            cmd.Parameters.AddWithValue("@city", reg_user_city.Text);
            cmd.Parameters.AddWithValue("@phone", reg_phone.Text);
            cmd.Parameters.AddWithValue("@address", reg_address.Text);
            cmd.Parameters.AddWithValue("@photo", image);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            success.ForeColor = System.Drawing.Color.Green;
            success.Text = "Saved Successfully";
            Response.Redirect("register_success.aspx");
        }
        else
        {
            size_exceeded.ForeColor = System.Drawing.Color.Red;
            size_exceeded.Text = "Size of File Must not Exceed from 1 MB";
        }
        
            
        }

       
            
       

       
    

    

    protected void back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Apply.aspx");
    }
}