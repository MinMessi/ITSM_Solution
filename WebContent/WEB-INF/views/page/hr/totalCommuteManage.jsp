<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<!-- start 상단 버튼 영역 -->
<div class="row border-bottom white-bg dashboard-header" style="height:57px;">
	<div class="col-lg-12">
		<div class="row">
		<!-- start 선택박스 영역 -->
			<div class="col-sm-4" style="padding-top:3px;">
				<div data-toggle="buttons" class="btn-group">
					<label class="btn btn-sm btn-white">
					<input type="radio" name="searchOption" class="radioSearch" value="1">1개월
					</label>
					<label class="btn btn-sm btn-white">
					<input type="radio" name="searchOption" class="radioSearch" value="3">3개월
					</label>
					<label class="btn btn-sm btn-white">
					<input type="radio" name="searchOption" class="radioSearch" value="6">6개월
					</label>
					<label class="btn btn-sm btn-white">
					<input type="radio" name="searchOption" class="radioSearch" value="12">1년
					</label>
				</div>
			</div>
			<div class="col-sm-4" style="padding-top:3px;">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
					<div class="input-daterange input-group" id="datepicker">
						<input type="text" class="input-sm form-control" id="start" name="start" value="${startDate}" readonly />
						<span class="input-group-addon">~</span>
						<input type="text" class="input-sm form-control" id="end" name="end" value="${endDate}" readonly />
						<span class="input-group-btn">
							<button type="button" class="btn btn-primary" style="padding-top:4px; padding-bottom:4px;" onclick="$.fncSearch();"><i class="fa fa-search"></i></button>
						</span>
					</div>
				</div>
		 	</div>

		<!-- 선택박스 영역 end -->
				<div class="col-md-4" style="float: right;">
					<div class="input-group m-b">
						<div class="input-group-btn">
							<button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button" id="selSearch">이름 <span class="caret"></span></button>
							<ul id="custom-menu" class="dropdown-menu">
								<li><a search="ITO_NAME">이름</a></li>
								<li><a search="V_ITO_POSITION">직위</a></li>
								<li><a search="V_ITO_WORK">업무</a></li>
								<li><a search="V_ITO_ATT_TYPE">근태종류</a></li>
							</ul>
						</div>
						<input type="text" class="form-control" id="txtSearch"> <span class="input-group-btn"> <button type="button" class="btnGo btn " onclick="$.fncSearch();">검색</button> </span>
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
	//검색항목
	$.g_searchOption = 'ITO_NAME';
</script>

<script>
/*
함수명			fncSearch
작성자			정종헌
작성일			2017-03-31
수정사항
*/
$.fncSearch = function() {

	var srtDt = $('input[name=start]').val();
	var endDt = $('input[name=end]').val();

	var url = "${pageContext.request.contextPath}/data/hr/commuteList.rts";

	var sendData = {
		category_id : 'ITO00002',
		startDate : srtDt,
		endDate : endDt,
		searchOption : $.g_searchOption,
		searchStr : $('#txtSearch').val()
	};

	$("#tableList").GridUnload();
	
	$.ritusGrid({
		gridObject: '#tableList',
		url: url,
		postData: sendData,
		sortname : 'ITO_ATT_DATETIME',
		sortorder : 'DESC',
		height : $.getGridHeight(100),
		colNames : [ '근태일자', '이름', '직위', '계약구분', '업무', '근태종류', '사유' ],
		colModel : [
			 {name: 'ITO_ATT_DATETIME', width: '100px'},
			 {name: 'ITO_NAME', width: '100px'},
			 {name: 'V_ITO_POSITION', width: '70px'},
			 {name: 'V_ITO_TYPE', width: '100px'},
			 {name: 'V_ITO_WORK', align:'left', width: '300px'},
			 {name: 'V_ITO_ATT_TYPE', width: '100px'},
			 {name: 'ITO_ATT_REASON', align: 'left', width: '200px'}
		],
		pager : "#pagerList",
		onCellSelect: function(rowid, icol, cellcontent, e) {
		}, loadComplete :function(data){
		}
	});
};

/*
함수명			fncInitDate
작성자			이원혁
작성일			2017-02-02
*/
$.fncInitDate = function(v) {
	var today = new Date();
	$('.input-daterange input[name=end]').datepicker("update", today);
	$('.input-daterange input[name=start]').datepicker("update", today.monthAdd(v));
	$('.input-daterange').datepicker("updateDates");
};
</script>
<script>
	/**
		화면 로딩 후 최초 호출 영역
	*/

	$(function() {

		$('.input-daterange').datepicker({
			todayBtn: "linked",
			keyboardNavigation: false,
			forceParse: false,
			autoclose: true,
			language: 'kr',
			format: "yyyy-mm-dd"
		});

		/*
		var prevDay = new Date();
		prevDay.setDate(prevDay.getDate() - 7);

		$('.input-daterange input[name=end]').datepicker("update", new Date());
		$('.input-daterange input[name=start]').datepicker("update", prevDay);
		*/
		
		$('.radioSearch').change(function() {
			var v = Number($(this).val());
			$.fncInitDate(-1 * v);
			$.fncSearch();
		});

		$.fncSearch();

		//검색항목 선택시
		$('ul.dropdown-menu > li > a').click(function() {
			$.g_searchOption = $(this).attr('search');
			var text = $(this).text();
			$('#selSearch').html(text + ' <span class="caret"></span>');
		});
		//검색
		$('#txtSearch').keydown(function(key) {
			if ( key.keyCode == 13 )
				$.fncSearch();
		});

		$(window).bind('resize', function () {
			var state_width = $('div.jqGridWrapper').width();
		 	$('#tableList').setGridWidth(state_width);
			$('#tableList').setGridHeight($.getGridHeight(100));

		}).trigger('resize');
	});
</script>
