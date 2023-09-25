<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<nav class="navbar-default navbar-static-side" role="navigation" style="background: linear-gradient(black 5%, rgb(11, 16, 19) 5%, rgb(58, 89, 102) 35%, black);">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
        	<span><img id="logo" alt="Ritus" src="${imageServer}/img/logo.png" class="logoImage"  /></span>
            
            ${nav}
        </ul>
    </div>
</nav>

<style>
	/* 네비게이션 메뉴가 활성화 되었을때 표시 */
	.nav > li.active {border-left: 1px solid orange; background: #4100ff0a;}
	
	/* 네비게이션 메뉴에서 마우스오버시 hover 효과 */
	.navbar-default .nav > li > a:hover, .navbar-default .nav > li > a:focus {background-color: #ffffff30;}
	
	/* 네비게이션 메뉴.Dashboard 디자인 */
	li.dashboard.active {padding: 10px 10px 10px 10px; font-size: 15px;}
	
	/* 테이블 헤더 디자인*/
	.ui-th-ltr, .ui-jqgrid .ui-jqgrid-htable th.ui-th-ltr {background: white;}
	.ui-jqgrid .ui-jqgrid-hbox {padding-left: 10px; background: white;}
	
	.navbar-default {background: black;}
	
</style>