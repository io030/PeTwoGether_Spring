<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Pet TwoGether</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/Fevicon.ico">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<tiles:insertAttribute name="asset"></tiles:insertAttribute>
</head>
<body>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>

	<main>
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</main>


	<tiles:insertAttribute name="footer"></tiles:insertAttribute>




</body>
</html>