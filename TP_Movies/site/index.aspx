<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/site/Site.Master" CodeBehind="index.aspx.cs" Inherits="TP1_Movies.index" %>

<asp:Content ID="indexContent" runat="server" ContentPlaceHolderID="SiteContent">
    <asp:ScriptManager runat="server" />

    <div class="sidebar">
        <asp:Label Text="Keyword" ID="lblKeyword" runat="server" /><br />
        <asp:TextBox runat="server" ID="txtKeyword" /><br />

        <div>
            <asp:Label Text="Year From" runat="server" /><br />
            <asp:DropDownList ID="drpFromYear" runat="server">
                <asp:ListItem Text="" />
            </asp:DropDownList>

            <br />

            <asp:Label Text="Year To" runat="server" /><br />
            <asp:DropDownList ID="drpToYear" runat="server">
                <asp:ListItem Text="" />
            </asp:DropDownList>
        </div>

        <div>
            <asp:Label Text="Rating From" runat="server" /><br />
            <input type="number" id="txtFrom" min="1" max="10" runat="server">

            <br />

            <asp:Label Text="Rating To" runat="server" /><br />
            <input type="number" id="txtTo" min="1" max="10" runat="server">
        </div>

        <br />

        <asp:Button CssClass="btn" Text="Search" ID="btnSearch" runat="server" OnClick="btnSearch_Click" />
        <asp:Button CssClass="btn clear" Text="Clear" ID="btnClear" runat="server" OnClick="btnClear_Click" />
    </div>



    <div class="content">
        <div class="sort">
            <asp:Label ID="lblSort" runat="server" Text="Trier par :" />
            <asp:DropDownList AutoPostBack="true" ID="drpSort" runat="server" OnSelectedIndexChanged="drpSort_SelectedIndexChanged">
                <asp:ListItem Text="By Title" Value="Title" />
                <asp:ListItem Text="By Release Date" Value="ReleaseDate" />
                <asp:ListItem Text="By Rating Ascending" Value="Rating" />
                <asp:ListItem Text="By Rating Descending" Value="Rating DESC" />
            </asp:DropDownList>
        </div>

        <asp:UpdatePanel UpdateMode="Conditional" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="drpSort" />
            </Triggers>
            <ContentTemplate>
                <div class="actions">
                    <div class="pager">
                        <asp:LinkButton ID="lnkPreviousTop" Text="Previous" runat="server" OnCommand="lnk_Click" />
                        <asp:Repeater ID="rptTopPager" runat="server" OnItemDataBound="rptPager_ItemDataBound">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk" runat="server" OnCommand="lnk_Click" />
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:LinkButton ID="lnkNextTop" Text="Next" runat="server" OnCommand="lnk_Click" />
                        <asp:Literal ID="ltrEmptyResults" Text="No Results Found" runat="server" />
                    </div>


                </div>

                <asp:UpdateProgress runat="server">
                    <ProgressTemplate>
                        <div style="display: flex; margin-top: 1.5rem; gap: 0.25rem;">
                            <img src="/images/VZvw.gif" width="24" alt="Alternate Text" />
                            <span>Processing...</span>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <div class="listing">
                    <asp:Repeater ID="rptMovies" runat="server" OnItemDataBound="rptMovies_ItemDataBound">
                        <ItemTemplate>
                            <div class="item">
                                <div class="image">
                                    <asp:HyperLink ID="lnkImage" runat="server">
                                        <asp:Image Width="230" ID="imgItem" runat="server" />
                                    </asp:HyperLink>
                                    <%--<asp:HyperLink id="lnkImage" runat="server" />--%>
                                </div>
                                <div class="info">
                                    <asp:Literal ID="ltrRating" runat="server" />
                                    <div class="title">
                                        <asp:HyperLink ID="lnkTitle" runat="server" />
                                    </div>
                                    <div class="date"><%# Convert.ToDateTime(Eval("ReleaseDate")).ToString("MMMM dd, yyyy") %></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <div class="pager">
                    <asp:LinkButton ID="lnkPrevious" Text="Previous" runat="server" OnCommand="lnk_Click" />
                    <asp:Repeater ID="rptBottomPager" runat="server" OnItemDataBound="rptPager_ItemDataBound">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnk" runat="server" OnCommand="lnk_Click" />
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:LinkButton ID="lnkNext" Text="Next" runat="server" OnCommand="lnk_Click" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
