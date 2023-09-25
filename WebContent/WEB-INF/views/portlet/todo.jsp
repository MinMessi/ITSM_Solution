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
		   	colNames:['시간', '내용'],
		   	colModel:[
		   		{name:'time', width:50, align: 'center'},
		   		{name:'cont', width:300, align: 'left'}
		   	],
		   	multiselect: true
		});
		var mydata_PTID_ = [
				{ time: '08:30', cont: '팀 주간회의' },
				{ time: '10:00', cont: '부서 주간회의' },
				{ time: '14:00', cont: '대외서버 WAS 정기점검' },
				{ time: '15:30', cont: '제니퍼 설치 업체 방문 - 견적 및 범위 산정 필요' },
				{ time: '17:00', cont: '프로젝트 주관사 전체 주간회의' },
		];
		
		for(var i=0;i<=mydata_PTID_.length;i++)
			$("#_PTID_").jqGrid('addRowData',i+1,mydata_PTID_[i]);
		
		$('div_PTID_').slimscroll();
	});
</script>

