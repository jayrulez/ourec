<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Fakebook.Models.Post>" %>
<div id="post-publisher">
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <% using (Html.BeginForm("Create", "Post"))
       { %>
        <fieldset class="content-field">
            <input type="hidden" name="returnUrl" value="<%: ViewData["returnUrl"] %>" />
            <input type="hidden" name="personId" value="<%: ViewData["personId"] %>" />
            <%: Html.ValidationMessageFor(model => model.Content)%>
            <%: Html.TextAreaFor(model => model.Content)%>
        </fieldset>
        <fieldset class="submit-field-and-options clearfix">
			<div class="options">
			</div>
			<div class="submit-field">
				<button type="submit">Share</button>
			</div>
        </fieldset>
    <% } %>
</div>

