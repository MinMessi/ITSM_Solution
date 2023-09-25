<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<!-- start 상단 버튼 영역 -->
<div class="row  border-bottom white-bg dashboard-header" style="height:57px;">
	<div class="col-md-12">
		<div class="row">
			<div class="col-sm-4" style="padding-top:3px;">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
					<div class="input-daterange input-group" id="datepicker">
						<input type="text" class="input-sm form-control" id="startDate" name="startDate" value="${startDate}"  />
						<span class="input-group-addon">~</span>
						<input type="text" class="input-sm form-control" id="endDate" name="endDate" value="${today}"  />
						<span class="input-group-btn">
							<button type="button" class="btn btn-primary btnDateSearch" style="padding-top:4px; padding-bottom:4px;"><i class="fa fa-search"></i></button>
						</span>
					</div>
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
											<li><a search="SR_AST_NAME">자산명</a></li>
											<li><a search="SR_WORK_TITLE">작업명</a></li>
											<li><a search="SR_REQ_USER_NAME">요청자</a></li>
											<li><a search="SR_MANAGER_NAME">담당자</a></li>
											<li><a search="V_SR_RESULT">상태</a></li>
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
	                <h4 class="modal-title">SR 등록</h4>
	            </div>
	            <div class="modal-body">
					<form id="F1" class="form-horizontal">
						<div class="row">
		                	<div class="col-md-6">
		                		<div>
									<label class='col-sm-4' style="padding-top:7px;">작업명<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<input id='SR_WORK_TITLE' type='text' class='form-control required'>
									</div>
								</div>
							</div>
							<div class="col-md-6">
			                	<div>
			                		<input id="SR_AST_ID" type="hidden" class="form-control">
			                		<input id="SR_AST_NAME" type="hidden" class="form-control">
									<label class='col-sm-4' style="padding-top:7px;">작업대상<i class="text-danger">*</i></label>
									<div id="PATH" class='col-sm-8' style="padding-top:7px;"></div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
		                	<div class="col-md-6">
		                		<div>
									<label class='col-sm-4' style="padding-top:7px;">요청일<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control required" id="SR_REQ_DATE" data-inputmask="'alias': 'yyyy-mm-dd'" value="${today}">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
			                	<div>
									<label class='col-sm-4' style="padding-top:7px;">완료예정일<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control required" id="SR_COMPLETE_DATE" data-inputmask="'alias': 'yyyy-mm-dd'" disabled>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<input id="SR_REQ_USER_ID" type="hidden" class="form-control" value="${userInfo.user_id}">
									<input id="SR_REQ_USER_NAME" type="hidden" class="form-control" value="${userInfo.user_name}">
									<label class='col-sm-4' style="padding-top:7px;">요청자</label>
									<div class='col-sm-8' style="padding-top:7px;">
										${userInfo.user_name}
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">담당자<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<select id="SR_MANAGER_ID" class="form-control required">
											${ITO00001}
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">작업환경</label>
									<div class='col-sm-10'>
										<textarea id="SR_WORK_ENV" class='form-control'></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">작업근거</label>
									<div class='col-sm-10'>
										<textarea id="SR_WORK_REASON" class='form-control'></textarea>
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
	                <h4 class="modal-title">SR 완료일 변경</h4>
	            </div>
	            <div class="modal-body">
					<form id="F1" class="form-horizontal">
						<div class="row">
		                	<div class="col-md-6">
		                		<div>
									<label class='col-sm-4' style="padding-top:7px;">작업명<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<input id='SR_WORK_TITLE' type='text' class='form-control required reqdis'>
									</div>
								</div>
							</div>
							<div class="col-md-6">
			                	<div>
			                		<input id="SR_AST_ID" type="hidden" class="form-control">
									<label class='col-sm-4' style="padding-top:7px;">작업대상<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<input id="SR_AST_NAME" type="text" class="form-control" disabled>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
		                	<div class="col-md-6">
		                		<div>
									<label class='col-sm-4' style="padding-top:7px;">요청일<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control required reqdis" id="SR_REQ_DATE" data-inputmask="'alias': 'yyyy-mm-dd'">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
			                	<div>
									<label class='col-sm-4' style="padding-top:7px;">완료예정일<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control required resdis" id="SR_COMPLETE_DATE" data-inputmask="'alias': 'yyyy-mm-dd'" value="${today}">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<input id="SR_REQ_USER_ID" type="hidden" class="form-control">
									<label class='col-sm-4' style="padding-top:7px;">요청자<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<input id='SR_REQ_USER_NAME' type='text' class='form-control required' disabled>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">담당자<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<input id='SR_MANAGER_ID' type='hidden' class='form-control'>
										<input id='SR_MANAGER_NAME' type='text' class='form-control required' disabled>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">작업환경</label>
									<div class='col-sm-10'>
										<textarea id="SR_WORK_ENV" class='form-control reqdis'></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">작업근거</label>
									<div class='col-sm-10'>
										<textarea id="SR_WORK_REASON" class='form-control reqdis'></textarea>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-white btnClose" data-dismiss="modal">닫기</button>
	                <button type="button" class="btn btn-danger btnDelete">삭제</button>
	                <button type="button" class="btn btn-primary btnMod">수정</button>
	            </div>
	        </div>
	    </div>
	</div>

	<div class="modal inmodal fade" id="detailModal3" tabindex="-1" role="dialog"  aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                <h4 class="modal-title">SR 처리결과</h4>
	            </div>
	            <div class="modal-body">
					<form id="F1" class="form-horizontal">
						<div class="row">
		                	<div class="col-md-6">
		                		<div>
									<label class='col-sm-4' style="padding-top:7px;">작업명<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<input id='SR_WORK_TITLE' type='text' class='form-control required' value="" disabled>
									</div>
								</div>
							</div>
							<div class="col-md-6">
			                	<div>
			                		<input id="SR_AST_ID" type="hidden" class="form-control">
									<label class='col-sm-4' style="padding-top:7px;">작업대상<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<input id="SR_AST_NAME" type="text" class="form-control" disabled>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
		                	<div class="col-md-6">
		                		<div>
									<label class='col-sm-4' style="padding-top:7px;">요청일<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<div class="input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control required" id="SR_REQ_DATE" data-inputmask="'alias': 'yyyy-mm-dd'" disabled>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
			                	<div>
									<label class='col-sm-4' style="padding-top:7px;">완료예정일<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control required" id="SR_COMPLETE_DATE" data-inputmask="'alias': 'yyyy-mm-dd'">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
		                	<div class="col-md-12">
		                		<div>
									<label class='col-sm-2' style="padding-top:7px;">처리시간 및 결과<i class="text-danger">*</i></label>
									<div class='col-sm-4'>
										<div class="input-group clockpicker" data-autoclose="true">
			                                <input id="SR_WORK_START_TIME" type="text" class="form-control required" value="">
			                                <span class="input-group-addon">
			                                    <span class="fa fa-clock-o"></span>
			                                </span>
			                            </div>
									</div>
									<div class='col-sm-4'>
										<div class="input-group clockpicker" data-autoclose="true">
			                                <input id="SR_WORK_END_TIME" type="text" class="form-control required" value="">
			                                <span class="input-group-addon">
			                                    <span class="fa fa-clock-o"></span>
			                                </span>
			                            </div>
									</div>
									<div class='col-sm-2'>
										<select id="SR_RESULT" class="form-control required">
											${CDE00012}
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<input id="SR_REQ_USER_ID" type="hidden" class="form-control">
									<label class='col-sm-4' style="padding-top:7px;">요청자<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<input id="SR_REQ_USER_NAME" type="text" class="form-control" disabled>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<input id="SR_MANAGER_ID" type="hidden" class="form-control">
									<label class='col-sm-4' style="padding-top:7px;">담당자<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<input id="SR_MANAGER_NAME" type="text" class="form-control" disabled>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">작업환경</label>
									<div class='col-sm-10'>
										<textarea id="SR_WORK_ENV" class='form-control' disabled></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">작업근거</label>
									<div class='col-sm-10'>
										<textarea id="SR_WORK_REASON" class='form-control' disabled></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">작업내용</label>
									<div class='col-sm-10'>
										<textarea id="SR_WORK_CONT" class='form-control'></textarea>
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

