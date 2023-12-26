<%@ Page Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="TP1_Movies.admin.movies.list" %>

<asp:Content ID="moviesContent" runat="server" ContentPlaceHolderID="AdminContent">
    <div class="content">
        <div>
            <asp:LinkButton CssClass="add" Text="Add Movie" PostBackUrl="~/admin/movies/add.aspx" runat="server" />

            <asp:GridView DataKeyNames="ID" ID="gvList" runat="server" RowStyle-Height="50" PagerStyle-Height="50" HeaderStyle-Height="50" RowStyle-HorizontalAlign="Center" Width="1000px" AllowPaging="True" GridLines="None" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" OnPageIndexChanging="gvList_PageIndexChanging" OnRowEditing="gvList_RowEditing" OnRowUpdating="gvList_RowUpdating" OnRowCancelingEdit="gvList_RowCancelingEdit" OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand" OnRowDeleting="gvList_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" />
                    <asp:BoundField DataField="Country" HeaderText="Country" />
                    <asp:CommandField CausesValidation="false" ButtonType="Image" ControlStyle-Width="24" ControlStyle-BorderStyle="None" ShowEditButton="true" EditImageUrl="~/images/icons/quick edit.png" UpdateImageUrl="~/images/icons/save.png" CancelImageUrl="~/images/icons/cancel.png" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="btnEdit" CommandName="FullEdit" Text="Edit" Width="24" BorderStyle="None" ImageUrl="~/images/icons/edit.png" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="btnDelete" CommandName="Suppri" Text="Edit" Width="24" BorderStyle="None" OnClientClick="return confirm('Are you sure ?')" ImageUrl="~/images/icons/delete.png" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:CommandField ButtonType="Image" ControlStyle-Width="24" ControlStyle-BorderStyle="None" ShowDeleteButton="true" DeleteImageUrl="~/images/icons/delete.png" />--%>
                </Columns>
                <FooterStyle BackColor="#1f1d9e" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1f1d9e" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#1f1d9e" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
