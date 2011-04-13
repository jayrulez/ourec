<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ProfileLayout.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server"><%: ViewBag.displayName %></asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="HeadScripts" runat="server">    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="action">
	<div class="section">
		<div class="section-content">
            <div class="post-publisher-container">
                <% Html.RenderPartial("~/Views/Post/postPublisher.ascx", new ViewDataDictionary {{"personId",Context.Request.Params["userId"]}, {"returnUrl",Context.Request.Url}}); %>
            </div>
            <div class="posts">
                <% foreach(Fakebook.Models.Post post in ViewBag.wallPosts) { %>
                    <% Html.RenderPartial("~/Views/Post/postView.ascx", new ViewDataDictionary { { "post", post } }); %>
                <% } %>
            </div>
		</div>
	</div>
</div>    

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SidebarRightContent" runat="server">
</asp:Content>
