<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ProfileLayout.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server"><%: ViewBag.displayName %></asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="HeadScripts" runat="server">    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="action">
	<div class="section">
		<div class="section-content">
                    <div class="user-info">
                        <dl class="clearfix">
                            <dt>Name</dt>
                            <dd><%: ViewBag.profile.GetFullName() %></dd>
                            <dt>Birthday</dt>
                            <dd><%: ViewBag.profile.Birthdate.ToLongDateString()%></dd>
                            <dt>Country</dt>
                            <dd><%: ViewBag.profile.Country %></dd>
                            <dt>City</dt>
                            <dd><%: ViewBag.profile.City %></dd>
                            <dt>Profession</dt>
                            <dd><%: ViewBag.profile.Profession %></dd>
                            <dt>Relationship Status</dt>
                            <dd><%: ViewBag.profile.RelationshipStatus %></dd>
                            <dt>Last Educational Institution</dt>
                            <dd><%: ViewBag.profile.LastEducationalInstitution %></dd>
                        </dl>
                    </div>
		</div>
	</div>
</div>    

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SidebarRightContent" runat="server">
</asp:Content>
