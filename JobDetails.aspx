<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="JobDetails.aspx.cs" Inherits="JobDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="PageWrapper">
    <div id="head">
        
        <asp:Image ID="header" runat="server" ImageUrl="~/images/applyonline.png" Width="100%" />
        <div id="myslidemenu" class="jqueryslidemenu">
<ul>
<li><a href="default.aspx">HOME</a></li>
<li><a href="Apply.aspx">Register</a></li>

<li><a href="SearchJobs.aspx">Jobs</a></li>
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
    
    <div id="job_details_container">
        
        <br /><br />
        

        <asp:Table runat="server" ID="jobdesc" CellPadding="0" CellSpacing="0">
            <asp:TableRow>
                <asp:TableCell>
                    
                </asp:TableCell>
                <asp:TableCell>
                    <strong>
                        <asp:Label ID="registerfirst" runat="server"></asp:Label>
                        <asp:LinkButton ID="register" runat="server" Text="Register" OnClick="register_Click" Visible="false"></asp:LinkButton><br />
                        <hr />
                        <asp:Label ID="login_1" runat="server"></asp:Label>
                        <asp:LinkButton ID="login" runat="server" Text="Login" OnClick="login_Click" Visible="false"></asp:LinkButton>
                    </strong>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableHeaderRow>
                <asp:TableCell>
                    
                    <strong>Job Description</strong>
                </asp:TableCell>
            </asp:TableHeaderRow>
           <asp:TableRow>
               
               <asp:TableCell>
                   <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
               </asp:TableCell>
               
               
               
           </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                   <p style="font-size:12pt;color:black">Position:</p> 
                </asp:TableCell>
                <asp:TableCell>&nbsp<asp:Label ID="position" runat="server"></asp:Label></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <p style="font-size:12pt;color:black">Location: </p>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="location" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <p style="font-size:12pt;color:black">Function Area: </p>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="funcarea" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <p style="font-size:12pt;color:black">Contract Type: </p>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="contract_type" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <p style="font-size:12pt;color:black">Experience:</p> <p style="font-size:12pt;color:black"></p>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="exp" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <p style="font-size:12pt;color:black">Closing Date:</p>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="closing_date" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableFooterRow>
                <asp:TableCell>
                    
                </asp:TableCell>
            </asp:TableFooterRow>
        </asp:Table>
        
        <div id="job_desc">
                       <p>Description</p>
                       <asp:Label ID="description" runat="server"></asp:Label>
            <hr />
                   </div>
        
      
           <asp:RoundedCornersExtender ID="RoundedCornersExtender1" TargetControlID="apply" runat="server"></asp:RoundedCornersExtender>
        <asp:Button ID="apply" runat="server" CssClass="button" OnClick="apply_Click" Text="Apply" />
       
        
        
      
    </div>
        <hr />
        <div id="footer">
        <strong>&copy 2014  OXUS Afghanistan</strong>
        <p>Developed By OXUS Afghanistan IT Department</p>
    </div>
        </div>
</asp:Content>

