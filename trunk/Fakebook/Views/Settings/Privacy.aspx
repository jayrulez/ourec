<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Account.Master" Inherits="System.Web.Mvc.ViewPage<Fakebook.Models.PrivacyModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Privacy Settings</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<div class="action">
	<div class="section">
		<div class="section-content">
			<div class="form-container">
				<% using (Html.BeginForm("Privacy", "Settings")) { %>
					<div class="header">
						<div class="title">Change Privacy Settings</div>
                        <% if(ViewBag.message != null) { %>
                        <div class="sub-title"><%: ViewBag.message %></div>
                        <% } %>
					</div>
					<%: Html.ValidationSummary(true, "Update was unsuccessful. Please correct the errors and try again.")%>
					<fieldset class="top">
						<div class="row top clearfix">
							<%: Html.LabelFor(model => model.SeeMyInfo)%>
							<%: Html.DropDownListFor(model => model.SeeMyInfo, new SelectList(new List<Object> { 
                                new {option = 0, value = "Everyone"},
                                new {option = 1, value = "Friends Only"}
                            },"option","value",Model.SeeMyInfo))%>
                            <%: Html.ValidationMessageFor(model => model.SeeMyInfo) %>
						</div>
						<div class="row clearfix">
							<%: Html.LabelFor(model => model.SeeMyWall)%>
							<%: Html.DropDownListFor(model => model.SeeMyWall, new SelectList(new List<Object> { 
                                new {option = 0, value = "Everyone"},
                                new {option = 1, value = "Friends Only"}
                            },"option","value",Model.SeeMyWall))%>
                            <%: Html.ValidationMessageFor(model => model.SeeMyWall) %>
						</div>
						<div class="row bottom clearfix">
							<%: Html.LabelFor(model => model.SeeMyPhotos)%>
							<%: Html.DropDownListFor(model => model.SeeMyPhotos, new SelectList(new List<Object> { 
                                new {option = 0, value = "Everyone"},
                                new {option = 1, value = "Friends Only"}
                            },"option","value",Model.SeeMyPhotos))%>
                            <%: Html.ValidationMessageFor(model => model.SeeMyPhotos)%>
						</div>
					</fieldset>
					<fieldset class="buttons bottom">
						<input type="submit" value="Save Privacy Settings" />
					</fieldset>
				<% } %>
			</div>
		</div>
	</div>
</div>    

</asp:Content>
