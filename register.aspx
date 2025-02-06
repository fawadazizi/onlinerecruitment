<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    <div id="PageWrapper">
    <div id="head">
        <asp:Label ID="wrong" runat="server"></asp:Label>
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
    <div id="MainContent">
        <hr />
        

    </div>

    <div id="user_register_form">
        <br />
        <strong style="font-size:14pt;">Preview Information</strong>
        <asp:Table ID="register_user" runat="server" CellPadding="0" CellSpacing="0">
            <asp:TableHeaderRow>
                <asp:TableCell>
                  success: <asp:label id="success" runat="server"></asp:label>
                    <strong>Personal Info</strong>
                   <hr />
                </asp:TableCell>
                
            </asp:TableHeaderRow>
           <asp:TableRow>
               <asp:TableCell>
                   <br />
               </asp:TableCell>
           </asp:TableRow>
            <asp:TableRow>
               
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender3" runat="server" TargetControlID="reg_username"></asp:RoundedCornersExtender>
                    Username:<asp:TextBox ID="reg_username" runat="server" Width="130" style="font-size:12pt" Height="25" ></asp:TextBox>
                    
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender4" runat="server" TargetControlID="reg_password"></asp:RoundedCornersExtender>
                    Password:<asp:TextBox ID="reg_password" runat="server" TextMode="Password" Width="130" style="font-size:12pt" Height="25" ></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender5" TargetControlID="retype_reg_password" runat="server"></asp:RoundedCornersExtender>
                    Re-Type Password<asp:TextBox ID="retype_reg_password" TextMode="Password" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <br />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender6" TargetControlID="reg_first_name" runat="server"></asp:RoundedCornersExtender>
                   FirstName: <asp:TextBox ID="reg_first_name" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender7" TargetControlID="reg_last_name" runat="server"></asp:RoundedCornersExtender>
                   LastName: <asp:TextBox ID="reg_last_name" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender8" TargetControlID="emailid" runat="server"></asp:RoundedCornersExtender>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:<asp:TextBox ID="emailid" runat="server" Width="180" Height="25" style="font-size:12pt"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <br />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender13" TargetControlID="reg_BirthDate" runat="server"></asp:RoundedCornersExtender>
                    <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="reg_BirthDate" runat="server"></asp:CalendarExtender>
                   BirthDate: <asp:TextBox ID="reg_BirthDate" runat="server" Width="130" Height="25" style="font-size:12pt"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender14" TargetControlID="gender" runat="server"></asp:RoundedCornersExtender>
                   
                   Gender:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="gender" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <br />
                    <hr />
                    <strong>Experience & Education</strong>
                    
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <br />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender15" TargetControlID="reg_exp" runat="server"></asp:RoundedCornersExtender>
                   Expereince: <asp:TextBox ID="reg_exp" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                    
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender16" TargetControlID="reg_education" runat="server"></asp:RoundedCornersExtender>
                   Education: <asp:TextBox ID="reg_education" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                   
                </asp:TableCell>
                <asp:TableCell>
                   <p style="color:green"><strong>Upload Your Resume/CV</strong> </p><asp:AjaxFileUpload ID="AjaxFileUpload" runat="server" OnUploadComplete="AjaxFileUpload_UploadComplete" AllowedFileTypes="docx,doc,pdf" MaximumNumberOfFiles="2"/>
                    <asp:Label ID="size_exceeded" runat="server"></asp:Label>
                    <br />
                   
                    <asp:RequiredFieldValidator ID="photo" runat="server" ControlToValidate="imageupload" ForeColor="Red" ErrorMessage="Select Your Photo"></asp:RequiredFieldValidator>
                   Profile Photo:<asp:FileUpload ID="imageupload" runat="server" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>


                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
             
                <asp:TableCell>
                    <br />
                    <hr />
                   <strong>Address</strong>
                  
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                
                <asp:TableCell>
                    
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender9" TargetControlID="reg_user_country" runat="server"></asp:RoundedCornersExtender>
                   Country:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="reg_user_country" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender10" TargetControlID="reg_user_province" runat="server"></asp:RoundedCornersExtender>
                    Province/State<asp:TextBox ID="reg_user_province" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender12" TargetControlID="reg_user_city" runat="server"></asp:RoundedCornersExtender>
                   City: <asp:TextBox ID="reg_user_city" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <br />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender17" TargetControlID="reg_phone" runat="server"></asp:RoundedCornersExtender>
                    Phone#<asp:TextBox ID="reg_phone" Width="160" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <br />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender11" TargetControlID="reg_address" runat="server"></asp:RoundedCornersExtender>
                    Address:<asp:TextBox ID="reg_address" TextMode="MultiLine" Width="180" Wrap="true"  Height="150" style="font-size:10pt" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <br />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender2" TargetControlID="register_user_button" runat="server"></asp:RoundedCornersExtender>
                    <asp:Button ID="register_user_button" CssClass="button" OnClick="register_user_button_Click"  runat="server" Text="Register"  style="font-size:12pt" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender1" TargetControlID="back" runat="server"></asp:RoundedCornersExtender>
                    <asp:Button ID="back" OnClick="back_Click" CssClass="button"  style="font-size:12pt" runat="server" Text="Back" />
                </asp:TableCell>
            </asp:TableRow>
           
        </asp:Table>
    </div>
        <hr />
        <div id="footer">
        <strong>&copy 2014  OXUS Afghanistan</strong>
        <p>Developed By OXUS Afghanistan IT Department</p>
    </div>
        </div>
</asp:Content>

