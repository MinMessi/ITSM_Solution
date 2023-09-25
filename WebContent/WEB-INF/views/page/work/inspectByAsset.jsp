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
							<button type="button" class="btn btn-primary" id="btnSearch" style="padding-top:4px; padding-bottom:4px;"><i class="fa fa-search"></i></button>
						</span>
					</div>
				</div>
		 	</div>
		 	<div class="col-sm-4">
		 		<select id="SUP_COMPANY" class="form-control">
		 			${CDE00002}
		 		</select>
		 	</div>
			<div class="col-sm-4">
				<div class="text-right">
					<div class="infont form-group icons-box navbar-right">
						<button class="btn btn-success" id="btnRegist">점검내역 등록</button>
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

<div class="wrapper wrapper-content animated fadeInRight" style="z-index:5">
	<div class="row">
		<div class="col-lg-4 hideMenu">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>자산현황</h5>
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
	                <h4 class="modal-title">점검내역 등록</h4>
	            </div>
	            <div class="modal-body">
					<form id="F1" class="form-horizontal">
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">요청일시<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control required" id="SUP_REQ_DATE" data-inputmask="'alias': 'yyyy-mm-dd'">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<div class='col-sm-12'>
										<div class="input-group clockpicker" data-autoclose="true">
			                                <input type="text" id="SUP_REQ_TIME" class="form-control required">
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
							<div class="col-md-12">
			                	<div>
			                		<input type="hidden" class='form-control' id="SUP_AST_CD">
									<label class='col-sm-2'>대상자산<i class="text-danger">*</i></label>
									<div class="col-sm-10">
										<input type="text" id="SUP_AST_NAME" class="form-control" disabled>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">작업요약<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<input id='SUP_WORK_SUMMARY' type='text' class='form-control required'>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">구분<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<select id="SUP_WORK_TYPE" class="form-control required">
											${CDE00013}
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="padding-top:7px;">요건</label>
									<div class='col-sm-10'>
										<textarea id="SUP_REQ" class='form-control'></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="padding-top:7px;">상세설명</label>
									<div class='col-sm-10'>
										<textarea id="SUP_REQ_DETAIL" class='form-control'></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4'' style="padding-top:7px;">요청자<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<select id="SUP_REQ_USER_ID" class="form-control required">
											${CLIENTS}
											<option value='BK' selected>최필부</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">담당자<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<select id="SUP_MANAGER_ID" class="form-control required">
											${ITOS}
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">담당업체</label>
									<div class='col-sm-8'>
										<select id="SUP_COMPANY" class="form-control">
											${CDE00002}
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">처리자</label>
									<div class='col-sm-8'>
										<select id="SUP_WORKING_USER_ID" class="form-control">
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
											<input type="text" class="form-control" id="SUP_WORK_START_DATE" data-inputmask="'alias': 'yyyy-mm-dd'">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<div class='col-sm-12'>
										<div class="input-group clockpicker" data-autoclose="true">
			                                <input type="text" id="SUP_WORK_START_TIME" class="form-control">
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
											<input type="text" class="form-control" id="SUP_WORK_END_DATE" data-inputmask="'alias': 'yyyy-mm-dd'">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<div class='col-sm-12'>
										<div class="input-group clockpicker" data-autoclose="true">
			                                <input type="text" id="SUP_WORK_END_TIME" class="form-control">
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
									<label class='col-sm-4' style="padding-top:7px;">중요도<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<select id="SUP_CRITICAL_RATE" class="form-control required">
											${CDE00014}
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">난이도</label>
									<div class='col-sm-8'>
										<select id="SUP_DIFFICALTY_RATE" class="form-control">
											${CDE00015}
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4'' style="padding-top:7px;">상태</label>
									<div class='col-sm-8'>
										<select id="SUP_STATUS" class="form-control">
											${CDE00016}
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
								</div>
							</div>
						</div>
					</form>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-white btnClose" data-dismiss="modal">닫기</button>
	                <button type="button" class="btn btn-danger btnDel" style="display:none;">삭제</button>
	                <button type="button" class="btn btn-warning btnMod" style="display:none;">수정</button>
	                <button type="button" class="btn btn-primary btnAdd">추가</button>
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
	$.g_action = "I";
	$.data_id = 0;
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
	                     return '${pageContext.request.contextPath}/data/asset/customAssetTree.rts';
					  },
	                 'data' : function(node) {
	                     var id = node.id == '#' ? '' : node.id;
	                     return {
	                         'parent_cd' : id,
	                         'is_custom' : '1'
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
					
					$.g_selectedNodeText = data.node.text;
					$.g_selectedPath = data.node.original.metaData.VALUE_PATH; 
					$('.headNmText').html($.g_selectedNodeText);
					
					/* if ( data.node.original.metaData.ICON.indexOf('list') > -1 ) {
						$.g_selectedNodeText = data.node.text;
						$.g_selectedPath = data.node.original.metaData.VALUE_PATH; 
						$('.headNmText').html($.g_selectedNodeText);
					} else $.g_selectedPath = ''; */ 
					
					$.fncGrid1();
			}
		);
	};
	
	$.fncGrid1 = function() {
		var postData = {
				category_id : 'RSR00002',
				SUP_COMPANY : $('#SUP_COMPANY').val(),
				SUP_AST_CD : $.g_selectedNode,
				startDate : $('#startDate').val(),
				endDate : $('#endDate').val()
		};

		$.ritusGrid({
			gridObject: '#grid_list1',
			url: '${pageContext.request.contextPath}/data/work/supportList.rts',
			postData: postData,
		    width: $('.jqGrid_wrapper1').width(),
		    height: $.getGridHeight(150),
		    shrinkToFit: false,
		    rowNum: 50,
		    scroll: 1,
		    colNames: ['DATA_ID', '자산명', '시작일', '시작시간', '완료일', '완료시간', '작업 요약', '업체', '상태'],
		    colModel: [
		    	{name: 'DATA_ID', hidden: true},
		    	{name: 'SUP_AST_NAME', width:150},
		        {name: 'SUP_WORK_START_DATE', width:100},
		        {name: 'SUP_WORK_START_TIME', width:100},
		        {name: 'SUP_WORK_END_DATE', width:100},
		        {name: 'SUP_WORK_END_TIME', width:100},
		        {name: 'SUP_WORK_SUMMARY', width:200, align: 'left'},
		        {name: 'V_SUP_COMPANY', width:150},
		        {name: 'V_SUP_STATUS', width:100}
		    ],
		    onCellSelect: function(rowid, icol, cellcontent, e) {
		    	$.fncClearForm();
		    	
		    	$.g_action = 'U'
		    	var data_id = $('#grid_list1').jqGrid('getCell', rowid, 'DATA_ID');
		    	$.data_id = data_id;
		    	$.fncGetData(data_id);
				return;
			}
		});
	};
	
	$.fncGetData = function(data_id) {
		$.ritusAjax({
			url: '${pageContext.request.contextPath}/data/work/supportDetail.rts',
			data: { data_id : data_id },
			success: function(data) {
				$('#detailModal #F1 .form-control').each(function() {
					var id = $(this).attr('id');
					var v = eval('data.' + id);
					
					if ( typeof v != 'undefined' && v != '' ) {
						v = v.replaceAll('<br>', '\n');
						$(this).val(v);
					}
				});
				
				$.updateWorkingUser(data.SUP_COMPANY, data.SUP_WORKING_USER_ID);
				
				$('button.btnAdd').hide();
				$('button.btnMod').show();
				$('button.btnDel').show();
				$('#detailModal').modal({backdrop: "static", keyboard: true});
			}
		});	
	}
	
	$.fncGetFormData = function(obj) {
		var sendData = {
				category_id : 'RSR00002'
		};

		$(obj + ' #F1 .form-control').each(function() {
			var id = $(this).attr('id');
			var d = $(this).val();
			
			if ( typeof d != 'undefined' && d != null )
				d = d.replaceAll('\n', '<br>');
			
			if ( d != null && d != '' && d != '0' )
				eval('sendData.' + id + ' = "' + d + '"');
		});
		
		if ( typeof sendData.SUP_WORKING_USER_ID != 'undefined' ) {
			sendData.SUP_WORKING_USER_NAME = $(obj + ' #SUP_WORKING_USER_ID option:selected').text();
		}
		
		if ( $.g_action == 'U' ) sendData.data_id = $.data_id;
		
		if ( sendData.SUP_WORK_START_DATE && sendData.SUP_WORK_END_DATE ) {
			if ( sendData.SUP_WORK_START_TIME && sendData.SUP_WORK_END_TIME ) {
				var workStartTime = new Date(sendData.SUP_WORK_START_DATE + " " + sendData.SUP_WORK_START_TIME);
				var workEndTime = new Date(sendData.SUP_WORK_END_DATE + " " + sendData.SUP_WORK_END_TIME);
				var workSupportTime = ((workEndTime.getTime() - workStartTime.getTime())/1000/60/60).toFixed(2);
				
				sendData.SUP_WORK_SUPPORT_TIME = workSupportTime;
				
			}
			
		}
		
		
		return sendData;
	};
	
	$.fncSaveData = function(obj) {
		var url = '${pageContext.request.contextPath}/data/common/modify.rts';
		if ( $.g_action == 'I' ) url = '${pageContext.request.contextPath}/data/common/create.rts';
		
		var isPass = true;
		$(obj + ' #F1 .required').each(function() {
			var v = $(this).val();
			if ( typeof v == 'undefined' || v == '' || v == '0' )
				isPass = false;
		});
		
		if ( !isPass ) {
			alert('필수 데이터를 모두 입력해주세요.');
			return;
		}
		
		var sendData = $.fncGetFormData(obj);
		
		$.ritusAjax({
			url: url,
			data: sendData,
			dataType: 'json',
			success: function(data) {
				if ( data.result ) {
					alert('저장되었습니다.');
					$('#humanResourceTree').jstree('refresh');				
					$.fncClearForm();
					$.fncGrid1();
					$(obj).modal('toggle');
				} else alert('오류발생[' + data.message + ']');
			}
		});
	};
	
	$.updateWorkingUser = function(company, data_id) {
		var url = '${pageContext.request.contextPath}/data/work/itoWorkerList.rts';

		$.ritusAjax({
			url: url,
			data: { company : company },
			success: function(data) {
				var option = "<option value='ID'>NAME</option>", htmls = "<option value='0'>선택하세요</option>";
				for ( var i=0; i<data.length; i++ ) {
					var html = option.replace('ID', data[i].DATA_ID).replace('NAME', data[i].ITO_NAME);
					htmls += html;
				}
				
				$('#SUP_WORKING_USER_ID').html(htmls);
				$('#SUP_WORKING_USER_ID').val(data_id);
			}
		});	
	};
	
	$.fncClearForm = function(isInit) {
		$('.headNmText').html('');
		
		$('input.form-control').val('');
		$('textarea.form-control').val('');
		$('select').val('0');
		
		$('#SUP_WORKING_USER_ID').empty();
	};
