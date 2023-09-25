<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0px;">
	<!-- div class="navbar-header">
    	<a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
	</div -->
	<div class="navbar-header" style="margin:20px;">
		
		<ol class="breadcrumb"><i class="fa fa-chevron-right"></i>&nbsp;&nbsp;
			<c:forEach var="item" items="${breadcrumb}" varStatus="status">

				<c:choose>
					<c:when test="${status.first}"></c:when>
					<c:when test="${status.last}">
						<li class="active"><strong>${item}</strong></li>
					</c:when>
					<c:otherwise>
						<li><a>${item}</a></li>
					</c:otherwise>
				</c:choose>

			</c:forEach>
	    </ol>
	    
	    
       <div class="dropdown profile-element" style="background: #ffb3009c; border-radius: 50px; position: absolute; top: 2.5px; right: 5px; padding: 5px 50px 5px 50px;">
           <a data-toggle="dropdown" class="dropdown-toggle" href="#">
           	<span class="clear"> 
           		<span class="block m-t-xs"> <strong class="font-bold">${userInfo.user_name}</strong></span> 
            		<span class="text-muted text-xs block">추가메뉴 <b class="caret"></b></span> 
            	</span> 
            </a>
           <ul class="dropdown-menu animated fadeInRight m-t-xs">
           	<c:if test="${userInfo.isadmin == 'Y'}">
           		<c:choose>
           			<c:when test="${suid == 1}">
           				<li><a href="${pageContext.request.contextPath}/admin/page/manage/category/prefix.rts">관리자모드</a></li>
           			</c:when>
           			<c:otherwise>
           				<li><a href="${pageContext.request.contextPath}/admin/page/manage/category/prefix.rts">관리자모드</a></li>
           			</c:otherwise>
           		</c:choose>
               </c:if>
               <!-- li><a href="${pageContext.request.contextPath}/page/prv/page.rts">개인화페이지 관리</a></li -->
               <li><a class="changePWD">비밀번호 변경</a></li>
      		<c:if test="${userInfo.user_type == 'CDE00018001'}">
               <li id="att_divider" class="divider"></li>
               <li id="att_li"><a class="attendance">데이터 조회중...</a></li>
           </c:if>
               <li class="divider"></li>
               <li><a href="${pageContext.request.contextPath}/page/sso/login.rts">로그아웃</a></li>
           </ul>
       </div>
            
	</div>	
	
</nav>

<script>
	try {
		//IE11
		var ua = window.navigator.userAgent;
		if ( ua.indexOf('Trident/7.0') > 0 )
			document.getElementById('customPosition').style.top = '12px';
	} catch(e) {
		//do nothing
	}
</script>
