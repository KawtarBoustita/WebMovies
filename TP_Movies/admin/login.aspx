<%@ Page Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TP1_Movies.admin.login" %>

<asp:Content ID="loginContent" runat="server" ContentPlaceHolderID="AdminContent">
    <div class="content">
        <div>
            <div>
                <asp:ValidationSummary ShowValidationErrors="true" ValidationGroup="Login" ID="vs" runat="server" />
            </div>
            <div>
                <asp:Label Text="Username" AssociatedControlID="txtUsername" runat="server" /><br />
                <asp:TextBox ID="txtUsername" runat="server" />
                <asp:RequiredFieldValidator ValidationGroup="Login" Display="None" ErrorMessage="Username is required." ControlToValidate="txtUsername" runat="server" />
            </div>
            <div>
                <asp:Label Text="Password" AssociatedControlID="txtPassword" runat="server" /><br />
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" />
                <asp:RequiredFieldValidator ValidationGroup="Login" Display="None" ErrorMessage="Password is required." ControlToValidate="txtPassword" runat="server" />
            </div>
            <div>
                <asp:Button ID="btnLogin" ValidationGroup="Login" Text="Login" runat="server" OnClick="btnLogin_Click" />
            </div>
        </div>
    </div>
</asp:Content>
