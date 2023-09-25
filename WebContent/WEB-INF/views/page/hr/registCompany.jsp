<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<!-- start 상단 버튼 영역 -->
<div class="row  border-bottom white-bg dashboard-header" style="height:57px;">
	<div class="col-md-12">
		<div class="row">
			<div class="col-sm-12">
				<div class="text-right">
					<div class="infont form-group icons-box navbar-right">
						<button class="btn btn-success" id="btnRegist">업체 등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 상단 버튼 영역 end -->

<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox">
				<div class="ibox-content full-height">
						<div>
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
	                <h4 class="modal-title">업체 등록</h4>
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
									<label class='col-sm-4' style="padding-top:7px;">요청자</label>
									<div class='col-sm-8'>
										<select id="user_type" class="form-control">
											<option value='0'>선택하세요</option>
											<option value='BK'>최필부</option>
										</select>
									</div>
								</div>
							</div>
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
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">업무시작일시</label>
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
									<div class='col-sm-12'>
										<div class="input-group clockpicker" data-autoclose="true">
			                                <input type="text" class="form-control" value="14:50">
			                                <span class="input-group-addon">
			                                    <span class="fa fa-clock-o"></span>
			                                </span>
			                            </div>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">업무종료일시</label>
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
									<div class='col-sm-12'>
										<div class="input-group clockpicker" data-autoclose="true">
			                                <input type="text" class="form-control" value="14:50">
			                                <span class="input-group-addon">
			                                    <span class="fa fa-clock-o"></span>
			                                </span>
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
									<label class='col-sm-4' style="padding-top:7px;">요청자</label>
									<div class='col-sm-8'>
										<select id="user_type" class="form-control">
											<option value='0'>선택하세요</option>
											<option value='BK'>최필부</option>
										</select>
									</div>
								</div>
							</div>
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
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">업무시작일시</label>
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
									<div class='col-sm-12'>
										<div class="input-group clockpicker" data-autoclose="true">
			                                <input type="text" class="form-control" value="14:50">
			                                <span class="input-group-addon">
			                                    <span class="fa fa-clock-o"></span>
			                                </span>
			                            </div>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">업무종료일시</label>
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
									<div class='col-sm-12'>
										<div class="input-group clockpicker" data-autoclose="true">
			                                <input type="text" class="form-control" value="14:50">
			                                <span class="input-group-addon">
			                                    <span class="fa fa-clock-o"></span>
			                                </span>
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
					</form>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-white btnClose" data-dismiss="modal">닫기</button>
	                <button type="button" class="btn btn-primary btnAdd">수정</button>
	            </div>
	        </div>
	    </div>
	</div>

<!-- start Custom and plugin javascript -->

<!-- jstree -->
<script src="${imageServer}/js/plugins/jsTree/jstree.min.js"></script>

<!-- jqGrid -->
<script src="${imageServer}/js/plugins/jqGrid/jquery.jqGrid.min.js"></script>

<!-- Input mask -->
<script src="${imageServer}/js/plugins/inputmask/jquery.inputmask.bundle.min.js"></script>

<!-- Custom and plugin javascript end -->

<script>
	
	$.fncGrid1 = function() {
		$.ritusGrid({
			gridObject: '#grid_list1',
			url: '${pageContext.request.contextPath}/data/hr/companyList.rts',
			postData: {
				category_id : 'CDE00002'	
			},
			rowNum: 100,
            page: 1,
            scroll: 1,
			loadonce: false,
			sortname : 'CODE_VALUE',
   			sortorder : 'asc',
			height : $.getGridHeight(130),
			colNames: ['CODE_CD', '업체명', '업체주소', '업체대표번호', 'FAX'],
		    colModel: [
		    	{name: 'CODE_CD', hidden:true, key:true},
		        {name: 'CODE_VALUE', width:100, sorttype: 'string', format: 'string'},
		        {name: 'COM_ADDRESS', width:300, sorttype: 'string', format: 'string', align:'left'},
		        {name: 'COM_PHONE', width:100, sorttype: 'string', format: 'string'},
		        {name: 'COM_FAX', width:100, sorttype: 'string', format: 'string'}
		    ],
			pager : "#grid_pager1"
		});
	};
</script>

<script>
$(function() {
	$.fncGrid1();
	
	$(':input').inputmask();
	
	$('#btnRegist').click(function() {
		$('#detailModal').modal({backdrop: 'static', keyboard: false});
	});
	
	$(window).bind('resize', function () {
		var width1 = $('.jqGrid_wrapper1').width();
		$('#grid_list1').setGridWidth(width1);
		$('#grid_list1').setGridHeight($.getGridHeight(130));
	}).trigger('resize');
});

</script>