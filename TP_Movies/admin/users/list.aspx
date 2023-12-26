<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/Admin.Master" CodeBehind="list.aspx.cs" Inherits="TP1_Movies.admin.users.list" %>

<asp:Content ID="usersContent" runat="server" ContentPlaceHolderID="AdminContent">
    <div class="content">

        <div>
            <asp:LinkButton CssClass="add" Text="Add User" PostBackUrl="~/admin/users/add.aspx" runat="server" />

            <asp:GridView DataKeyNames="ID" ID="gvList" runat="server" RowStyle-Height="50" PagerStyle-Height="50" HeaderStyle-Height="50" RowStyle-HorizontalAlign="Center" Width="1000px" AllowPaging="True" GridLines="None" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" OnRowDataBound="gvList_RowDataBound" OnPageIndexChanging="gvList_PageIndexChanging" OnRowCommand="gvList_RowCommand" OnRowDeleting="gvList_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Username" HeaderText="Username" />
                    <asp:BoundField DataField="IsActive" HeaderText="Active" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="btnEdit" CommandName="Edit" Text="Edit" Width="24" BorderStyle="None" ImageUrl="~/images/icons/edit.png" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="btnDelete" CommandName="Delete" Text="Edit" Width="24" BorderStyle="None" OnClientClick="return confirm('Are you sure ?')" ImageUrl="~/images/icons/delete.png" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#1f1d9e" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1f1d9e" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#1f1d9e" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