<!-- Data picker -->
<script src="${imageServer}/js/plugins/datapicker/bootstrap-datepicker.js?ts=${cssts}"></script>
<script src="${imageServer}/js/plugins/datapicker/bootstrap-datepicker.kr.js?ts=${cssts}"></script>

<!-- jstree -->
<script src="${imageServer}/js/plugins/jsTree/jstree.min.js"></script>

<!-- jqGrid -->
<script src="${imageServer}/js/plugins/jqGrid/jquery.jqGrid.min.js"></script>

<!-- Clock picker -->
<script src="${imageServer}/js/plugins/clockpicker/clockpicker.js"></script>

<!-- Input mask -->
<script src="${imageServer}/js/plugins/inputmask/jquery.inputmask.bundle.min.js"></script>

<!-- Custom and plugin javascript end -->

<script>
	$.g_selectedPath = '';
	$.g_selectedNode = '';
	$.g_selectedNodeText = '';
	$.g_selectedDataID = '';
	$.g_usrID = '${userInfo.user_id}';
	$.g_searchOption = 'SR_AST_NAME';
</script>

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
		}).bind(
				"select_node.jstree", function(evt, data) {
					// 칼렌더를 닫기 위해
					$('.datepicker').css("display", "none");

					$.g_selectedNode = data.node.id;
					$.g_selectedNode = $.g_selectedNode.substring(11);
					
					if ( data.node.icon.indexOf('list') > -1 ) {
						$.g_selectedNodeText = data.node.text;
						$.g_selectedPath = data.node.original.metaData.VALUE_PATH; 
						$('.headNmText').html($.g_selectedNodeText);
					} else $.g_selectedPath = ''; 
					
					$.fncGrid1();
				}
			);
	};
	
	$.fncGrid1 = function() {
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		$("#grid_list1").GridUnload();
		$.ritusGrid({
			gridObject: '#grid_list1',
			url: '${pageContext.request.contextPath}/data/work/srListByITO.rts',
			postData: {
				category_id : 'RSR00001',
				mid : $.g_selectedNode,
				startDate : startDate,
				endDate : endDate,
				searchOption : $.g_searchOption,
				searchTxt : $('#txtSearch').val()
			},
		    width: $('.jqGrid_wrapper1').width(),
		    height: $.getGridHeight(200),
		    rowNum: 50,
		    rowList: [20, 30, 50],
		    scroll: 1,
		    colNames: ['DATA_ID', 'SR_REQ_USER_ID', 'SR_MANAGER_ID', '자산명', '작업명', '요청일', '완료예정일', '요청자', '담당자', '상태', '소요시간'],
		    colModel: [
		    	{name: 'DATA_ID', hidden:true},
		    	{name: 'SR_REQ_USER_ID', hidden:true},
		    	{name: 'SR_MANAGER_ID', hidden:true},
		        {name: 'SR_AST_NAME', width:200, align:'left'},
		        {name: 'SR_WORK_TITLE', width:300, align:'left'},
		        {name: 'SR_REQ_DATE', width:100},
		        {name: 'SR_COMPLETE_DATE', width:100},
		        {name: 'SR_REQ_USER_NAME', width:100},
		        {name: 'SR_MANAGER_NAME', width:100},
		        {name: 'V_SR_RESULT', width:100},
		        {name: 'SR_WORKING_TIME', width:100}
		    ],
		    onCellSelect: function(rowid, icol, cellcontent, e) {
		    	$('btn.btnDelete').hide();
		    	
		    	var complete_date = $('#grid_list1').jqGrid('getCell', rowid, 'SR_COMPLETE_DATE');
		    	var req_id = $('#grid_list1').jqGrid('getCell', rowid, 'SR_REQ_USER_ID');
		    	var man_id = $('#grid_list1').jqGrid('getCell', rowid, 'SR_MANAGER_ID');
		    	var data_id = $('#grid_list1').jqGrid('getCell', rowid, 'DATA_ID');
		    	
				$.g_selectedDataID = data_id;
				
				if ( req_id == $.g_usrID ) {
					$('.reqdis').prop('disabled', false);
					$('.resdis').prop('disabled', true);
				} else if ( man_id == $.g_usrID ) {
					$('.reqdis').prop('disabled', true);
					$('.resdis').prop('disabled', false);
				} else {
					$('.reqdis').prop('disabled', true);
					$('.resdis').prop('disabled', true);
				}
					
		    	if ( complete_date == '' ) {
		    		if ( $.g_usrID != req_id ) $('.btnDelete').hide();
		    		$.fncGetData('#detailModal2', data_id);
		    		$('#detailModal2').modal({backdrop: "static", keyboard: true});
		    	} else {
		    		$('#detailModal3 .btnAdd').show();
		    		if ( $.g_usrID != man_id ) $('#detailModal3 .btnAdd').hide();
		    		$.fncGetData('#detailModal3', data_id);
		    		$('#detailModal3').modal({backdrop: "static", keyboard: true});
		    	}
		    	
				return;
			}
		});
	};
	
	$.fncClearData = function(obj) {
		$(obj + ' .form-control').each(function() {
			$(this).val('');
		});
	}
	
	$.fncGetData = function(obj, data_id) {
		$.fncClearData(obj);
		$.ritusAjax({
			url: '${pageContext.request.contextPath}/data/work/srDetail.rts',
			data: { data_id : data_id },
			dataType: 'json',
			success: function(data) {
				$(obj + ' .form-control').each(function() {
					var id = $(this).attr('id');
					var d = eval('data.' + id);
					
					if ( typeof d != 'undefined' ) {
						d = d.replaceAll('<br>', '\n');
						$(this).val(d);
					}
				});
			}
		});	
	};
	
	$.fncGetFormData = function(obj) {
		var sendData = {
				category_id : 'RSR00001'
		};
		
		if ( obj != '#detailModal' )
			sendData.data_id = $.g_selectedDataID;
		
		$(obj + ' .form-control').each(function() {
			var id = $(this).attr('id');
			var d = $(this).val();
			
			d = d.replaceAll('\n', '<br>');
			
			if ( d != '' && d != '0' )
				eval('sendData.' + id + ' = "' + d + '"');
		});
		
		if ( obj == '#detailModal' ) {
			if ( typeof sendData.SR_MANAGER_ID != 'undefined' )
				sendData.SR_MANAGER_NAME = $(obj + ' #SR_MANAGER_ID option:selected').text();
		} else if ( obj == '#detailModal3' ) {
			var st = new Date('${today} ' + sendData.SR_WORK_START_TIME);
			var ed = new Date('${today} ' + sendData.SR_WORK_END_TIME);
			
			var diff = ed.getTime() - st.getTime();
			diff = (diff)/1000/60/60;
			sendData.SR_WORKING_TIME = diff.toFixed(2);
			if ( isNaN(diff) )
				sendData.SR_WORKING_TIME = '';
		}
		
		return sendData;
	};
	
	$.fncSaveData = function(obj) {
		var url = '${pageContext.request.contextPath}/data/work/modify.rts';
		if ( obj == '#detailModal' ) url = '${pageContext.request.contextPath}/data/common/create.rts';
		
		var isPass = true;
		$(obj + ' .required').each(function() {
			var v = $(this).val();
			if ( typeof v == 'undefined' || v == '' || v == '0' )
				isPass = false;
		});
		
		if ( !isPass ) {
			alert('필수 데이터를 모두 입력해주세요.');
			return;
		}
		
		$.ritusAjax({
			url: url,
			data: $.fncGetFormData(obj),
			dataType: 'json',
			success: function(data) {
				if ( data.result ) {
					alert('저장되었습니다.');
					$(obj).modal('toggle');
					$.fncGrid1();
				} else alert('오류발생[' + data.message + ']');
			}
		});	
	};
	
	$.fncDeleteData = function(obj) {
		var url = '${pageContext.request.contextPath}/data/common/delete.rts';
		
		$.ritusAjax({
			url: url,
			data: $.fncGetFormData(obj),
			dataType: 'json',
			success: function(data) {
				if ( data.result ) {
					alert('삭제되었습니다.');
					$(obj).modal('toggle');
					$.fncGrid1();
				} else alert('오류발생[' + data.message + ']');
			}
		});	
	};
