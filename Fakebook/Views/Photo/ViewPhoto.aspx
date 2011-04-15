<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/PhotoLayout.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    View Photo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% var photo = ViewBag.photo as Fakebook.Models.Photo; %>
<div class="action">
	<div class="section">
		<div class="section-content">
            <div class="photos">
                <% if(ViewBag.message != null) { %>
                    <div><%: ViewBag.message %></div>
                <% } %>
                <% if (photo != null)
                   { %>
                <div class="photo">
                    <div class="info">
                        <div class="name"><%: Html.ActionLink(Fakebook.Lib.UserHelper.GetDisplayName(photo.UserId.ToString()), "Index", "Profile", new { userId = photo.UserId.ToString() }, new object { })%> - <%: Html.ActionLink(photo.Album.Name, "ViewAlbum", "Photo", new { albumId = photo.Album.Id }, new object { })%></div>
                    </div>
					
                    <div class="preview">
                        <div class="photo">
                        <a href=""><img src="<%: Url.Content("~/Photo/Output?photoId="+photo.Id+"&width=500&height=500") %>" alt="<%: photo.Id %>" /></a>
                        </div> 
                    </div>
                        <div class="photo-comments">
                            <% Html.RenderPartial("~/Views/Shared/commentList.ascx", new ViewDataDictionary { { "comments", photo.OID.Comments } }); %>
					        <div class="stream-comment-form">
                                <% Html.RenderPartial("~/Views/Post/commentForm.ascx", new ViewDataDictionary { { "OID", photo.OID } }); %>
					        </div>
                        </div> 
                </div>
                <% }
                   else
                   { %>
                   Photo unavailable.
                <% } %>
            </div>
		</div>
	</div>
</div>   
</asp:Content>
