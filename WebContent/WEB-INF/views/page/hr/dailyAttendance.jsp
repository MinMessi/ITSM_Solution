<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<!-- start 상단 버튼 영역 -->
<div class="row border-bottom white-bg dashboard-header" style="height:57px;">
	<div class="col-lg-12">
		<div class="row">
			<div class="col-sm-2">
				<div class="form-group" id="data_month">
					<div class="input-group date">
						<span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" id="event_date" class="form-control" value="${DATE}">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 상단 버튼 영역 end -->

<div class="wrapper wrapper-content" style="z-index:5">
	<!-- Content 시작 -->
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox">
				<div class="jqGridWrapper">
					<table id="tableList"></table>
					<div id="pagerList"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- Content 끝 -->
</div>
<style>
	.ui-jqgrid tr.jqgrow td {
		cursor: default;
	}
	
	.clockpicker-popover {
		z-index:9999 !important;
	}
</style>
<!-- Data picker -->
<script src="${imageServer}/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="${imageServer}/js/plugins/datapicker/bootstrap-datepicker.kr.js"></script>
<!-- jqGrid -->

<script src="${imageServer}/js/plugins/jqGrid/jquery.jqGrid.min.js"></script>

<script>
	$.fncSearch = function() {
		var url = "${pageContext.request.contextPath}/data/hr/itoAttendanceList.rts";
	
		var sendData = {
			date : $('#event_date').val()
		};
	
		$("#tableList").GridUnload();
		
		$.ritusGrid({
			gridObject: '#tableList',
			url: url,
			postData: sendData,
			sortname : 'ATT_IN_TIME',
			sortorder : 'ASC',
			height : $.getGridHeight(100),
			colNames : [ '일자', '업체', '직위', '성명', '업무', '출근 시간', '퇴근 시간' ],
			colModel : [
				 {name: 'ATT_DATE', width: '100px'},
				 {name: 'ITO_COMPANY', width: '150px'},
				 {name: 'ITO_POSITION', width: '100px'},
				 {name: 'ITO_NAME', width: '100px'},
				 {name: 'ITO_WORK', align:'left', width: '300px'},
				 {name: 'ATT_IN_TIME', width: '100px'},
				 {name: 'ATT_OUT_TIME', width: '100px'}
			],
			pager : "#pagerList",
			onCellSelect: function(rowid, icol, cellcontent, e) {
			}, loadComplete :function(data){
			}
		});
	};
</script>
<script>
	/**
		화면 로딩 후 최초 호출 영역
	*/

	$(function() {

		$('.input-group.date').datepicker({
			keyboardNavigation: false,
			forceParse: false,
			autoclose: true,
			todayHighlight: true,
			language: "kr",
			format: 'yyyy-mm-dd'
		});

		$.fncSearch();
		
		$('#event_date').change($.fncSearch);

		//검색항목 선택시
		$('ul.dropdown-menu > li > a').click(function() {
			$.g_searchOption = $(this).attr('search');
			var text = $(this).text();
			$('#selSearch').html(text + ' <span class="caret"></span>');
		});

		$(window).bind('resize', function () {
			var state_width = $('div.jqGridWrapper').width();
		 	$('#tableList').setGridWidth(state_width);
			$('#tableList').setGridHeight($.getGridHeight(100));

		}).trigger('resize');
	});
</script>
