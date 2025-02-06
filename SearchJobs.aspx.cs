using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class SearchJobs : System.Web.UI.Page
{
    public string Getconnection()
    {
        return
            System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        JobListView();
    }


    public void JobListView()
    {

        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        SqlConnection cn = new SqlConnection(Getconnection());

        try
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "SELECT * FROM career WHERE  DATEDIFF(DAY,GETDATE(),closing_date) >=0 ORDER BY post_date DESC";
            job_list.DataSource = cmd.ExecuteReader();
            job_list.DataBind();

        }
        catch (SqlException ex)
        {
        }
        finally
        {
            cn.Close();
        }

    }

    protected void job_list_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "jobdetails")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow Row = job_list.Rows[index];
            Response.Redirect("JobDetails.aspx?vacancyid="+Row.Cells[0].Text);
        }
    }
}