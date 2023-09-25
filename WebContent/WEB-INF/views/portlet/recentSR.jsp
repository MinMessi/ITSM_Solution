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
		   	colNames:['자산명', '요청일', '상태'],
		   	colModel:[
		   		{name:'asset', width:200, align: 'left'},
		   		{name:'date', width:90, align: 'center'},
		   		{name:'status', width:50, align: 'center'},
		   	]
		});
		var mydata_PTID_ = [
				{ asset: '중계전산망 통합서버 1호기(lipda1)', date: '2018-01-22', status: '처리중' },
				{ asset: '앱 푸시서버 3호기(apppsh3)', date: '2018-01-15', status: '완료' },
				{ asset: '포탈 WAS1(WebLogic12c)', date: '2018-01-12', status: '완료' },
				{ asset: '포탈 WAS2(WebLogic12c)', date: '2018-01-12', status: '완료' },
				{ asset: '보안로그 분석용 DBMS', date: '2018-01-03', status: '완료' },
				{ asset: '윈도우즈서버(winzop9)', date: '2017-12-17', status: '완료' },
				{ asset: '윈도우즈서버(winzop10)', date: '2017-12-17', status: '완료' },
				{ asset: '윈도우즈서버(winzop11)', date: '2017-12-17', status: '완료' },
				{ asset: 'PC 보안(DRM) S/W #1', date: '2017-11-22', status: '완료' },
				{ asset: 'PC 보안(DRM) S/W #2', date: '2017-11-22', status: '완료' },
		];
		
		for(var i=0;i<=mydata_PTID_.length;i++)
			$("#_PTID_").jqGrid('addRowData',i+1,mydata_PTID_[i]);
		
		$('div_PTID_').slimscroll();
	});
</script>

