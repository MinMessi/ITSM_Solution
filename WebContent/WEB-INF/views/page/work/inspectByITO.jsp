<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<!-- start 상단 버튼 영역 -->
<div class="row  border-bottom white-bg dashboard-header" style="height:57px;">
	<div class="col-md-12">

		<div class="text-right">
			<div class="infont form-group icons-box navbar-right">
				<button class="btn btn-success" id="btnRegist">점검내역 등록</button>
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

<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-4 hideMenu">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>인력현황</h5>
					<div class="ibox-tools">
						<input type="text" id="hrSearch" style="line-height:15px;">
						<a class="collapse-tree-in">
							<i class="fa fa-chevron-left text-danger"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content full-height">
					<div id="humanResourceTree" class="slimscrollTree">
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-8 hideContent">
			<div class="ibox">
				<div class="ibox-title headNmText"></div>
				<div class="ibox-content full-height">

						<div class="col-sm-12">
							<div class="input-group m-b">
								<div class="input-group-btn">
									<button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button" id="selSearch">자산명 <span class="caret"></span></button>
									<ul id="custom-menu" class="dropdown-menu">
											<li><a search="NM">자산명</a></li>
											<li><a search="USR_ID">작업명</a></li>
											<li><a search="JT_NM">요청자</a></li>
											<li><a search="SM_SI_DIST">담당자</a></li>
											<li><a search="">상태</a></li>
									</ul>
								</div>
								<input type="text" class="form-control"  id="txtSearch"> <span class="input-group-btn"> <button type="button" class="btnGo btn " id="btnSearch">검색
								</button> </span>
							</div>
						</div>
						<br/>
						<br/>
						<div style="padding-top:10px;">
							<div class="jqGrid_wrapper1">
								<table id="grid_list1"></table>
							    <div id="grid_pager1"></div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>

	<div class="modal inmodal fade" id="detailModal" tabindex="-1" role="dialog"  aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                <h4 class="modal-title">점검내역 등록</h4>
	            </div>
	            <div class="modal-body">
					<form id="F1" class="form-horizontal">
						<div class="row">
		                	<div class="col-md-6">
		                		<div>
									<label class='col-sm-4' style="padding-top:7px;">요청일</label>
									<div class='col-sm-8'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control required" id="WRK_ST_DT" data-inputmask="'alias': 'yyyy-mm-dd'">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
			                	<div>
									<label class='col-sm-4' style="padding-top:7px;">대상자산</label>
									<div class='col-sm-8' style="padding-top:7px;">
										소프트웨어 / OS / Linux / Ubuntu 8
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">작업요약</label>
									<div class='col-sm-8' style="padding-top:7px;">
										<input id='user_id' type='text' class='form-control required'>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">구분</label>
									<div class='col-sm-8'>
										<select id="user_type" class="form-control">
											<option value='0'>선택하세요</option>
											<option value='BK'>정기점검</option>
											<option value='RT'>기술지원</option>
											<option value='SI'>장애지원</option>
											<option value='SM'>주정검</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">요건</label>
									<div class='col-sm-10'>
										<textarea class='form-control'></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">상세설명</label>
									<div class='col-sm-10'>
										<textarea class='form-control'></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">요청부서</label>
									<div class='col-sm-8' style="padding-top:7px;">
										<select id="user_type" class="form-control">
											<option value='0'>선택하세요</option>
											<option value='BK'>IT기획</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">요청자</label>
									<div class='col-sm-8'>
										<select id="user_type" class="form-control">
											<option value='0'>선택하세요</option>
											<option value='BK'>최필부</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">진행단계</label>
									<div class='col-sm-8' style="padding-top:7px;">
										<select id="user_type" class="form-control">
											<option value='0'>선택하세요</option>
											<option value='BK'>방문</option>
											<option value='BK'>처리중</option>
											<option value='BK'>완료</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">업무시작일</label>
									<div class='col-sm-8'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control required" id="WRK_ST_DT" data-inputmask="'alias': 'yyyy-mm-dd'">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">담당자</label>
									<div class='col-sm-8' style="padding-top:7px;">
										<select id="user_type" class="form-control">
											<option value='0'>선택하세요</option>
											<option value='BK'>문상필</option>
											<option value='BK'>처리중</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">업무종료일</label>
									<div class='col-sm-8'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control required" id="WRK_ST_DT" data-inputmask="'alias': 'yyyy-mm-dd'">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">중요도</label>
									<div class='col-sm-8' style="padding-top:7px;">
										<select id="user_type" class="form-control">
											<option value='0'>선택하세요</option>
											<option value='BK'>상</option>
											<option value='BK'>중</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">난이도</label>
									<div class='col-sm-8'>
										<select id="user_type" class="form-control">
											<option value='0'>난이도</option>
											<option value='BK'>상</option>
											<option value='BK'>중</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">첨부파일</label>
									<div class='col-sm-10'>
										<i class="fa fa-pdf"></i><a>점검양식.pdf</a>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-white btnClose" data-dismiss="modal">닫기</button>
	                <button type="button" class="btn btn-primary btnAdd">추가</button>
	            </div>
	        </div>
	    </div>
	</div>

	<div class="modal inmodal fade" id="detailModal2" tabindex="-1" role="dialog"  aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                <h4 class="modal-title">점검내역</h4>
	            </div>
	            <div class="modal-body">
					<form id="F1" class="form-horizontal">
						<div class="row">
		                	<div class="col-md-6">
		                		<div>
									<label class='col-sm-4' style="padding-top:7px;">요청일</label>
									<div class='col-sm-8'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control required" id="WRK_ST_DT" data-inputmask="'alias': 'yyyy-mm-dd'" value="2017-09-05" readonly>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
			                	<div>
									<label class='col-sm-4' style="padding-top:7px;">대상자산</label>
									<div class='col-sm-8' style="padding-top:7px;">
										소프트웨어 / OS / Linux / Ubuntu 8
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">작업요약</label>
									<div class='col-sm-8' style="padding-top:7px;">
										<input id='user_id' type='text' class='form-control required' value="보안패치" readonly>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">구분</label>
									<div class='col-sm-8'>
										<select id="user_type" class="form-control" readonly>
											<option value='0'>선택하세요</option>
											<option value='BK'>정기점검</option>
											<option value='RT' selected>기술지원</option>
											<option value='SI'>장애지원</option>
											<option value='SM'>주정검</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">요건</label>
									<div class='col-sm-10'>
										<textarea class='form-control' readonly>보안 권고 사항에 따른 보안 패치 적용</textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">상세설명</label>
									<div class='col-sm-10'>
										<textarea class='form-control' readonly>
