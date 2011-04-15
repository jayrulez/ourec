<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Fakebook.Models.LogOnModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">Login</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<div class="action" id="auth-login">
	<div class="section">
		<div class="section-content">
			<div class="form-container">
				<% using (Html.BeginForm("Login", "Auth", FormMethod.Post, new { })) { %>
					<div class="header">
						<div class="title">Login</div>
                        <div class="sub-title">Please enter your username and password. <%: Html.ActionLink("Register", "Register")%> if you don't have an account.</div>
					</div>
					<%: Html.ValidationSummary(true, "Login was unsuccessful. Please correct the errors and try again.")%>
					<fieldset class="top">
						<div class="row top clearfix">
							<%: Html.LabelFor(m => m.UserName)%>
							<%: Html.TextBoxFor(m => m.UserName)%>
                            <%: Html.ValidationMessageFor(m => m.UserName)%>
						</div>
						<div class="row clearfix">
							<%: Html.LabelFor(m => m.Password)%>
							<%: Html.PasswordFor(m => m.Password)%>
                            <%: Html.ValidationMessageFor(m => m.Password)%>
						</div>
						<div class="row inline bottom clearfix">
							<%: Html.CheckBoxFor(m => m.RememberMe)%>
							<%: Html.LabelFor(m => m.RememberMe)%>
						</div>
					</fieldset>
					<fieldset class="buttons bottom">
						<input type="submit" value="Login" />
					</fieldset>
				<% } %>
                <div>
                    <a href="<%: Url.Content("~/ForgotPassword.aspx") %>">Forgot Password?</a>
                </div>
			</div>
		</div>
	</div>
</div>    
</asp:Content>
