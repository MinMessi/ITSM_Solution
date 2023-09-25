<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page session="false" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>

	<tiles:insertAttribute name="head" />

<body class="fixed-sidebar">
    <div id="wrapper">
		<tiles:insertAttribute name="nav" />

        <div id="page-wrapper" class="gray-bg">
        	<div class="row border-bottom">
        		<tiles:insertAttribute name="sub_nav" />
        	</div>

        	<tiles:insertAttribute name="content" />

        	<tiles:insertAttribute name="footer" />

     	</div>
	</div>
</body>
</html>