보안 권고 사항에 따른 보안 패치 적용
이메일 참조
										</textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">요청부서</label>
									<div class='col-sm-8' style="padding-top:7px;">
										<select id="user_type" class="form-control" readonly>
											<option value='0'>선택하세요</option>
											<option value='BK' selected>IT기획</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">요청자</label>
									<div class='col-sm-8'>
										<select id="user_type" class="form-control" readonly>
											<option value='0'>선택하세요</option>
											<option value='BK' selected>최필부</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">진행단계</label>
									<div class='col-sm-8' style="padding-top:7px;">
										<select id="user_type" class="form-control">
											<option value='0'>선택하세요</option>
											<option value='BK'>방문</option>
											<option value='BK'>처리중</option>
											<option value='BK' selected>완료</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">업무시작일</label>
									<div class='col-sm-8'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control required" id="WRK_ST_DT" data-inputmask="'alias': 'yyyy-mm-dd'" value="2016-09-05">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">담당자</label>
									<div class='col-sm-8' style="padding-top:7px;">
										<select id="user_type" class="form-control" readonly>
											<option value='0'>선택하세요</option>
											<option value='BK' selected>문상필</option>
											<option value='BK'>처리중</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">업무종료일</label>
									<div class='col-sm-8'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control required" id="WRK_ST_DT" data-inputmask="'alias': 'yyyy-mm-dd'">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">중요도</label>
									<div class='col-sm-8' style="padding-top:7px;">
										<select id="user_type" class="form-control" readonly>
											<option value='0'>선택하세요</option>
											<option value='BK'>상</option>
											<option value='BK' selected>중</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">난이도</label>
									<div class='col-sm-8'>
										<select id="user_type" class="form-control" readonly>
											<option value='0'>난이도</option>
											<option value='BK'>상</option>
											<option value='BK' selected>중</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">첨부파일</label>
									<div class='col-sm-10'>
										<i class="fa fa-pdf"></i><a>점검양식.pdf</a>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-white btnClose" data-dismiss="modal">닫기</button>
	                <button type="button" class="btn btn-primary btnAdd">수정</button>
	            </div>
	        </div>
	    </div>
	</div>

