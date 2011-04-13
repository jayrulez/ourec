<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Fakebook.Models.Post>" %>
<div class="post-publisher">
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <% using (Html.BeginForm("Create", "Post"))
       { %>
        <fieldset>
            <input type="hidden" name="returnUrl" value="<%: ViewData["returnUrl"] %>" />
            <input type="hidden" name="personId" value="<%: ViewData["personId"] %>" />
            <%: Html.ValidationMessageFor(model => model.Content)%>
            <%: Html.TextAreaFor(model => model.Content)%>
        </fieldset>
        <fieldset>
            <button type="submit">Share</button>
        </fieldset>
    <% } %>
</div>

