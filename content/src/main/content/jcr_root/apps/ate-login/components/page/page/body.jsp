<%@include file="/libs/foundation/global.jsp" %><%
%><body>
<cq:include path="clientcontext" resourceType="cq/personalization/components/clientcontext"/>
<cq:include script="nav.jsp"/>

<div class="container">
<cq:include script="body-content.jsp"/>
</div>
<cq:includeClientLib js="ate-login.main"/>
<cq:include path="cloudservices" resourceType="cq/cloudserviceconfigs/components/servicecomponents"/>
</body>