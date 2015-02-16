<%@page import="com.day.cq.wcm.api.PageFilter,
                java.util.Iterator,
                com.adobe.granite.security.user.UserProperties,
                com.day.cq.personalization.UserPropertiesUtil"%>
<%@include file="/libs/foundation/global.jsp"%>
<%
// obtain the site's home page, assume that this is the first level page under /content
Page homePage = currentPage.getAbsoluteParent(1);
Iterator<Page> navPages = homePage.listChildren(new PageFilter());
UserProperties userProperties = slingRequest.adaptTo(UserProperties.class);
pageContext.setAttribute("homePage", homePage);
pageContext.setAttribute("navPages", navPages);
pageContext.setAttribute("userProperties", userProperties);
pageContext.setAttribute("isAnonymous", UserPropertiesUtil.isAnonymous(userProperties));
%>
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
                <li>
                    <c:choose>
                        <c:when test="${isAnonymous}">
                            <a href="${homePage.path}/login.html">Login</a>
                        </c:when>
                        <c:otherwise>
                            <a class="logout-link" href="/system/sling/logout?resource=${homePage.path}.html">Logout</a>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </div>
    </div>
</nav>