</script>

<script>
$(function() {
	$.fncDrawHrTree();
	$.fncGrid1();
	
	$(':input').inputmask();
	
	$('.clockpicker').clockpicker({
		align: 'left',
		donetext: 'Done',
		default: 'now'
	});
	
	$('.date').datepicker({
		todayBtn: "linked",
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
	
	$('#btnSearch').click($.fncGrid1);
	
	$('#SUP_COMPANY').change(function() {
		$.fncGrid1();
	})
	
	// 점검내역등록 버튼 눌렀을때 이벤트
	$('#btnRegist').click(function() {
		if ( $.g_selectedPath == '' ) {
			alert('자산을 선택해주세요.');
			return;
		}
		
		$('button.btnAdd').show();
		$('button.btnMod').hide();
		$('button.btnDel').hide();
		
		$.fncClearForm();
		
		$.g_action = 'I';
		$('#detailModal #SUP_AST_NAME').val($.g_selectedNodeText);
		$('#detailModal #SUP_AST_CD').val($.g_selectedNode);
		$('#detailModal').modal({backdrop: 'static', keyboard: false});
	});
	
	$('button.btnAdd, button.btnMod').click(function() {
		$.fncSaveData('#detailModal');
	});
	
	$('button.btnDel').click(function() {
		var url = '${pageContext.request.contextPath}/data/common/delete.rts';

		$.ritusAjax({
			url: url,
			data: { category_id:'RSR00002', data_id:$.data_id },
			success: function(data) {
				alert('삭제되었습니다.');
				$.fncGrid1();
				$('#detailModal').modal('toggle');
			}
		});	
	});
	
	$('#detailModal #SUP_COMPANY').change(function() {
		if ( $.g_action == 'U' ) return;
		$.updateWorkingUser($(this).val(), '0');
	});
	
	
	$(window).bind('resize', function () {
		$('div.slimscrollTree').slimscroll({
			height: $.getGridHeight(110) + 'px'
		});
		
		var width1 = $('.jqGrid_wrapper1').width();
		$('#grid_list1').setGridWidth(width1);
		$('#grid_list1').setGridHeight($.getGridHeight(150));
	}).trigger('resize');
});

</script>