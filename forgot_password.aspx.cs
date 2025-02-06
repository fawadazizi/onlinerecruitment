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
using System.Net.Mail;
public partial class forgot_password : System.Web.UI.Page
{
    public string Getconnection()
    {
        return
            System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString();
    }

    string secret_codeid, idexist;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public void generate_secret_code()
    {
        Guid secret = Guid.NewGuid();
        secret_codeid = secret.ToString("N").ToUpper();
        Response.Write(secret_codeid.Substring(2,5));

    }


    public void store_code()
    {
        SqlConnection cn = new SqlConnection(Getconnection());
        DataSet ds = new DataSet();
        try
        {

            if (cn.State == ConnectionState.Closed)
            {
                cn.Open();
            }
            SqlCommand cmd = new SqlCommand("store_secret_code", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cn;
            cmd.Parameters.AddWithValue("@secret_code", secret_codeid);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
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

    public void send_valid_email()
    {
        try
        {

            MailMessage valid_email = new MailMessage();
            valid_email.IsBodyHtml = true;
            valid_email.To.Add(email_id.Text);
            valid_email.From = new MailAddress("it@oxusaf.org");
            valid_email.Subject = "ResetPassword";
            valid_email.Body = "<h3>Greetings from OXUS Afghanistan Information Technology Department</h3>"+"<p>Bellow is Information for reseting your password</p><br/><p>click on link bellow , copy and paste the bellow secret code in redirected page click verify</p>"+ "<br>"+"<a href=hr.oxusaf.org/reset_password.aspx?Verified_ID=" +idexist+" "+"<h4>Reset Link</h4></a>"+"</br>          "+ "<b>Secret Code:</b>"+"    " + secret_codeid.ToUpper()+"<br/>";
            SmtpClient smtp = new SmtpClient("oxusaf.org");
            smtp.Send(valid_email);
            

        }
        catch (Exception ex)
        {
            status.Text = "Could not send the email - error"+ ex.ToString();
        }
       
    }

    public void validate_email()
    {
        SqlConnection cn = new SqlConnection(Getconnection());
        DataTable dt = new DataTable();
        int row_count;
        int i;
        string emailexist;
        try
        {
            if (cn.State == ConnectionState.Closed)
            {
                cn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT id,email FROM users", cn);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);

            row_count = dt.Rows.Count -1;

            if (row_count > 0)
            {
                for (i = 0; i <= row_count; i++)
                {
                    idexist = dt.Rows[i]["id"].ToString();
                    emailexist = dt.Rows[i]["email"].ToString();

                    if (emailexist == email_id.Text)
                    {
                        generate_secret_code();
                        store_code();
                        send_valid_email();
                        status.Text = "Thank You! An email with Secret Code has been sent to" + "   " + emailexist;
                        Verify.Visible = false;
                    }
                   
                   
                }
            }
            else
            {
                
                status.Text = "Sorry! This email is not Valid";
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
        validate_email();
    }

   
}