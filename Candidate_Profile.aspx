<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Candidate_Profile.aspx.cs" Inherits="Candidate_Profile" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="PageWrapper">
<div id="head">
    <asp:Image ID="header" runat="server" ImageUrl="~/images/applyonline.png" Width="100%" />
    
    <br />
    <strong>Candidate Profile Information</strong>
    <hr />
    <asp:Button ID="Close" runat="server" Text="Close" OnClick="Close_Click" />
    <CR:CrystalReportViewer ID="candidate_profile" runat="server" AutoDataBind="True" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" GroupTreeImagesFolderUrl="" Height="1202px" ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" ToolPanelView="None" ToolPanelWidth="200px" Width="1104px" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="candidate_profile.rpt">
        </Report>
    </CR:CrystalReportSource>
    </div>
         </div>

</asp:Content>

