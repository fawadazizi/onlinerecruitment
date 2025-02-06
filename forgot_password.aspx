<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="forgot_password.aspx.cs" Inherits="forgot_password" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="PageWrapper">
    <div id="head">
        
        <asp:Image ID="header" runat="server" ImageUrl="~/images/applyonline.png" Width="100%" />
        </div>
        <strong style="font-size:18pt;color:white">Validate Your Email Address</strong>
                   <asp:RoundedCornersExtender ID="RoundedCornersExtender1" TargetControlID="Verify" runat="server"></asp:RoundedCornersExtender>
                           <asp:RoundedCornersExtender ID="RoundedCornersExtender2" TargetControlID="email_id" runat="server"></asp:RoundedCornersExtender>

      
        <br />
        <hr />
        
        <asp:Table ID="forgot" runat="server" HorizontalAlign="Center">
            <asp:TableRow>
                <asp:TableCell>
                                        <asp:RegularExpressionValidator ID="ValidateEmail" runat="server" ControlToValidate="email_id" ForeColor="Red" ValidationExpression="^[\w!#$%&'*+\-/=?\^_`{|}~]+(\.[\w!#$%&'*+\-/=?\^_`{|}~]+)*@((([\-\w]+\.)+[a-zA-Z]{2,4})|(([0-9]{1,3}\.){3}[0-9]{1,3}))$" ErrorMessage="NOT VALID"></asp:RegularExpressionValidator>

                    <strong>Email ID:</strong>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="required_email" runat="server" ControlToValidate="email_id" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="email_id" runat="server" style="font-size:14pt" Height="25" Width="250"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="Verify" runat="server" OnClick="Verify_Click" Text="Validate" CssClass="button" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <div id="note">
            <strong>Note:</strong><p> If you forgot your email   , Or you can't receive your code , 
            
             send an email to <strong>(it@oxusaf.org)</strong> subject ( forgot email ) ,
             describe your First name,last name , registered phone number , registered date and  new email ,
             we will change your email with new one , then you can go through this process to reset your password. </p>

        </div>
        <asp:Label ID="status" ForeColor="White" Font-Size="14pt" runat="server"></asp:Label>
        <br />
        
        <hr />
        <div id="footer">
        <strong>&copy 2014  OXUS Afghanistan</strong>
        <p>Developed By OXUS Afghanistan IT Department</p>
    </div>
        </div>
</asp:Content>

