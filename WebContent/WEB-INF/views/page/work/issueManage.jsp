<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<!-- start 상단 버튼 영역 -->
<div class="row border-bottom white-bg dashboard-header" style="height:57px;">
	<div class="col-lg-12">
		<div class="row">
		<!-- start 선택박스 영역 -->
			<div class="col-sm-3" style="padding-top:3px;">
				<div data-toggle="buttons" class="btn-group">
					<label class="btn btn-sm btn-white">
					<input type="radio" name="searchOption" class="radioSearch" value="1">전체
					</label>
					<label class="btn btn-sm btn-white">
					<input type="radio" name="searchOption" class="radioSearch" value="3">최근변경
					</label>
					<label class="btn btn-sm btn-white">
					<input type="radio" name="searchOption" class="radioSearch" value="6">미해결
					</label>
					<label class="btn btn-sm btn-white">
					<input type="radio" name="searchOption" class="radioSearch" value="12">해결
					</label>
				</div>
			</div>
			<div class="col-sm-3" style="padding-top:3px;">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
					<div class="input-daterange input-group" id="datepicker">
						<input type="text" class="input-sm form-control" id="start" name="start" value="" readonly />
						<span class="input-group-addon">~</span>
						<input type="text" class="input-sm form-control" id="end" name="end" value="" readonly />
						<span class="input-group-btn">
							<button type="button" class="btn btn-primary" style="padding-top:4px; padding-bottom:4px;" onclick="$.fncSearch();"><i class="fa fa-search"></i></button>
						</span>
					</div>
				</div>
		 	</div>

		<!-- 선택박스 영역 end -->
				<div class="col-md-4">
					<div class="input-group m-b">
						<div class="input-group-btn">
							<button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button" id="selSearch">이름 <span class="caret"></span></button>
							<ul id="custom-menu" class="dropdown-menu">
								<li><a search="NM">이름</a></li>
								<li><a search="USR_ID">사번</a></li>
								<li><a search="JT_NM">직위</a></li>
								<li><a search="DEPT_NM">부서</a></li>
							</ul>
						</div>
						<input type="text" class="form-control" id="txtSearch"> <span class="input-group-btn"> <button type="button" class="btnGo btn " onclick="$.fncSearch();">검색</button> </span>
	 				</div>
				</div>
				<div class="col-md-2">
					<div class="text-right">
						<button class="btn btn-success" id="btnRegist">이슈등록</button>
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

	<div class="modal inmodal fade" id="detailModal" tabindex="-1" role="dialog"  aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                <h4 class="modal-title">이슈 등록</h4>
	            </div>
	            <div class="modal-body">
					<form id="F1" class="form-horizontal">
						<div class="row">
		                	<div class="col-md-6">
		                		<div>
									<label class='col-sm-4' style="padding-top:7px;">상태</label>
									<div class='col-sm-8'>
										<select id="user_type" class="form-control">
											<option value='0'>선택하세요</option>
											<option value='BK'>미해결</option>
											<option value='RT'>작업중</option>
											<option value='SI'>해결</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
			                	<div>
									<label class='col-sm-4' style="padding-top:7px;">중요도</label>
									<div class='col-sm-8' style="padding-top:7px;">
										<select id="user_type" class="form-control">
											<option value='0'>선택하세요</option>
											<option value='BK'>상</option>
											<option value='RT'>중</option>
											<option value='SI'>하</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
		                	<div class="col-md-6">
		                		<div>
									<label class='col-sm-4' style="padding-top:7px;">담당자</label>
									<div class='col-sm-8'>
										<select id="user_type" class="form-control">
											<option value='0'>선택하세요</option>
											<option value='BK'>문상필</option>
											<option value='RT'>최경민</option>
											<option value='SI'>하희호</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
			                	<div>
									<label class='col-sm-4' style="padding-top:7px;">작성자</label>
									<div class='col-sm-8'>
										최필부
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">제목</label>
									<div class='col-sm-10'>
										<input id='user_id' type='text' class='form-control required'>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">내용</label>
									<div class='col-sm-10'>
										<textarea class='form-control'></textarea>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-white btnClose" data-dismiss="modal">닫기</button>
	                <button type="button" class="btn btn-primary btnAdd">저장</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="modal inmodal fade" id="detailModal2" tabindex="-1" role="dialog"  aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                <h4 class="modal-title">이슈 조회</h4>
	            </div>
	            <div class="modal-body">
					<form id="F1" class="form-horizontal">
						<div class="row">
		                	<div class="col-md-6">
		                		<div>
									<label class='col-sm-4' style="padding-top:7px;">상태</label>
									<div class='col-sm-8'>
										<select id="user_type" class="form-control">
											<option value='0'>선택하세요</option>
											<option value='BK'>미해결</option>
											<option value='RT'>작업중</option>
											<option value='SI'>해결</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
			                	<div>
									<label class='col-sm-4' style="padding-top:7px;">중요도</label>
									<div class='col-sm-8' style="padding-top:7px;">
										<select id="user_type" class="form-control" readonly>
											<option value='0'>선택하세요</option>
											<option value='BK'>상</option>
											<option value='RT'>중</option>
											<option value='SI'>하</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
		                	<div class="col-md-6">
		                		<div>
									<label class='col-sm-4' style="padding-top:7px;">담당자</label>
									<div class='col-sm-8'>
										<select id="user_type" class="form-control" readonly>
											<option value='0'>선택하세요</option>
											<option value='BK'>문상필</option>
											<option value='RT'>최경민</option>
											<option value='SI'>하희호</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
			                	<div>
									<label class='col-sm-4' style="padding-top:7px;">작성자</label>
									<div class='col-sm-8'>
										최필부
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">제목</label>
									<div class='col-sm-10'>
										<input id='user_id' type='text' class='form-control required' value="WebLogic 보안관련 이슈 정리">
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">내용</label>
									<div class='col-sm-10'>
										<textarea class='form-control'>
