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
					<h5>협력업체</h5>
					<div class="ibox-tools">
						<a class="collapse-tree-in">
							<i class="fa fa-chevron-left text-danger"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content full-height">
					<div class="jqGrid_wrapper1">
						<table id="grid_list1"></table>
					    <div id="grid_pager1"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- 여기에 들어가야함..... -->
		<div class="col-lg-8 hideContent">
			<div class="ibox">
				<div class="ibox-title headNmText"></div>
				<div class="ibox-content full-height">
					<div>
						<div class="jqGrid_wrapper2">
							<table id="grid_list2"></table>
							<div id="grid_pager2"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 여기까지가 일단이다. -->
	</div>
</div>

<style>
	input::-ms-clear {
		display: none;
	}

	#gbox_state_list tr.jqgrow td {
		cursor: default;
	}
	
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
	$.g_companyCd = '';
</script>
<script>
	$.fncGrid1 = function() {
		$.ritusGrid({
			gridObject: '#grid_list1',
			url: '${pageContext.request.contextPath}/data/hr/humanCountByCompany.rts',
		    width: $('.jqGrid_wrapper1').width(),
		    height: $.getGridHeight(150),
		    rowNum: 100,
            page: 1,
            scroll: 1,
			loadonce: false,
			sortname: 'CNT',
			sortorder: 'DESC',
		    colNames: ['COMPANY_CD', '협력업체', '명수'],
		    colModel: [
		        {name: 'COMPANY_CD', hidden:true},
		        {name: 'COMPANY', width:200},
		        {name: 'CNT', width:50}
		    ],
			onCellSelect: function(rowid, index, icol, cellcontent, e) {
				var company_cd = $('#grid_list1').jqGrid('getCell', rowid, 'COMPANY_CD');
				$.g_companyCd = company_cd;
				$.fncGrid2(company_cd);
			}
		});
	};
	
	$.fncGrid2 = function() {
		var postData = {
				'category_id': 'RSR00002',
				month : $('#event_month').val()
		};
		
		if ( arguments.length == 1 ) {
			postData.company_cd = arguments[0];
		}
			
		
		//$("#grid_list2").GridUnload();
		$.ritusGrid({
			gridObject: '#grid_list2',
			url: '${pageContext.request.contextPath}/data/work/workingtimebycompany.rts',
			postData: postData,
		    width: $('.jqGrid_wrapper2').width(),
		    height: $.getGridHeight(150),
		    rowNum: 50,
            page: 1,
            scroll: 1,
            loadonce: false,
			sortorder: 'DESC',
			sortname: 'SUP_REQ_DATE',
		    colNames: ['DATA_ID', '날짜', '처리자', '지원시간'],
		    colModel: [
		        {name: 'DATA_ID', hidden:true},
		        {name: 'SUP_REQ_DATE', width:100},
		        {name: 'SUP_WORKING_USER_NAME', width:100},
		        {name: 'SUP_WORK_SUPPORT_TIME', width:100}
		    ]
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
		$.fncGrid2();
	});

	$(window).bind('resize', function () {
		var width1 = $('.jqGrid_wrapper1').width();
		$('#grid_list1').setGridWidth(width1);
		$('#grid_list1').setGridHeight($.getGridHeight(150));
		
		var width2 = $('.jqGrid_wrapper2').width();
		$('#grid_list2').setGridWidth(width2);
		$('#grid_list2').setGridHeight($.getGridHeight(150));
	}).trigger('resize');
});

</script>