using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class JobDetails : System.Web.UI.Page
{

    public string GetConnection()
    {
        return
            System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //View job Details

       
            JobListView();
       


    }




    // this method show job list according to id specified
    public void JobListView()
    {
        SqlConnection cn = new SqlConnection(GetConnection());
        try
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM career WHERE c_id="+ Request.QueryString["vacancyid"], cn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    position.Text = dr["position_title"].ToString();
                    location.Text = dr["location"].ToString();
                    funcarea.Text = dr["funcarea"].ToString();
                    contract_type.Text = dr["contract_type"].ToString();
                    exp.Text = dr["yearof_exp"].ToString() +"  "+ "Year(s)";
                    description.Text = dr["job_disc"].ToString();
                    closing_date.Text = dr["closing_date"].ToString();
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
    protected void apply_Click(object sender, EventArgs e)
    {
        register.Visible = true;
        login.Visible = true;
        registerfirst.ForeColor = System.Drawing.Color.Red;
        registerfirst.Text = "Sorry! You are not registered with us , please register first";
        login_1.ForeColor = System.Drawing.Color.Red;
        login_1.Text = "Or if you have username/password login here";
    }
    protected void register_Click(object sender, EventArgs e)
    {
        Response.Redirect("Apply.aspx");
    }

    protected void login_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}