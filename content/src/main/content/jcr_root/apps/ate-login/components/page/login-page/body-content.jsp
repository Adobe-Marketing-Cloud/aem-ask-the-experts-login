<%@page import="org.apache.commons.lang.StringUtils"%>
<%@include file="/libs/foundation/global.jsp"%><%
// ideally, this would be consolidated with the duplciate code in nav.jsp
Page homePage = currentPage.getAbsoluteParent(1);
pageContext.setAttribute("homePage", homePage);

String loginResource = null;
if (request.getParameter("resource") != null) {
    loginResource = xssAPI.getValidHref(request.getParameter("resource"));
}
if (StringUtils.isEmpty(loginResource)) {
    loginResource = homePage.getPath() + ".html";
}
pageContext.setAttribute("loginResource", loginResource);
%>

<form action="${homePage.path}/j_security_check" method="POST" class="login-form">

<%-- output the error message, if any --%>
<c:if test="${not empty param['j_reason']}">
    <c:choose>
        <c:when test="${param['j_reason'] ==  'invalid_login'}">
            <div class="alert alert-danger" role="alert">Username and password do not match</div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-danger" role="alert">Unknown error</div>
        </c:otherwise>
    </c:choose>
</c:if>

    <div class="form-group">
        <label for="j_username">Username</label> <input type="text"
            name="j_username">
    </div>
    <div class="form-group">
        <label for="j_password">Password</label> <input type="password"
            name="j_password">
    </div>
    <input type="hidden" name="resource" value="${loginResource}">
    <input type="hidden" name="_charset_" value="UTF-8"/>

    <button type="submit" class="btn btn-default">Submit</button>
</form>
