<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/PhotoLayout.Master" Inherits="System.Web.Mvc.ViewPage<Fakebook.Models.AlbumModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create Album
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<div class="action">
	<div class="section">
		<div class="section-content">
			<div class="form-container">
				<% using (Html.BeginForm("CreateAlbum", "Photo")) { %>
					<div class="header">
						<div class="title">Create Photo Album</div>
					</div>
					<%: Html.ValidationSummary(true, "Request was unsuccessful. Please correct the errors and try again.")%>
					<fieldset class="top">
						<div class="row top clearfix">
							<%: Html.LabelFor(model => model.Name)%>
							<%: Html.TextBoxFor(model => model.Name)%>
                            <%: Html.ValidationMessageFor(model => model.Name)%>
						</div>
						<div class="row bottom clearfix">
							<%: Html.LabelFor(model => model.Description)%>
							<%: Html.TextAreaFor(model => model.Description)%>
                            <%: Html.ValidationMessageFor(model => model.Description)%>
						</div>
					</fieldset>
					<fieldset class="buttons bottom">
						<input type="submit" value="Create Album" />
					</fieldset>
				<% } %>
			</div>
		</div>
	</div>
</div>    

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadScripts" runat="server">
</asp:Content>
