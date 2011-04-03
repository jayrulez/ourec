<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Index</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="action">
	<div class="section">
		<div class="section-content">
		</div>
	</div>
</div>    

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SidebarLeftContent" runat="server">
<ul>
    <li><%: Html.ActionLink("News Feed", "Index", "Home")%></li>
    <li><%: Html.ActionLink("Friends", "Index", "Friend")%></li>
    <li><%: Html.ActionLink("Photos", "Index", "Photo")%></li>
</ul>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SidebarRightContent" runat="server">
</asp:Content>

