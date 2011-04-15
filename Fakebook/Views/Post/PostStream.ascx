<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div class="stream-content">
	<div class="stream-items">
		<% var posts = ViewData["posts"] as IEnumerable<Fakebook.Models.Post>; %>
		<% if (posts != null && posts.Count() > 0)
     { %>
		<% foreach (Fakebook.Models.Post post in posts)
     { %>
		<% Html.RenderPartial("~/Views/Post/postView.ascx", new ViewDataDictionary { { "post", post } }); %>
		<% } %>
		<% }
     else
     { %>
        There are no posts in this stream.
        <%} %>
	</div>
</div>

