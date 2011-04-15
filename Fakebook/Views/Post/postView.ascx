<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<% var post = ViewData["post"] as Fakebook.Models.Post; %>
<div class="stream-item" id="<%: post.Id %>">
	<div class="stream-item-content clearfix">
		<div class="stream-user-icon">
			<img src="<%: Url.Content("~/Images/user_icon_small.png") %>" alt=""/>
		</div>
		<div class="stream-entry">
			<div class="stream-entry-data">
				<div class="stream-user-link">
                    <%: Html.ActionLink(Fakebook.Lib.UserHelper.GetDisplayName(post.UserId.ToString()), "Index", "Profile", new {userId = post.UserId.ToString()}, new object{}) %>
				</div>
				<div class="stream-content-text">
					<%: post.Content%>
				</div>
				<div class="stream-entry-extra">
					<div class="stream-entry-options">
						<ul>
							<li><%: post.CreatedAt.ToString() %></li>
						</ul>
					</div>
                    <% Html.RenderPartial("~/Views/Shared/commentList.ascx", new ViewDataDictionary { { "comments", post.OID.Comments } }); %>
					<div class="stream-comment-form">
                        <% Html.RenderPartial("~/Views/Post/commentForm.ascx", new ViewDataDictionary { { "OID", post.OID } }); %>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

