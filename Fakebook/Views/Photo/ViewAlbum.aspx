<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/PhotoLayout.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    View Album
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% var album = ViewBag.album as Fakebook.Models.Album; %>
<div class="action">
	<div class="section">
		<div class="section-content">
            <div class="photos">
                <% if(ViewBag.message != null) { %>
                    <div><%: ViewBag.message %></div>
                <% } %>
                <% if (album != null)
                   { %>
                <div class="album">
                    <div class="info">
                        <div class="name"><%: Html.ActionLink(Fakebook.Lib.UserHelper.GetDisplayName(album.UserId.ToString()), "Index", "Profile", new { userId = album.UserId.ToString() }, new object { })%> - <%: album.Name %></div>
                    </div>
                    <div class="preview">
                    <% if (album.Photos != null && album.Photos.Count > 0)
                       { %>
                       <% foreach(Fakebook.Models.Photo photo in album.Photos) { %>
                        <div class="photo">
                        <a href="<%: Url.Content("~/Photo/ViewPhoto?photoId="+photo.Id) %>"><img src="<%: Url.Content("~/Photo/Output?photoId="+photo.Id+"&width=350&height=350") %>" alt="<%: photo.Id %>" /></a>
                        </div> 
                       <% } %>
                    <% }
                       else
                       { %>
                       This album has no images.
                    <% } %>
                    </div>
                </div>
                <% }
                   else
                   { %>
                   Album unavailable.
                <% } %>
            </div>
		</div>
	</div>
</div>   
</asp:Content>
