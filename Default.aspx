<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <link href="style/default.css" rel="stylesheet" />
    <link href="style/jqueryslidemenu.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="js/jqueryslidemenu.js"></script>
    <script type="text/javascript" src="js/fadein.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="PageWrapper">
    <div id="head">
        
        <asp:Image ID="header" runat="server" ImageUrl="~/images/applyonline.png" Width="100%" />

        <div id="myslidemenu" class="jqueryslidemenu">
<ul>
<li><a href="#">HOME</a></li>
<li><a href="apply.aspx">Register</a></li>

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
    
<li><a href="#">ContactUs</a></li>

</ul>
<br style="clear: left" />
</div>
    </div>
         <marquee scrollamount="2" scrolldelay="1"onmouseout="this.start()" onmouseover="this.stop()" >
               <strong style="color:black">Attention: All applicants are required to register before applying</strong>
            </marquee>
    
        <div id="logout_panel">
            <strong>User Authentication</strong>
           <hr />

            <asp:Table ID="logoutpanel" BorderColor="Red" runat="server">
                <asp:TableHeaderRow>
                    <asp:TableCell style="font-size:20px;">
                        Username:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="username"></asp:RoundedCornersExtender>
                      <asp:TextBox ID="username" MaxLength="120" Width="150" Font-Size="Large" Height="30" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell style="font-size:20px;">
                        Password:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RoundedCornersExtender ID="RoundedCornersExtender2" runat="server" TargetControlID="password"></asp:RoundedCornersExtender>
                        <asp:TextBox ID="password" MaxLength="120" Width="150" Font-Size="Large" Height="30" runat="server" TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                    
                    <asp:TableCell>
                        <asp:RoundedCornersExtender ID="RoundedCornersExtender3" runat="server" TargetControlID="login"></asp:RoundedCornersExtender>
                        <asp:Button ID="login" CssClass="button" OnClick="login_Click" runat="server" Text="Login" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="wrong" runat="server"></asp:Label>
                      
                    </asp:TableCell>
                </asp:TableHeaderRow>
             
                <asp:TableRow>
                    
                    <asp:TableCell>
                    
                    </asp:TableCell>
                    <asp:TableCell>
                        <hr />
                        <a href="forgot_password.aspx" style="color:black;font-family:Tahoma">Forgot Your Password?</a>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            
        </div>
    <div id="MainContent" style="text-align:justify">
        <strong>History</strong><br />
        
        <span>

 

OXUS Afghanistan was created in 2007 with funding from the Microfinance Investment Support Facility for Afghanistan (MISFA), a Government Apex agency set up by international donors in 2003 in order to develop the microfinance sector in Afghanistan.

 

OXUS Afghanistan was able to build on ACTED’s experience and past programmes in the country, in particular a micro-loan initiative to provide farmers with seeds and tools for sowing. By January 2007, OXUS Afghanistan had become a registered company under Afghan law.
            Operating in Afghanistan

As a result of over 30 years of conflict and civil war, Afghanistan is one of   the world’s poorest and least developed countries. In 2009, 36% of the   Afghan population still lived below the national poverty line, 35% is officially unemployed and the HDI index stands at 0.398. At the same time, state institutions are weak, the security situation is challenging and transportation and communication infrastructure is very limited. Nonetheless, with the help of the international community, the Afghan economy has seen significant recovery with GDP growing steadily and standing at 7.1% at December 2011, while the socio-economic situation is improving, particularly in the regions under the authority of the central government.
 

Due to the low penetration of commercial banks in rural areas –hardly 1.76 commercial bank branches per 100,000 adults- and the lack of microfinance institutions (MFIs), Afghanistan is an extremely promising market – more than most other Asian countries. With a population of just over 30 million and a growing economy, many micro entrepreneurs and small and medium sized enterprises are in need of funding and investment. So far, few MFIs have been as successful as OXUS in providing financial services to customers who are often receiving their very first loan.
        </span>
        
    </div>
    <br />
      

    <div id="leftsidebar">

    </div>

    <div id="rightsidebar">


    </div>
        <hr />
        <div id="footer">
        <strong>&copy 2014  OXUS Afghanistan</strong>
        <p>Developed By OXUS Afghanistan IT Department</p>
    </div>
    </div>
    
    
</asp:Content>

