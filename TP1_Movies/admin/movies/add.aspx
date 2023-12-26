<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/Admin.Master" CodeBehind="add.aspx.cs" Inherits="TP1_Movies.admin.movies.add" %>

<asp:Content ID="moviesContent" runat="server" ContentPlaceHolderID="AdminContent">
    <div class="content">
        <div class="formEdit">
            <h2><asp:Literal id="ltrTitle" runat="server" /></h2>
            
            <asp:ValidationSummary ValidationGroup="Movie" ShowValidationErrors="true" runat="server" />

            <div>
                <asp:Label AssociatedControlID="txtTitle" Text="Title" runat="server" />
                <asp:TextBox ID="txtTitle" runat="server" />
                <asp:RequiredFieldValidator ValidationGroup="Movie" Display="None" ErrorMessage="Title is required" ControlToValidate="txtTitle" runat="server" />
            </div>

            <div>
                <asp:Label AssociatedControlID="txtDescription" Text="Description" runat="server" />
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Columns="20" Rows="8" />
                <asp:RequiredFieldValidator ValidationGroup="Movie" Display="None" ErrorMessage="Description is required" ControlToValidate="txtDescription" runat="server" />
            </div>

            <div>
                <asp:Label AssociatedControlID="txtDuration" Text="Duration" runat="server" />
                <asp:TextBox ID="txtDuration" runat="server" />
                <asp:RequiredFieldValidator ValidationGroup="Movie" Display="None" ErrorMessage="Duration is required" ControlToValidate="txtDuration" runat="server" />
            </div>

            <div>
                <asp:Label AssociatedControlID="fuImage" Text="Image" runat="server" />
                <asp:Image ID="imgImage" Width="200" runat="server" /><br />
                <asp:FileUpload ID="fuImage" runat="server" />
                <asp:RequiredFieldValidator ID="rfvImage" ValidationGroup="Movie" Display="None" ErrorMessage="Image is required" ControlToValidate="fuImage" runat="server" />
            </div>

            <div>
                <asp:Label AssociatedControlID="txtReleaseDate" Text="Release Date" runat="server" />
                <asp:TextBox ID="txtReleaseDate" TextMode="Date" runat="server" />
                <asp:RequiredFieldValidator ValidationGroup="Movie" Display="None" ErrorMessage="Release Date is required" ControlToValidate="txtReleaseDate" runat="server" />
            </div>

            <div>
                <asp:Label AssociatedControlID="txtRating" Text="Rating" runat="server" />
                <asp:TextBox ID="txtRating" runat="server" />
                <asp:RequiredFieldValidator ValidationGroup="Movie" Display="None" ErrorMessage="Rating is required" ControlToValidate="txtRating" runat="server" />
            </div>

            <div>
                <asp:Label AssociatedControlID="txtCountry" Text="Country" runat="server" />
                <asp:TextBox ID="txtCountry" runat="server" />
                <asp:RequiredFieldValidator ValidationGroup="Movie" Display="None" ErrorMessage="Country is required" ControlToValidate="txtCountry" runat="server" />
            </div>

            <div>
                <asp:Button ID="btnSave" ValidationGroup="Movie" Text="Save" runat="server" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" />
            </div>
        </div>
    </div>
</asp:Content>
