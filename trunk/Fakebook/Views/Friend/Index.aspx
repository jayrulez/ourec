<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FriendLayout.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
Friends
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<% var friendships = ViewBag.friendships as IEnumerable<Fakebook.Models.Friendship>; %>
<div class="action">
	<div class="section">
		<div class="section-content">
            <div class="friendships clearfix">
            <% if (friendships.Count() > 0)
               { %>
               <% foreach (Fakebook.Models.Friendship friendship in friendships)
                  { %>
                  <div class="friendship">
                    <div class="photo"><img src="<%: Url.Content("~/Images/user_icon_small.png") %>" alt=""/></div>
                    <div class="link">
                    <% 
                      if (friendship.UserId.ToString() == Fakebook.Lib.UserHelper.getLoggedInUserId())
                      {
                     %>
                        <%: Html.ActionLink(Fakebook.Lib.UserHelper.GetDisplayName(friendship.FriendId.ToString()), "Index", "Profile", new { userId = friendship.FriendId }, new object { })%>
                     <% }
                      else
                      { %>
                      <%: Html.ActionLink(Fakebook.Lib.UserHelper.GetDisplayName(friendship.UserId.ToString()), "Index", "Profile", new { userId = friendship.UserId }, new object { })%>
                      <% } %>
                    </div>
                    <div class="curation"><%: Html.ActionLink("Delete", "Curate", "Friend", new { friendshipId = friendship.Id, option = 0 }, new object { })%></div>
                  </div>
               <% } %>
            <% } %>
            </div>
		</div>
	</div>
</div>   

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadScripts" runat="server">
</asp:Content>
