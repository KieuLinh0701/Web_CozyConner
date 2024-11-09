<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<c:url value="/" var="URL"></c:url>

	<!-- BEGIN HEADER -->
	<%@ include file="/commons/web/header.jsp"%>
	<!-- END HEADER -->

	<div class="main">
		<div class="container">
			<sitemesh:write property="body" />
		</div>
	</div>

	<br/>

	<!-- BEGIN FOOTER -->
	<%@ include file="/commons/web/footer.jsp"%>
	<!-- END FOOTER -->
</body>
<!-- END BODY -->
</html>