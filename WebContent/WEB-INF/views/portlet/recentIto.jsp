<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<link href='${imageServer}/css/plugins/jqGrid/ui.jqgrid.css' rel='stylesheet'>

<style>
	.ui-jqgrid tr.jqgrow td {
		height: 32px !important;
	}
</style>

<div id="div_PTID_" style="height:300px;">
	<table id="_PTID_">
	</table>
</div>

<!-- jqGrid -->
<script src="${imageServer}/js/plugins/jqGrid/jquery.jqGrid.min.js"></script>

<script>
	$(function() {
		var width_PTID_ = $('#div_PTID_').width();
		
		$("#_PTID_").jqGrid({
			datatype: "local",
			height: 270,
			width: width_PTID_,
		   	colNames:['날짜', '소속', '이름', '업무'],
		   	colModel:[
		   		{name:'date', width:100, align: 'center'},
		   		{name:'company', width:90, align: 'center'},
		   		{name:'name', width:70, align: 'center'},
		   		{name:'work', width:120, align:"left"}
		   	]
		});
		var mydata_PTID_ = [
				{ date: "2018-01-26", company: "유니포인트", name: "정수진", work: "개발"},
				{ date: "2018-01-26", company: "유니포인트", name: "최철민", work: "개발"},
				{ date: "2018-01-26", company: "유니포인트", name: "조민정", work: "개발"},
				{ date: "2018-01-26", company: "유니포인트", name: "기수현", work: "개발"},
				{ date: "2018-01-08", company: "유니포인트", name: "한빈우", work: "설계, 개발"},
				{ date: "2018-01-26", company: "유니포인트", name: "주한필", work: "설계, 개발"},
				{ date: "2018-01-26", company: "유니포인트", name: "마주필", work: "설계"},
				{ date: "2017-12-01", company: "유니포인트", name: "주명진", work: "분석"},
				{ date: "2017-12-01", company: "유니포인트", name: "소미현", work: "분석"}
		];
		
		for(var i=0;i<=mydata_PTID_.length;i++)
			$("#_PTID_").jqGrid('addRowData',i+1,mydata_PTID_[i]);
		
		$('div_PTID_').slimscroll();
	});
</script>

