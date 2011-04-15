<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<% var OID = ViewData["OID"] as Fakebook.Models.Object; %>
<div class="stream-comment-form-content">
	<% using (Html.BeginForm("Create", "Comment")) { %>
		<fieldset class="stream-field">
            <input type="hidden" name="objectId" value="<%: OID.Id %>" />
            <input type="hidden" name="returnUrl" value="<%: Context.Request.Url %>" />
		</fieldset>
		<fieldset class="content-field">
            <textarea name="content" rows="1" cols="1"></textarea>
		</fieldset>
		<fieldset class="submit-field clearfix">
			<input type="submit" class="submit" value="Comment" />
		</fieldset>
	<% } %>
</div>

