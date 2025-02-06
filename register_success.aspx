<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="register_success.aspx.cs" Inherits="register_success" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="PageWrapper">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div id="head">
    <asp:Image ID="header" runat="server" ImageUrl="~/images/applyonline.png" Width="100%" />
    <div id="jsMainContent" style="width:844px">
        <strong>Thank You! You have registered successfully  , You can login and apply for jobs</strong>
        <asp:RoundedCornersExtender ID="RoundedCornersExtender1" TargetControlID="home" runat="server"></asp:RoundedCornersExtender>
        <asp:Button ID="home" runat="server" OnClick="home_Click" Text="Home" CssClass="button" />
    </div>
    
    </div>
         </div>
</asp:Content>

