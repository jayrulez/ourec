<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ProfileLayout.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server"><%: ViewBag.displayName %></asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="HeadScripts" runat="server">    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="action">
	<div class="section">
		<div class="section-content">
            <% if (Fakebook.Lib.PrivacyHelper.CanSeeWall(new Guid(Context.Request.Params["userId"]), new Guid(Fakebook.Lib.UserHelper.getLoggedInUserId())))
               { %>
            <div class="post-publisher-container">
                <% Html.RenderPartial("~/Views/Post/postPublisher.ascx", new ViewDataDictionary { { "personId", Context.Request.Params["userId"] }, { "returnUrl", Context.Request.Url } }); %>
            </div>
		    <div class="stream" id="post-stream">
			    <% Html.RenderPartial("~/Views/Post/postStream.ascx", new ViewDataDictionary { { "posts", ViewBag.wallPosts } }); %>
		    </div>
            <% }
               else
               { %>
               <div class="privacy-alert">
                    You do not have the necessary permissions to view <%: Fakebook.Lib.UserHelper.GetDisplayName(Context.Request.Params["userId"]) %>'s wall.
               </div>
            <% } %>
		</div>
	</div>
</div>    

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SidebarRightContent" runat="server">
</asp:Content>
