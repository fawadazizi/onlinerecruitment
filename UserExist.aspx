<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserExist.aspx.cs" Inherits="UserExist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="head">
        
        <asp:Image ID="header" runat="server" ImageUrl="~/images/applyonline.png" Width="100%" />
        <div id="myslidemenu" class="jqueryslidemenu">
<ul>
<li><a href="default.aspx">HOME</a></li>
<li><a href="#">Apply</a></li>

<li><a href="SearchJobs.aspx">SearchJobs</a></li>
<li><a href="#">Recent Jobs</a>
  <ul>
  <li><a href="#">HeadQuarter (Kabul)</a></li>
  <li><a href="#">Branchs (Provinces)</a>
    <ul>
    <li><a href="#">KABUL 1</a></li>
    <li><a href="#">KABUL 2</a></li>
    <li><a href="#">Charikar</a></li>
    <li><a href="#">Bamyan</a></li>
        <li><a href="#">Mazar-e-sherif</a></li>
        <li><a href="#">Kundoz</a></li>
        <li><a href="#">Taloqan</a></li>
        <li><a href="#">Faizabad</a></li>
        <li><a href="#">Maimana</a></li>
        <li><a href="#">Qaysar</a></li>
        <li><a href="#">Sheberghan</a></li>
        <li><a href="#">Andkhoy</a></li>
        <li><a href="#">Herat</a></li>
    </ul>
  </li>
  </ul>
</li>
    <li><a href="#">LogIn</a>
  <ul>
  <li><a href="#">Administrator</a></li>
  <li><a href="#">Employer</a></li>
  <li><a href="#">Joob Seeker</a></li>
  </ul>
</li>
     <li><a href="#">Documents</a>
  <ul>
  <li><a href="#">Application Form</a></li>
  <li><a href="#">Policies</a></li>
  <li><a href="#">Sub Item 1.3</a></li>
  <li><a href="#">Sub Item 1.4</a></li>
  </ul>
</li>
<li><a href="#">ContactUs</a></li>
</ul>
<br style="clear: left" />
</div>
    </div>

    <div id="User_Exist">

        <p>Sorry! the selected username/emailid has been <strong>Already Taken</strong> by another person , please try another username + number</p>
        <br />
        <a href="Apply.aspx">Click Here</a> To Go Back
    </div>
</asp:Content>

