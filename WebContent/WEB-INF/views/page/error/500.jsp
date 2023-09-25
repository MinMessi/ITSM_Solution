<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Ritus | 404 Error</title>

    <link href="${imageServer}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${imageServer}/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="${imageServer}/css/animate.css" rel="stylesheet">
    <link href="${imageServer}/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">


    <div class="middle-box text-center animated fadeInDown">
        <h1>500</h1>
        <h3 class="font-bold">내부 서버 오류</h3>

        <div class="error-desc">
            죄송합니다, 서버에서 오류가 발생하였습니다.
            <form class="form-inline m-t" role="form"  action="${pageContext.request.contextPath}/page/main/dashboard.rts">
                <button type="submit" class="btn btn-primary">홈으로</button>
            </form>
        </div>
    </div>

    <!-- Mainly scripts -->
    <script src="imageserver/js/jquery-2.1.1.js"></script>
    <script src="imageserver/js/bootstrap.min.js"></script>

</body>

</html>