</script>

<script>
$(function() {
	$.fncDrawHrTree();
	$.fncGrid1();
	
	//검색항목 선택시
	$('ul.dropdown-menu > li > a').click(function() {
		$.g_searchOption = $(this).attr('search');
		var text = $(this).text();
        $('#selSearch').html(text + ' <span class="caret"></span>');
    });
	
	//검색
	$('#btnSearch').click($.fncGrid1);
	
	$('#txtSearch').keydown(function(key) {
		if ( key.keyCode == 13 )
			$('#btnSearch').click();
	});
	
	$(':input').inputmask();
		
	$('.clockpicker').clockpicker();
	
	$('.date').datepicker({
		keyboardNavigation: false,
		forceParse: false,
		autoclose: true,
		language: 'kr',
		format: "yyyy-mm-dd"
	});
	
	$('.input-daterange').datepicker({
	    todayBtn: "linked",
	    keyboardNavigation: false,
	    forceParse: false,
	    autoclose: true,
	    language: 'kr',
	    format: "yyyy-mm-dd"
	});
	
	$('.btnDateSearch').click($.fncGrid1);
	
	$('#btnRegist').click(function() {
		$('#detailModal').modal({backdrop: 'static', keyboard: false});
	});
	
	$('#detailModal2 .btnMod').click(function() {
		$.fncSaveData('#detailModal2');
	});
	
	$('#detailModal3 .btnAdd').click(function() {
		$.fncSaveData('#detailModal3');
	});
	
	$('#detailModal2 .btnDelete').click(function() {
		$.fncDeleteData('#detailModal2');
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