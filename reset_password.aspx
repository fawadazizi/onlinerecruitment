<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="reset_password.aspx.cs" Inherits="reset_password" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="PageWrapper">
    <div id="head">
        
        <asp:Image ID="header" runat="server" ImageUrl="~/images/applyonline.png" Width="100%" />
        </div>
        <strong style="font-size:18pt;color:white">Verify Secret Code</strong>
                   <asp:RoundedCornersExtender ID="RoundedCornersExtender1" TargetControlID="Verify" runat="server"></asp:RoundedCornersExtender>
        <asp:RoundedCornersExtender ID="RoundedCornersExtender3" TargetControlID="Verify" runat="server"></asp:RoundedCornersExtender>
        <asp:RoundedCornersExtender ID="RoundedCornersExtender2" TargetControlID="reset_password_button" runat="server"></asp:RoundedCornersExtender>
                <asp:RoundedCornersExtender ID="RoundedCornersExtender4" TargetControlID="login" runat="server"></asp:RoundedCornersExtender>

      
        <br />
        <hr />
        
        <asp:Table ID="forgot" runat="server" HorizontalAlign="Center">
            <asp:TableRow>
                <asp:TableCell>
                    <strong><asp:Label ID="secret_code_status" runat="server" Text="Secret Code:"></asp:Label> </strong>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="verify_code" runat="server"  Height="25" Width="300"></asp:TextBox>
                </asp:TableCell>

            </asp:TableRow>
           <asp:TableRow>
               
               <asp:TableCell>
                   <br />
                    <asp:Label ID="password" runat="server" Visible="false" Text="New Password:"></asp:Label>                   

               </asp:TableCell>
               <asp:TableCell>
                   <asp:TextBox ID="reset_password_1" Visible="false" runat="server" TextMode="Password" style="font-size:14pt" Height="25" Width="180" ></asp:TextBox>
               </asp:TableCell>
           </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="password_2" Visible="false" runat="server" Text="Retype New Password"></asp:Label>

               </asp:TableCell>
                <asp:TableCell>
                                       <asp:TextBox ID="re_reset_password" Visible="false" runat="server" TextMode="Password" style="font-size:14pt" Height="25" Width="180" ></asp:TextBox>
                    <asp:Button ID="Verify" OnClick="Verify_Click" runat="server"  Text="Verify" CssClass="button" />
                </asp:TableCell>
                <asp:TableCell>
                    
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="login" OnClick="login_Click" Visible="false" CssClass="button" runat="server" Text="Login" />
                    
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="reset_password_button" runat="server" Text="Reset" OnClick="reset_password_button_Click" CssClass="button" Visible="false" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <br />
        <asp:Label ID="status" ForeColor="White" Font-Size="14pt" runat="server"></asp:Label>
        <hr />
        <div id="footer">
        <strong>&copy 2014  OXUS Afghanistan</strong>
        <p>Developed By OXUS Afghanistan IT Department</p>
    </div>
        </div>
</asp:Content>

