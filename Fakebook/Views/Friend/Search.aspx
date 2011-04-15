<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FriendLayout.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Find Friends
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% var users = ViewBag.users as IEnumerable<Fakebook.Models.User>; %>

<div class="action">
	<div class="section">
		<div class="section-content">
			<% using (Html.BeginForm("Search", "Friend", "get")) { %>
			<fieldset>
				<input type="text" name="query"/>
			</fieldset>
			<fieldset>
				<input type="submit" value="Find Friends"/>
			</fieldset>
			<% } %>
            <div class="user-results">
            <% if (users != null && users.Count() > 0)
               { %>
               <% foreach (Fakebook.Models.User user in users)
                  { %>
                  <div class="user clearfix">
                    <div class="photo"><img src="<%: Url.Content("~/Images/user_icon_small.png") %>" alt=""/></div>
                    <div class="link">
                      <%: Html.ActionLink(Fakebook.Lib.UserHelper.GetDisplayName(user.UserId.ToString()), "Index", "Profile", new { userId = user.UserId }, new object { })%>
                    </div>
					<% if(Fakebook.Lib.FriendshipHelper.ShowAddFriendLink(user.UserId, new Guid(Fakebook.Lib.UserHelper.getLoggedInUserId()))) { %>
					<div class="relationship-link">
					<%: Html.ActionLink("Add as Friend", "Add", "Friend", new { userId = user.UserId.ToString() }, new object { })%>
					</div>
					<% } %>
                  </div>
               <% } %>
            <% }else if(users != null) { %>
				No Users found.
			<% }else{ %>
				Find Other users using the search box above.
			<% } %>
            </div>
		</div>
	</div>
</div>   

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadScripts" runat="server">
</asp:Content>
