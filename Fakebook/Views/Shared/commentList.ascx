<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<% var comments = ViewData["comments"] as IEnumerable<Fakebook.Models.Comment>; %>
					<div class="stream-comments">
						<div class="stream-comments-content">
							<% foreach(Fakebook.Models.Comment comment in comments){ %>
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
						