WebLogic 보안관련 이슈 정리
- Oracle 권고 사항에 따른 WebLogic 보안 패치 적용
- Apache Connector 점검										
										</textarea>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-white btnClose" data-dismiss="modal">닫기</button>
	                <button type="button" class="btn btn-primary btnAdd">저장</button>
	            </div>
	        </div>
	    </div>
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
	$.g_searchOption = 'NM';
</script>

<script>
/*
함수명			fncSearch
작성자			정종헌
작성일			2017-03-31
수정사항
*/
$.fncSearch = function() {

	var url = "${pageContext.request.contextPath}/json/work_5.json";

	$("#tableList").GridUnload();
	$("#tableList").jqGrid(
	{
		url: url,
		datatype: 'json',
		mtype: 'POST',
		height : $.getGridHeight(100),
		autowidth : true,
		shrinkToFit : true,
		rowNum : 15,
		rowList : [ 15, 30, 50 ],
		colNames : [ '순번', '상태', '제목', '중요도' ],
		colModel : [
			 {name: 'ordnum', align: 'center', width: '50px'}
			,{name: 'field1', align: 'center', width: '100px'}
			,{name: 'field2',  align: 'left', width: '500px'}
			,{name: 'field3', align: 'center', width: '100px'}
		],
		pager : "#pagerList",
		viewrecords : true,
		hidegrid : false,
		onCellSelect: function(rowid, icol, cellcontent, e) {
			$('#detailModal2').modal({backdrop: 'static', keyboard: false});
		}, loadComplete :function(data){
		$.fncHROver('right');
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
		
		$('#btnRegist').click(function() {
			$('#detailModal').modal({backdrop: 'static', keyboard: false});
		});

		var prevDay = new Date();
		prevDay.setDate(prevDay.getDate() - 7);

		$('.input-daterange input[name=end]').datepicker("update", new Date());
		$('.input-daterange input[name=start]').datepicker("update", prevDay);

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
