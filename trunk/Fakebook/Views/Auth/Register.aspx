<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Fakebook.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
<div class="action" id="auth-register">
	<div class="section">
		<div class="section-content">
			<div class="form-container">
				<% using (Html.BeginForm("Register", "Auth", FormMethod.Post, new { }))
       { %>
					<div class="header">
						<div class="title">Create a New Account</div>
                        <div class="sub-title">
							<p>
								Use the form below to create a new account. 
							</p>
							<p>
								Passwords are required to be a minimum of <%: ViewBag.PasswordLength%> characters in length.
							</p>
						</div>
					</div>
					<%: Html.ValidationSummary(true, "Account creation was unsuccessful. Please correct the errors and try again.")%>
					<fieldset class="top">
						<div class="row top clearfix">
							<%: Html.LabelFor(m => m.Email)%>
							<%: Html.TextBoxFor(m => m.Email)%>
                            <%: Html.ValidationMessageFor(m => m.Email)%>
						</div>
						<div class="row clearfix">
							<%: Html.LabelFor(m => m.UserName)%>
							<%: Html.TextBoxFor(m => m.UserName)%>
                            <%: Html.ValidationMessageFor(m => m.UserName)%>
						</div>
						<div class="row clearfix">
							<%: Html.LabelFor(m => m.Password)%>
							<%: Html.PasswordFor(m => m.Password)%>
                            <%: Html.ValidationMessageFor(m => m.Password)%>
						</div>
						<div class="row bottom clearfix">
							<%: Html.LabelFor(m => m.ConfirmPassword)%>
							<%: Html.PasswordFor(m => m.ConfirmPassword)%>
                            <%: Html.ValidationMessageFor(m => m.ConfirmPassword)%>
						</div>
					</fieldset>
					<fieldset class="buttons bottom">
						<input type="submit" value="Register" />
					</fieldset>
				<% } %>
			</div>
		</div>
	</div>
</div>   
</asp:Content>
