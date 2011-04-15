<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/PhotoLayout.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Upload Photo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="action">
	<div class="section">
		<div class="section-content">
			<div class="form-container">
				<% var albums = ViewBag.albums as IEnumerable<Fakebook.Models.Album>; %>
				<% if(albums != null && albums.Count() > 0) { %>
				<% using (Html.BeginForm("Upload", "Photo",FormMethod.Post, new { enctype = "multipart/form-data" })) { %>
					<div class="header">
						<div class="title">Upload Photo</div>
					</div>
					<fieldset class="top">
						<div class="row top clearfix">
							<label>Photo</label>
							<input type="file" name="photoFile"/>
						</div>
						<div class="row clearfix">
							<label>Album</label>
							<select name="albumId">
							<% foreach(Fakebook.Models.Album album in albums) { %>
							<option value="<%: album.Id %>"><%: album.Name%></option>
							<% } %>
							</select>
						</div>
						<div class="row bottom clearfix">
							<label>Caption</caption>
							<br/>
							<textarea name="caption"></textarea>
						</div>
					</fieldset>
					<fieldset class="buttons bottom">
						<input type="submit" value="Upload Photo" />
					</fieldset>
				<% } %>
				<% }else{ %>
				You need to <%: Html.ActionLink("Create an Album", "CreateAlbum", "Photo")%> before uploading photos.
				<% } %>
			</div>
		</div>
	</div>
</div>    

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadScripts" runat="server">
</asp:Content>
