<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Fakebook.Models.UserProfileModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Edit Profile</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="HeadScripts" runat="server">    
    <script type="text/javascript">
        $(document).ready(function () {
            $("input#Birthdate").datepicker({
                minDate: new Date(1975, 1-1, 1),
                changeMonth: true,
                changeYear: true
            });
        });
</script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<div class="action">
	<div class="section">
		<div class="section-content">
			<div class="form-container">
				<% using (Html.BeginForm("Edit", "Profile")) { %>
					<div class="header">
						<div class="title">Edit Profile</div>
					</div>
					<%: Html.ValidationSummary(true, "Update was unsuccessful. Please correct the errors and try again.")%>
					<fieldset class="top">
						<div class="row top clearfix">
							<%: Html.LabelFor(model => model.FirstName)%>
							<%: Html.TextBoxFor(model => model.FirstName)%>
                            <%: Html.ValidationMessageFor(model => model.FirstName)%>
						</div>
						<div class="row clearfix">
							<%: Html.LabelFor(model => model.LastName)%>
							<%: Html.TextBoxFor(model => model.LastName)%>
                            <%: Html.ValidationMessageFor(model => model.LastName)%>
						</div>
						<div class="row clearfix">
							<%: Html.LabelFor(model => model.Birthdate)%>
							<%: Html.TextBoxFor(model => model.Birthdate)%>
                            <%: Html.ValidationMessageFor(model => model.Birthdate)%>
						</div>
						<div class="row clearfix">
							<%: Html.LabelFor(model => model.Country)%>
							<%: Html.TextBoxFor(model => model.Country)%>
                            <%: Html.ValidationMessageFor(model => model.Country)%>
						</div>
						<div class="row clearfix">
							<%: Html.LabelFor(model => model.City)%>
							<%: Html.TextBoxFor(model => model.City)%>
                            <%: Html.ValidationMessageFor(model => model.City)%>
						</div>
						<div class="row clearfix">
							<%: Html.LabelFor(model => model.Profession)%>
							<%: Html.TextBoxFor(model => model.Profession)%>
                            <%: Html.ValidationMessageFor(model => model.Profession)%>
						</div>
						<div class="row clearfix">
							<%: Html.LabelFor(model => model.RelationshipStatus)%>
							<%: Html.TextBoxFor(model => model.RelationshipStatus)%>
                            <%: Html.ValidationMessageFor(model => model.RelationshipStatus)%>
						</div>
						<div class="row bottom clearfix">
							<%: Html.LabelFor(model => model.LastEducationalInstitution)%>
							<%: Html.TextBoxFor(model => model.LastEducationalInstitution)%>
                            <%: Html.ValidationMessageFor(model => model.LastEducationalInstitution)%>
						</div>
					</fieldset>
					<fieldset class="buttons bottom">
						<input type="submit" value="Save Profile" />
					</fieldset>
				<% } %>
			</div>
		</div>
	</div>
</div>    

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="SidebarLeftContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SidebarRightContent" runat="server">
</asp:Content>
