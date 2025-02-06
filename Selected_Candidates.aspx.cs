using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class Selected_Candidates : System.Web.UI.Page
{
    public string GetConnection()
    {
        return
            System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString();

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        ConfigureCrystalReports();
    }

    ReportDocument rpt = new ReportDocument();
    private void ConfigureCrystalReports()
    {
        string BeginDate = Request.QueryString["From"].ToString();
        string EndDate = Request.QueryString["To"].ToString();

        rpt.Load(Server.MapPath("selected_candidates.rpt"));
        ConnectionInfo connectionInfo = new ConnectionInfo();
        connectionInfo.DatabaseName = "OAFWebsite";
        connectionInfo.ServerName = @"10.1.12.2\sqlexpress";

        connectionInfo.UserID = "sa";
        connectionInfo.Password = "IT@oxus@sql";
        SetDBLogonForReport(connectionInfo, rpt);
        rpt.SetParameterValue("@BeginDate", BeginDate);
        rpt.SetParameterValue("@EndDate", EndDate);

        selected.ReportSource = rpt;
    }

    private void SetDBLogonForReport(ConnectionInfo connectionInfo, ReportDocument rpt)
    {

        Tables tables = rpt.Database.Tables;
        foreach (CrystalDecisions.CrystalReports.Engine.Table table in tables)
        {
            TableLogOnInfo tableLogonInfo = table.LogOnInfo;
            tableLogonInfo.ConnectionInfo = connectionInfo;
            table.ApplyLogOnInfo(tableLogonInfo);

        }
    }

    protected void Page_Unload(Object sender, EventArgs e)
    {
        if (this.rpt != null)
        {
            rpt.Close();
            rpt.Dispose();
        }
    }
    protected void close_Click(object sender, EventArgs e)
    {
        rpt.Close();
        rpt.Dispose();
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
            Response.Redirect("/users/employer/Reports.aspx?Username=" +
                        Session["Username"].ToString() + "&UserID=" + Session["UserID"].ToString());
        }
        else if (Session["Username"] != null && Session["Role"].ToString() == "admin")
        {
            Response.Redirect("/users/administrator/Reports.aspx?Username=" +
                        Session["Username"].ToString() + "&UserID=" + Session["UserID"].ToString());
        }
        else
        {
            return;
        }
    }
}