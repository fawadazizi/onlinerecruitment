<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchJobs.aspx.cs" Inherits="SearchJobs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="PageWrapper">
    <div id="head">
        
        <asp:Image ID="header" runat="server" ImageUrl="~/images/applyonline.png" Width="100%" />
        </div>
        <div id="myslidemenu" class="jqueryslidemenu">
<ul>
<li><a href="default.aspx">HOME</a></li>
<li><a href="Apply.aspx">Register</a></li>

<li><a href="#">Jobs</a></li>
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
            
    <div id="job_search_container">
        
        <asp:RoundedCornersExtender ID="RoundedCornersExtender1" TargetControlID="search_job_textbox" runat="server"></asp:RoundedCornersExtender>
       Search <asp:TextBox ID="search_job_textbox" Width="130" style="font-size:12pt" Height="25" runat="server"></asp:TextBox>
       
      
        <asp:GridView ID="job_list" runat="server" Width="690" AutoGenerateColumns="false" HeaderStyle-ForeColor="White" BackColor="Wheat" EmptyDataText="No Job Annouced Yet, Please Check Back Later" 
            EmptyDataRowStyle-BackColor="#99ccff" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-Font-Size="14pt"
             OnRowCommand="job_list_RowCommand"
         HeaderStyle-BackColor="#0099cc" HeaderStyle-Font-Bold="true">
            <Columns>
                <asp:BoundField DataField="c_id" HeaderText="Vacany#" />
                <asp:BoundField DataField="position_title" HeaderText="Job Title" />
                <asp:BoundField DataField="location" HeaderText="Location" />
                <asp:BoundField DataField="vacancyno" HeaderText="#Jobs" />
                <asp:BoundField DataField="funcarea"  HeaderText="Function Area" />
                <asp:BoundField DataField="contract_type" HeaderText="Contract Type" />
                <asp:BoundField DataField="yearof_exp" HeaderText="Experience" />
                <asp:BoundField DataField="closing_date" HeaderText="Closing Date" DataFormatString="{0:MM-dd-yyyy}" HtmlEncode="false" />
                <asp:ButtonField ButtonType="Link" Text="View Details" CommandName="jobdetails" HeaderText="Apply" />
                
            </Columns>
            
        </asp:GridView>
        
    </div>
           
       <div id="Right_Sidebar_jobSearch">

           <img src="images/agri.png" width="130" />
           <strong>What is Agriculture finance</strong>
           

               <p>
                   Financial services for 
Agriculture related
Activities primarily
Including  production 
As Well as all related 
Enterprises 

               </p>
         
           <hr />
         

           <img src="images/rural.jpg" width="130" />
             <strong>What is Rural Finance</strong>
           

               <p>
                Financial services 
For people In rural 
Areas with all income
Levels and economic
activities
 

               </p>
         
        </div>
        
       
        
        
        
         <div id="footer">
        <strong>&copy 2014  OXUS Afghanistan</strong>
        <p>Developed By OXUS Afghanistan IT Department</p>
    </div>
        </div>
</asp:Content>

