<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Fakebook.Models.Post>" %>
<div class="post">
    <div class="post-header">
    </div>
    <div class="post-content">
        <% var post = ViewData["post"] as Fakebook.Models.Post; %>
        <%: post.Content %>
    </div>
</div>

