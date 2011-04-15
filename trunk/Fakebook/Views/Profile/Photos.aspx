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
                   {
                       var image = album.Photos.LastOrDefault();
                       %>
                <div class="album">
                    <div class="preview">
                    <% if(image != null) { %>
                    <img src="<%: Url.Content("~/Photo/Output?photoId="+image.Id) %>" alt="<%: image.Id %>" />
                    <% } %>
                    </div>
                    <div class="info">
                        <div class="name"><%: Html.ActionLink(album.Name + "(" + album.Photos.Count + ")", "ViewAlbum", "Photo", new { albumId = album.Id }, new object { })%></div>
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
	<li><%: Html.ActionLink("Upload Photos", "Upload", "Photo")%></li>
</ul>
<% } %>
</asp:Content>
