<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/Admin.Master" CodeBehind="add.aspx.cs" Inherits="TP1_Movies.admin.users.add" %>

<asp:Content ID="usersContent" runat="server" ContentPlaceHolderID="AdminContent">
    <div class="content">
        <div class="formEdit">
            <h2>
                <asp:Literal ID="ltrTitle" runat="server" />
            </h2>

            <asp:ValidationSummary ValidationGroup="User" ShowValidationErrors="true" runat="server" />

            <div>
                <asp:Label AssociatedControlID="txtUsername" Text="Username" runat="server" />
                <asp:TextBox ID="txtUsername" runat="server" />
                <asp:RequiredFieldValidator ValidationGroup="User" Display="None" ErrorMessage="Username is required" ControlToValidate="txtUsername" runat="server" />
            </div>

            <div>
                <asp:Label AssociatedControlID="txtPassword" Text="Password" runat="server" />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ValidationGroup="User" Enabled="false" ID="rfvPassword" Display="None" ErrorMessage="Password is required" ControlToValidate="txtPassword" runat="server" />
            </div>

            <div>
                <asp:Label AssociatedControlID="txtPasswordConfirm" Text="Password Confirm" runat="server" />
                <asp:TextBox ID="txtPasswordConfirm" runat="server" TextMode="Password" />
                <asp:RequiredFieldValidator ValidationGroup="User" Enabled="false" ID="rfvPasswordConfirm" Display="None" ErrorMessage="Password Confirm is required" ControlToValidate="txtPasswordConfirm" runat="server" />
                <asp:CompareValidator ValidationGroup="User" ID="cvPassword" Enabled="false" Display="None" ErrorMessage="Passwords must match" ControlToValidate="txtPassword" ControlToCompare="txtPasswordConfirm" runat="server" />
            </div>

            <div>
                <asp:Label AssociatedControlID="cbActive" Text="Active" runat="server" />
                <asp:CheckBox ID="cbActive" runat="server" />
            </div>

            <div>
                <asp:Button ID="btnSave" ValidationGroup="User" Text="Save" runat="server" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" />
            </div>
        </div>
    </div>
</asp:Content>
