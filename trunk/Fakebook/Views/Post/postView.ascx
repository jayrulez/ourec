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
					<% if(post.OID.Comments.Count > 0) { %>
					<div class="stream-comments">
						<div class="stream-comments-content">
							<% foreach(Fakebook.Models.Comment comment in post.OID.Comments){ %>
								<div class="stream-comment">
									<div class="stream-comment-content clearfix">
										<div class="stream-comment-user-icon">
											<img src="<%: Url.Content("~/Images/user_icon_mini.png") %>" alt=""/>
										</div>
										<div class="stream-comment-entry">
											<div class="stream-comment-entry-data">
												<div class="stream-comment-content-text">
													<span class="user-link"><%: Html.ActionLink(Fakebook.Lib.UserHelper.GetDisplayName(comment.UserId.ToString()), "Index", "Profile", new {userId = comment.UserId.ToString()}, new object{}) %></span> <%: comment.Content %>
												</div>
											</div>
											<div class="stream-comment-entry-extra">
												<div class="stream-comment-options">
													<ul>
														<li><%: comment.CreatedAt.ToString() %></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="separator"></div>
							<% } %>
						</div>
					</div>
					<% } %>
					<div class="stream-comment-form">
                        <% Html.RenderPartial("~/Views/Post/commentForm.ascx", new ViewDataDictionary { { "OID", post.OID } }); %>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

