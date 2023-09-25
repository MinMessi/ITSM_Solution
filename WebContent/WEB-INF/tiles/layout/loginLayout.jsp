<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page session="false" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>

	<tiles:insertAttribute name="head" />

<body class="white-bg">

	<tiles:insertAttribute name="content" />

</body>
</html>