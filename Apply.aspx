<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="Apply.aspx.cs" Inherits="Apply" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
       
    </asp:ScriptManager>
    <div id="PageWrapper">
       
    
    <div id="head">
        
        <asp:Image ID="header" runat="server" ImageUrl="~/images/applyonline.png" Width="100%" />
        <div id="myslidemenu" class="jqueryslidemenu">
<ul>
<li><a href="default.aspx">HOME</a></li>
<li><a href="#">Register</a></li>

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
     
        <asp:Table runat="server" CssClass="LoginTable" ID="register" CellPadding="0" CellSpacing="0">
            
        <asp:TableRow>
            
            <asp:TableHeaderCell>
                
                <strong>Login To My Account</strong>
                <br />
           
            </asp:TableHeaderCell>
                
                </asp:TableRow>
           <asp:TableRow>
               <asp:TableCell>
                
                
                <asp:RoundedCornersExtender ID="RoundedCornersExtender1" TargetControlID="username" runat="server">
                    
                </asp:RoundedCornersExtender>
                <asp:RoundedCornersExtender ID="RoundedCornersExtender2" TargetControlID="userpassword" runat="server"></asp:RoundedCornersExtender>
                Username: <asp:TextBox ID="username" runat="server" Width="130" Height="25" style="font-size:12pt" ></asp:TextBox>
            </asp:TableCell>
            
            <asp:TableCell>
               Password: <asp:TextBox ID="userpassword" TextMode="Password" Width="130" Height="25" runat="server" style="font-size:12pt"></asp:TextBox>
            </asp:TableCell>
               <asp:TableCell>
                   <br />
                  
                   
               </asp:TableCell>
           </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <a href="forgot_password.aspx">Forgot Password?</a>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender18" TargetControlID="login_user_button" runat="server"></asp:RoundedCornersExtender>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<asp:Button ID="login_user_button" CssClass="button" CausesValidation="false" OnClick="login_user_button_Click" runat="server" Text="Login"  style="font-size:12pt" />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="wrongpass" runat="server"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>

           
            
      

    </asp:Table>
        <hr />
        <br />
        <strong style="font-size:16pt;color:white;">Register For New User</strong>
    </div>
       <hr />
    <div id="user_register_form">
    <asp:UpdatePanel ID="userregistration" runat="server">
        <ContentTemplate>
              
        <br />
        <strong style="font-size:14pt;">Job Seeker Registration Form</strong>
            <hr />
        <asp:Table ID="register_user" runat="server" CellPadding="0" CellSpacing="0">
            <asp:TableHeaderRow>
                <asp:TableCell>
                   
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
                    <asp:RegularExpressionValidator ID="ValidUsername" runat="server" ControlToValidate="reg_username" ValidationExpression="^[a-zA-Z0-9]+$" ErrorMessage="Invalid" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender3" runat="server" TargetControlID="reg_username"></asp:RoundedCornersExtender>
                    Username:<asp:TextBox ID="reg_username" runat="server" AutoPostBack="true" OnTextChanged="reg_username_TextChanged" Width="130" style="font-size:12pt" Height="25" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="uname" runat="server" ControlToValidate="reg_username" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender4" runat="server" TargetControlID="reg_password"></asp:RoundedCornersExtender>
                    Password:<asp:TextBox ID="reg_password" runat="server" TextMode="Password" MaxLength="40" Width="130" style="font-size:12pt" Height="25" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="pass1" ControlToValidate="reg_password" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender5" TargetControlID="retype_reg_password" runat="server"></asp:RoundedCornersExtender>
                    Re-Type Password<asp:TextBox ID="retype_reg_password" TextMode="Password" MaxLength="40" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <br />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                   Status :&nbsp;&nbsp<strong><asp:Label ID="checkuser" runat="server"></asp:Label></strong>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender6" TargetControlID="reg_first_name" runat="server"></asp:RoundedCornersExtender>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FirstName: <asp:TextBox ID="reg_first_name" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender7" TargetControlID="reg_last_name" runat="server"></asp:RoundedCornersExtender>
                   LastName: <asp:TextBox ID="reg_last_name" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="email_required" runat="server" ForeColor="Red" ControlToValidate="emailid" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="ValidateEmail" runat="server" ControlToValidate="emailid" ForeColor="Red" ValidationExpression="^[\w!#$%&'*+\-/=?\^_`{|}~]+(\.[\w!#$%&'*+\-/=?\^_`{|}~]+)*@((([\-\w]+\.)+[a-zA-Z]{2,4})|(([0-9]{1,3}\.){3}[0-9]{1,3}))$" ErrorMessage="Invalid Email"></asp:RegularExpressionValidator>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender8" TargetControlID="emailid" runat="server"></asp:RoundedCornersExtender>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:<asp:TextBox ID="emailid" runat="server" AutoPostBack="true" OnTextChanged="emailid_TextChanged" Width="180"  Height="25" style="font-size:12pt"></asp:TextBox>
                    <br />
                    <asp:Label ID="email_result" runat="server"></asp:Label>
                </asp:TableCell>
                
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <br />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:RegularExpressionValidator ID="ValidBirthDate" runat="server" ForeColor="Red" ControlToValidate="reg_BirthDate" ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender13" TargetControlID="reg_BirthDate" runat="server"></asp:RoundedCornersExtender>
                    <asp:CalendarExtender ID="CalendarExtender1"  TargetControlID="reg_BirthDate" Format="yyyy-MM-dd" runat="server"></asp:CalendarExtender>
                   BirthDate: <asp:TextBox ID="reg_BirthDate" OnTextChanged="reg_BirthDate_TextChanged" AutoPostBack="true" runat="server" Width="130" Height="25" style="font-size:12pt"></asp:TextBox>

                </asp:TableCell>
                
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender14" TargetControlID="gender" runat="server"></asp:RoundedCornersExtender>
                    <asp:DropDownExtender ID="DropDownExtender1" TargetControlID="gender" DropDownControlID="genderselect" runat="server"></asp:DropDownExtender>
                    <asp:ListBox Width="130" ID="genderselect" AutoPostBack="true" OnSelectedIndexChanged="genderselect_SelectedIndexChanged" runat="server">
                        <asp:ListItem Value="male">Male</asp:ListItem>
                        <asp:ListItem Value="female">Female</asp:ListItem>
                    </asp:ListBox>
                   Gender:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="gender" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                  Age: <asp:Label ID="display_age" runat="server"></asp:Label>
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
                    <asp:DropDownExtender ID="DropDownExtender2" TargetControlID="reg_exp" DropDownControlID="expselect" runat="server"></asp:DropDownExtender>
                   Expereince: <asp:TextBox ID="reg_exp" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                    <asp:ListBox ID="expselect" Width="130" AutoPostBack="true" OnSelectedIndexChanged="expselect_SelectedIndexChanged" runat="server">
                        <asp:ListItem Value="1">1 Year</asp:ListItem>
                        <asp:ListItem Value="2">2 Years</asp:ListItem>
                        <asp:ListItem Value="3">3 Years</asp:ListItem>
                        <asp:ListItem Value="4">4 Years</asp:ListItem>
                        <asp:ListItem Value="5">5 Years</asp:ListItem>
                        <asp:ListItem Value="6">6 Years</asp:ListItem>
                        <asp:ListItem Value="7">7 Years</asp:ListItem>
                        <asp:ListItem Value="8">8 Years</asp:ListItem>
                        <asp:ListItem Value="9">9 Years</asp:ListItem>
                        <asp:ListItem Value="10">10 Years</asp:ListItem>
                    </asp:ListBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownExtender ID="DropDownExtender3" TargetControlID="reg_education" DropDownControlID="educationselect" runat="server"></asp:DropDownExtender>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender16" TargetControlID="reg_education" runat="server"></asp:RoundedCornersExtender>
                   Education: <asp:TextBox ID="reg_education" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                    <asp:ListBox ID="educationselect" AutoPostBack="true" OnSelectedIndexChanged="educationselect_SelectedIndexChanged" Width="130" runat="server">
                        <asp:ListItem Value="highschool">High School</asp:ListItem>
                        <asp:ListItem Value="bachelor">Bachelor</asp:ListItem>
                        <asp:ListItem Value="master">Master</asp:ListItem>
                        <asp:ListItem Value="doctorate">Doctorate</asp:ListItem>
                    </asp:ListBox>
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
                   Country:&nbsp;<asp:TextBox ID="reg_user_country"  AutoCompleteType="Search" AutoPostBack="true" Width="130"  Height="25" style="font-size:12pt" runat="server">
                                                    </asp:TextBox>
                    <asp:DropDownExtender ID="countrydropdown" runat="server" TargetControlID="reg_user_country" DropDownControlID="countrylist"></asp:DropDownExtender>
                    <asp:ListBox ID="countrylist" AutoPostBack="true" OnSelectedIndexChanged="countrylist_SelectedIndexChanged" runat="server" Width="130" Height="300"></asp:ListBox>
                  <asp:AutoCompleteExtender ID="AutoCompleteExtender1" EnableCaching="false" runat="server" TargetControlID="reg_user_country" 
                       ServiceMethod="SearchCountry" MinimumPrefixLength="1" CompletionSetCount="20"></asp:AutoCompleteExtender>
                     </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender10" TargetControlID="reg_user_province" runat="server"></asp:RoundedCornersExtender>
                    Province/State<asp:TextBox ID="reg_user_province" Width="130" AutoPostBack="true" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                <asp:DropDownExtender ID="provinceExtender" Enabled="false" runat="server"  TargetControlID="reg_user_province" DropDownControlID="provincelist"></asp:DropDownExtender>
                    <asp:ListBox ID="provincelist"  AutoPostBack="true" Visible="false" ViewStateMode="Enabled" EnableViewState="true" runat="server"  OnSelectedIndexChanged="provincelist_SelectedIndexChanged" Width="130" Height="300">
                        
                    </asp:ListBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender12" TargetControlID="reg_user_city" runat="server"></asp:RoundedCornersExtender>
                   City: <asp:TextBox ID="reg_user_city" Width="130" Height="25" style="font-size:12pt" runat="server"></asp:TextBox>
                    <asp:DropDownExtender ID="cityExternder" Enabled="false" TargetControlID="reg_user_city" runat="server" DropDownControlID="citylist"></asp:DropDownExtender>
                    <asp:ListBox ID="citylist" Width="130" Visible="false" Height="300" OnSelectedIndexChanged="citylist_SelectedIndexChanged" AutoPostBack="true" ViewStateMode="Enabled" EnableViewState="true" runat="server"></asp:ListBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <br />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="reg_phone" ValidationExpression="^[0-9]+$" ErrorMessage="Invalid" ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="phonevalidate" runat="server" ControlToValidate="reg_phone" ForeColor="red" ErrorMessage="*"></asp:RequiredFieldValidator>
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
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender19" TargetControlID="register_user_button" runat="server"></asp:RoundedCornersExtender>
                    <asp:Button ID="register_user_button" CssClass="button" OnClick="register_user_button_Click" runat="server" Text="Next"  style="font-size:12pt" />
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender20" TargetControlID="Clear_form2" runat="server"></asp:RoundedCornersExtender>
                    <asp:Button ID="Clear_form2" CssClass="button" style="font-size:12pt" OnClick="Clear_form2_Click" runat="server" Text="Clear Form" />
                </asp:TableCell>
            </asp:TableRow>
           
        </asp:Table>
    <asp:UpdateProgress ID="progress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="userregistration">
        <ProgressTemplate>
            <div class="overlay">
                <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

                
                    Please Wait. . .<asp:Image ID="Image1" runat="server" Width="40" Height="40" ImageUrl="~/icons/ajax_loader_green_48.gif" />
               
                

            </div>
            
        </ProgressTemplate>
    </asp:UpdateProgress>
        </ContentTemplate>
        
    </asp:UpdatePanel>
  </div>
        <div id="footer">
        <strong>&copy 2014  OXUS Afghanistan</strong>
        <p>Developed By OXUS Afghanistan IT Department</p>
    </div>
    </div>
</asp:Content>

