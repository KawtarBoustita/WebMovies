<%@ Page Language="C#" MasterPageFile="~/site/Site.Master" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="TP1_Movies.details" %>

<asp:Content ID="detailsContent" runat="server" ContentPlaceHolderID="SiteContent">
    <div class="content">
        <div class="movieInfo">
            <asp:Image ID="imgMovie" Width="450" runat="server" />
            <div class="infos">
                <div class="titleDetails">
                    <asp:Literal ID="ltrTitle" runat="server" />
                </div>
                <div class="dateDetails">
                    <asp:Literal ID="ltrDate" runat="server" />
                </div>
                <div class="ratingDetails <%= colorClass %>">
                    <div class="ratingDetailsInner">
                        <div>
                            <asp:Literal ID="ltrRating" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="description">
                    <asp:Literal ID="ltrDescription" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
