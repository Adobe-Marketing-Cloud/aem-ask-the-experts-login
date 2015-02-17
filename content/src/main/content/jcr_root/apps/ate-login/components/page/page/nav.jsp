<%@page import="com.day.cq.wcm.api.PageFilter,
                java.util.Iterator"%>
<%@include file="/libs/foundation/global.jsp"%>
<%@taglib prefix="personalization" uri="http://www.day.com/taglibs/cq/personalization/1.0" %>
<%
// obtain the site's home page, assume that this is the first level page under /content
Page homePage = currentPage.getAbsoluteParent(1);
Iterator<Page> navPages = homePage.listChildren(new PageFilter());
pageContext.setAttribute("homePage", homePage);
pageContext.setAttribute("navPages", navPages);
%>


<div id="loginModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="loginModalLabel">Login</h4>
            </div>
            <div class="modal-body">
                <div style="display: none;" id="loginModalRequired" class="alert alert-danger" role="alert">Both username and password are required.</div>
                <div style="display: none;" id="loginModalInvalid" class="alert alert-danger" role="alert">Username and password do not match</div>
                <div style="display: none;" id="loginModalUnknown" class="alert alert-danger" role="alert">Unknown error</div>
                <form id="loginModalForm" method="post" action="${homePage.path}/j_security_check">
                    <div class="form-group">
                        <label for="j_username">Username</label> <input type="text" name="j_username">
                    </div>
                    <div class="form-group">
                        <label for="j_password">Password</label> <input type="password" name="j_password">
                    </div>
                    <input type="hidden" name="resource" value="${currentPage.path}.html"/>
                    <button type="submit">Login</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#navbar"
                aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${homePage.path}.html">ATE Login Session</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="${currentPage == homePage ? 'active' : ''}"><a href="${homePage.path}.html">Home</a></li>
                <c:forEach var="navPage" items="${navPages}">
                    <li class="${currentPage == navPage ? 'active' : ''}"><a href="${navPage.path}.html">${navPage.pageTitle ? navPage.pageTitle : navPage.title}</a></li>
                </c:forEach>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="cq-cc-profile-not-anonymous">
                    <a href="#">
                        <personalization:contextProfileProperty propertyName="givenName" prefix="Hi " suffix="!" store="profile"/>
                    </a>
                </li>
                <li>
                    <a class="cq-cc-profile-anonymous" href="#" data-target="#loginModal" data-toggle="modal">Login</a>
                    <a class="cq-cc-profile-not-anonymous logout-link" href="/system/sling/logout?resource=${homePage.path}.html">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>