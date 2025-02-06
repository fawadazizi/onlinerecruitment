<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="shortlisted.aspx.cs" Inherits="shortlisted" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div id="PageWrapper">
<div id="head">
    <asp:Image ID="header" runat="server" ImageUrl="~/images/applyonline.png" Width="100%" />
 <strong>Shortlisted Candidates</strong><br />
    <asp:Button ID="close" OnClick="close_Click" runat="server" Text="Back" />
    
    <CR:CrystalReportViewer ID="Shortlisted_Candidates" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="950px" ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" ToolPanelView="None" ToolPanelWidth="200px" Width="950px" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="short_candidates.rpt">
        </Report>
    </CR:CrystalReportSource>
    
        </div>
    </div>
</asp:Content>

