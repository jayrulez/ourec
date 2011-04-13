<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server"> - Home</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="action">
	<div class="section">
		<div class="section-content">
            <div class="post-publisher-container">
                <% Html.RenderPartial("~/Views/Post/postPublisher.ascx", new ViewDataDictionary {{"personId",Context.Request.Params["userId"]}, {"returnUrl",Context.Request.Url}}); %>
            </div>
		</div>
	</div>
</div>    

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SidebarLeftContent" runat="server">
<div class="user-identity clearfix">
    <div class="photo">
    </div>
    <div class="links">
        <ul>
            <li><%: Html.ActionLink(Fakebook.Lib.UserHelper.GetDisplayName(), "Index", "Profile", new { userId = Fakebook.Lib.UserHelper.getLoggedInUserId() }, new object { })%></li>
            <li><%: Html.ActionLink("Edit My Profile", "Edit", "Profile")%></li>
        </ul>
    </div>
</div>
<ul>
    <li><%: Html.ActionLink("News Feed", "Index", "Home")%></li>
    <li><%: Html.ActionLink("Friends", "Index", "Friend")%></li>
    <li><%: Html.ActionLink("Photos", "Index", "Photo")%></li>
</ul>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SidebarRightContent" runat="server">
</asp:Content>

