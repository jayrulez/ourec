<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Error</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="action">
	<div class="section">
		<div class="section-content">
			Sorry, an error occurred while processing your request.
		</div>
	</div>
</div>    

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SidebarLeftContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SidebarRightContent" runat="server">
</asp:Content>

