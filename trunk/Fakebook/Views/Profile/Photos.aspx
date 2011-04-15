<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ProfileLayout.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server"><%: ViewBag.displayName %></asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="HeadScripts" runat="server">    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="action">
	<div class="section">
		<div class="section-content">
            <% if (Fakebook.Lib.PrivacyHelper.CanSeePhotos(new Guid(Context.Request.Params["userId"]), new Guid(Fakebook.Lib.UserHelper.getLoggedInUserId())))
               { %>
            <div class="photos">
            <% foreach (Fakebook.Models.Album album in ViewBag.photoAlbums)
               { %>
                <% if (album.Photos.Count > 0)
                   { %>
                <div class="album">
                    <div class="preview">
                    
                    </div>
                    <div class="info">
                        <div class="name"><%: Html.ActionLink(album.Name, "ViewAlbum", "Photo", new { albumId = album.Id })%></div>
                        <div class="photo-count"><%: album.Photos.Count%></div>
                    </div>
                </div>
                <% } %>
            <% } %>
            </div>
            <% } else { %>
               <div class="privacy-alert">
                    You do not have the necessary permissions to view <%: Fakebook.Lib.UserHelper.GetDisplayName(Context.Request.Params["userId"])%>'s photos.
               </div>
            <% } %>
		</div>
	</div>
</div>    

</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="SidebarRightContent" runat="server">
<% if(ViewBag.user.UserId.ToString() == Fakebook.Lib.UserHelper.getLoggedInUserId()) { %>
<ul>
	<li><%: Html.ActionLink("Upload Photos", "Index", "Photo")%></li>
</ul>
<% } %>
</asp:Content>