<style>
	input::-ms-clear {
		display: none;
	}

	#gbox_state_list tr.jqgrow td {
		cursor: default;
	}
</style>

<!-- start Custom and plugin javascript -->

<!-- Data picker -->
<script src="${imageServer}/js/plugins/datapicker/bootstrap-datepicker.js?ts=${cssts}"></script>
<script src="${imageServer}/js/plugins/datapicker/bootstrap-datepicker.kr.js?ts=${cssts}"></script>

<!-- jstree -->
<script src="${imageServer}/js/plugins/jsTree/jstree.min.js"></script>

<!-- jqGrid -->
<script src="${imageServer}/js/plugins/jqGrid/jquery.jqGrid.min.js"></script>

<!-- Input mask -->
<script src="${imageServer}/js/plugins/inputmask/jquery.inputmask.bundle.min.js"></script>

<!-- Custom and plugin javascript end -->

<script>

	$.fncDrawHrTree = function() {
		$('#hrSearch').keyup(function() {
			if ( $.to ) { clearTimeout($.to); }
			$.to = setTimeout(function() {
				var v = $('#hrSearch').val();
				$('#humanResourceTree').jstree(true).search(v);
			}, 250);
		});
		
		$('#humanResourceTree').jstree({
			'core' : {
				'check_callback' : true,
				'data' : {
	            	 'url' : function(node) {
	                     return '${pageContext.request.contextPath}/data/work/itoTree.rts';
					  },
	                 'data' : function(node) {
	                     var id = node.id == '#' ? '' : node.id;
	                     return {
	                         'parent_cd' : id
	                     };
	                 }
	             }
			},
			'plugins' : [ 'types', 'search' ],
		}).bind('change.jstree', function(e, data) {
			var path = data.instance.get_path(data.node, '/');
			console.log(path);
		});
	};
	
	$.fncGrid1 = function() {
		$("#grid_list1").jqGrid({
			url: '${pageContext.request.contextPath}/json/work_4.json',
			datatype: 'json',
			mtype: 'POST',
		    autowidth: true,
		    shrinkToFit: true,
		    width: $('.jqGrid_wrapper1').width(),
		    height: $.getGridHeight(200),
		    rowNum: 50,
		    rowList: [20, 30, 50],
		    scroll: 1,
		    loadonce: true,
		    gridview: true,
		    colNames: ['발생시간', '완료시간', '작업 요약', '위험도', '담당자', '처리자', '상태'],
		    colModel: [
		        {name: 'field1', width:200},
		        {name: 'field2', width:200},
		        {name: 'field3', width:300, align:'left'},
		        {name: 'field4', width:100},
		        {name: 'field5', width:100},
		        {name: 'field6', width:100},
		        {name: 'field7', width:100}
		    ],
		    viewrecords: true,
		    hidegrid: false,
		    onCellSelect: function(rowid, icol, cellcontent, e) {
		    	$('#detailModal2').modal({backdrop: "static", keyboard: true});
				return;
			}
		});
	};
</script>

<script>
$(function() {
	$.fncDrawHrTree();
	$.fncGrid1();
	
	$(':input').inputmask();
	
	$('.date').datepicker({
		keyboardNavigation: false,
		forceParse: false,
		autoclose: true,
		language: 'kr',
		format: "yyyy-mm-dd"
	});
	
	$('#btnRegist').click(function() {
		$('#detailModal').modal({backdrop: 'static', keyboard: false});
	});
	
	$(window).bind('resize', function () {
		$('div.slimscrollTree').slimscroll({
			height: $.getGridHeight(110) + 'px'
		});
		
		var width1 = $('.jqGrid_wrapper1').width();
		$('#grid_list1').setGridWidth(width1);
		$('#grid_list1').setGridHeight($.getGridHeight(200));
	}).trigger('resize');
});

</script>