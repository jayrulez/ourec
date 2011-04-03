<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Account.Master" Inherits="System.Web.Mvc.ViewPage<Fakebook.Models.ChangePasswordModel>" %>

<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">Change Password</asp:Content>

<asp:Content ID="changePasswordContent" ContentPlaceHolderID="MainContent" runat="server">
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
<div class="action">
	<div class="section">
		<div class="section-content">
			<div class="form-container">
				<% using (Html.BeginForm("ChangePassword", "Account")) { %>
					<div class="header">
						<div class="title">Change Password</div>
                        <div class="sub-title">
							<p>
								Use the form below to change your password. 
							</p>
							<p>
								New passwords are required to be a minimum of <%: ViewBag.PasswordLength %> characters in length.
							</p>
						</div>
					</div>
					<%: Html.ValidationSummary(true, "Password change was unsuccessful. Please correct the errors and try again.") %>
					<fieldset class="top">
						<div class="row top clearfix">
							<%: Html.LabelFor(m => m.OldPassword)%>
							<%: Html.PasswordFor(m => m.OldPassword)%>
                            <%: Html.ValidationMessageFor(m => m.OldPassword)%>
						</div>
						<div class="row clearfix">
							<%: Html.LabelFor(m => m.NewPassword)%>
							<%: Html.PasswordFor(m => m.NewPassword)%>
                            <%: Html.ValidationMessageFor(m => m.NewPassword)%>
						</div>
						<div class="row bottom clearfix">
							<%: Html.LabelFor(m => m.ConfirmPassword)%>
							<%: Html.PasswordFor(m => m.ConfirmPassword)%>
                            <%: Html.ValidationMessageFor(m => m.ConfirmPassword)%>
						</div>
					</fieldset>
					<fieldset class="buttons bottom">
						<input type="submit" value="Change Password" />
					</fieldset>
				<% } %>
			</div>
		</div>
	</div>
</div>  
</asp:Content>
