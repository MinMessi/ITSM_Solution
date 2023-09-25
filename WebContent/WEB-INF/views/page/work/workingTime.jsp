<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<!-- start 상단 버튼 영역 -->
<div class="row  border-bottom white-bg dashboard-header" style="height:57px;">
	<div class="col-md-12">

		<div class="col-sm-2">
			<div class="form-group" id="data_month">
				<div class="input-group date">
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" id="event_month" class="form-control">
				</div>
			</div>
		</div>

	</div>
</div>
<!-- 상단 버튼 영역 end -->

<style>
	#hrSearch {
		background-color: #FFFFFF;
		background-image: none;
		border: 1px solid #e5e6e7;
		border-radius: 1px;
		color: inherit;
		padding: 0px 5px;
		transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
	}
</style>

<div class="wrapper wrapper-content animated fadeInRight" style="z-index:5">
	<div class="row">
		<div class="col-lg-4 hideMenu">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>인력</h5>
					<div class="ibox-tools">
						<a class="collapse-tree-in">
							<i class="fa fa-chevron-left text-danger"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content full-height">
					<div class="jqGrid_wrapper2">
						<table id="grid_list2"></table>
					    <div id="grid_pager2"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-8 hideContent">
			<div class="ibox">
				<div class="ibox-title headNmText"></div>
				<div class="ibox-content full-height">
				
					<div class="jqGrid_wrapper1">
						<table id="grid_list1"></table>
					    <div id="grid_pager1"></div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<style>
	.clockpicker-popover {
		z-index:9999 !important;
	}
</style>
<!-- start Custom and plugin javascript -->

<!-- jqGrid -->
<script src="${imageServer}/js/plugins/jqGrid/jquery.jqGrid.min.js"></script>

<!-- Data picker -->
<script src="${imageServer}/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="${imageServer}/js/plugins/datapicker/bootstrap-datepicker.kr.js"></script>

<!-- Custom and plugin javascript end -->
<script>
	$.g_user_id = '';
</script>

<script>
	$.fncGrid2 = function() {
		$("#grid_list2").GridUnload();
		$.ritusGrid({
			gridObject: '#grid_list2',
			url: '${pageContext.request.contextPath}/data/hr/itoResideList.rts',
			postData: {
				category_id : 'ITO00001'
			},
			width: $('.jqGrid_wrapper').width(),
			height: $.getGridHeight(180),
			rowNum: 100,
            page: 1,
            scroll: 1,
		    loadonce: false,
			colNames : [ '성명', '담당 업무', 'ITO_USER_ID' ],
			colModel : [
					{name: 'ITO_NAME', align: 'center', width: '100px'}
				,	{name: 'V_ITO_WORK', align: 'left', width: '200px'}
				,	{name: 'ITO_USER_ID', hidden: true}
			],
			onCellSelect: function(rowid, icol, cellcontent, e) {
				$.g_user_id = $('#grid_list2').jqGrid('getCell', rowid, 'ITO_USER_ID');
				$.fncGrid1();
			}
		});
	};
	
	$.fncGrid1 = function() {
		$.ritusGrid({
			gridObject: '#grid_list1',
			url: '${pageContext.request.contextPath}/data/work/workingTime.rts',
			postData: {
				category_id : 'RSR00001',
				month : $('#event_month').val(),
				user_id : $.g_user_id
			},
		    width: $('.jqGrid_wrapper1').width(),
		    height: $.getGridHeight(170),
		    rowNum: 50,
		    rowList: [20, 30, 50],
		    scroll: 1,
		    colNames: ['날짜', '이름', 'SR처리시간', '업무중시간','시간외근무'],
		    colModel: [
		        {name: 'SR_COMPLETE_DATE', width:100},
		        {name: 'SR_MANAGER_NAME', width:100},
		        {name: 'SR_WORKING_TIME', width:100, fomatter: 'number', align: 'right', formatoptions:{thousandsSeparator:","}, summaryType:'sum'},
		        {name: 'SR_WORKING_TIME_IN', width:100, fomatter: 'number', align: 'right', formatoptions:{thousandsSeparator:","}, summaryType:'sum'},
		        {name: 'SR_WORKING_TIME_OUT', width:100, fomatter: 'number', align: 'right', formatoptions:{thousandsSeparator:","}, summaryType:'sum'},
		    ],
		    footerrow: true,
			userDataOnFooter : true,
		    onCellSelect: function(rowid, icol, cellcontent, e) {
		    	//$('#standardModal').modal({backdrop: "static", keyboard: true});
				return;
			},
			loadComplete: function(data) {
				var srSum = $("#grid_list1").jqGrid('getCol', 'SR_WORKING_TIME', false, 'sum'); 
				var overSum = $("#grid_list1").jqGrid('getCol', 'SR_WORKING_TIME_OUT', false, 'sum');
				var inSum = $("#grid_list1").jqGrid('getCol', 'SR_WORKING_TIME_IN', false, 'sum');
				var srSumDate = srSum/8;
				var overSumDate = overSum/8;
				var inSumDate = inSum/8;
				
				//$('table.ui-jqgrid-ftable td:eq(1)').hide();
				var sumWidth = $('table.ui-jqgrid-ftable td:eq(0)').width();
				sumWidth += $('table.ui-jqgrid-ftable td:eq(1)').width();
				
				
                $('#grid_list1').jqGrid('footerData', 'set', { SR_MANAGER_NAME:'합계(시간)', SR_WORKING_TIME:srSum, SR_WORKING_TIME_IN:inSum ,SR_WORKING_TIME_OUT:overSum});
                $('table.ui-jqgrid-ftable tbody:last').append("<tr role='row' class='ui-widget-content footrow footrow-ltr'><td>합계(일)</td><td>" + srSumDate.toFixed(1) + "</td><td>" + inSumDate.toFixed(1)  + "</td><td>" + overSumDate.toFixed(1) +"</td></tr>");
                $('table.ui-jqgrid-ftable td:eq(0)').hide();
				$('table.ui-jqgrid-ftable td:eq(1)').width(sumWidth);
				// $('table.ui-jqgrid-ftable td:eq(3)').hide();
			    // $('table.ui-jqgrid-ftable td:eq(1)').css("text-align", "right");
			    // $('table.ui-jqgrid-ftable tr:first').children("td");
			    $('table.ui-jqgrid-ftable tr').children("td").css("background-color", "#E0FFFF").css("text-align", "right");
			}
		});
	};
	
	$.fncCurrentMonth = function() {
		var date = new Date();
		var yyyy = date.getFullYear().toString();
		var mm = (date.getMonth() + 1).toString();

		$.g_currentMonth = yyyy + '-' + (mm[1] ? mm : '0' + mm[0]);
		$('#event_month').val($.g_currentMonth);
	};
</script>

<script>
$(function() {
	$.fncCurrentMonth();
	$.fncGrid1();
	$.fncGrid2();
	
	//date선택
	$('#data_month .input-group.date').datepicker({
		minViewMode: 1,
		keyboardNavigation: false,
		forceParse: false,
		autoclose: true,
		language: "kr",
		format: 'yyyy-mm'
	});
	
	$('#event_month').change(function() {
		$.fncGrid1();
	});

	$(window).bind('resize', function () {
		var width1 = $('.jqGrid_wrapper1').width();
		$('#grid_list1').setGridWidth(width1);
		$('#grid_list1').setGridHeight($.getGridHeight(170));
		
		var width2 = $('.jqGrid_wrapper2').width();
		$('#grid_list2').setGridWidth(width2);
		$('#grid_list2').setGridHeight($.getGridHeight(150));
	}).trigger('resize');
});

</script>