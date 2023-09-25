<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<!-- start 상단 버튼 영역 -->
<div class="row  border-bottom white-bg dashboard-header" style="height:57px;">
	<div class="col-md-12">

		<div class="text-right">
			<div class="infont form-group icons-box navbar-right">
				<button class="btn btn-warning" id="btnUpload">엑셀업로드</button>
				<button class="btn btn-success" id="btnSave">저장</button>
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
					<!-- 탭 추가부분 -->
					<div class="tabs-container">
						<ul class="nav nav-tabs">
							<li class="active" align="center" style="width:140px"><a data-toggle="tab" href="#tab-1" id="tab1">자산 등록</a></li>
						</ul>
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body slimscrollContent">
									<form id="F1" action="#" class="form-horizontal DATA_INSERT_FORM" cid="IHO00002">
										<input type="hidden" id="AST_PRNT_CD" class="form-control">
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">회계단위</label>
													<div class="col-sm-8">
														<input id="AST_ACCOUNT_UNIT" name="AST_ACCOUNT_UNIT" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">회계단위명</label>
													<div class="col-sm-8">
														<input id="AST_ACCOUNT_UNIT_NAME" name="AST_ACCOUNT_UNIT_NAME" type="text" class="form-control">
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">자산ID</label>
													<div class="col-sm-8">
														<input id="AST_ID" name="AST_ID" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">자산분류</label>
													<div id="asset_string" class="col-sm-8" style="padding-top:7px;">
														상위 자산을 선택해주세요.
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">자산구분</label>
													<div id="div_getId" class="col-sm-8">
														<input id="AST_TYPE" name="AST_TYPE" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">자산구분명</label>
													<div class="col-sm-8">
														<input id="AST_TYPE_NAME" name="AST_TYPE_NAME" type="text" class="form-control">
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">상태코드</label>
													<div id="div_getId" class="col-sm-8">
														<input id="AST_STATUS_CD" name="AST_STATUS_CD" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">시스템ID</label>
													<div class="col-sm-8">
														<input id="AST_SYSTEM_ID" name="AST_SYSTEM_ID" type="text" class="form-control">
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">자산명<i class="text-danger">*</i></label>
													<div id="div_getId" class="col-sm-8">
														<input id="AST_NAME" name="AST_NAME" type="text" class="form-control required">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label"><small>자산관리번호<i class="text-danger">*</i></small></label>
													<div class="col-sm-8">
														<input id="AST_MANAGE_NUM" name="AST_MANAGE_NUM" type="text" class="form-control required">
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">관리팀</label>
													<div id="div_getId" class="col-sm-8">
														<input id="AST_MANAGE_TEAM" name="AST_MANAGE_TEAM" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">관리담당</label>
													<div id="div_getId" class="col-sm-8">
														<input id="AST_MANAGER" name="AST_MANAGER" type="text" class="form-control">
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">배치장소</label>
													<div class="col-sm-8">
														<input id="AST_LOCATION" name="AST_LOCATION" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label"><small>상각완료연도</small></label>
													<div class="col-sm-8">
														<div class="date YEARPICKER input-group" id="datepicker">
															<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
															<input type="text" class="form-control" id="AST_DEP_COM_YEAR" data-inputmask="'alias': 'yyyy'">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">Host name</label>
													<div class="col-sm-8">
														<input id="AST_HOST_NAME" name="AST_HOST_NAME" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">업무용도</label>
													<div id="div_getId" class="col-sm-8">
														<input id="AST_WORK_USE" name="AST_WORK_USE" type="text" class="form-control" >
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">시스템</label>
													<div class="col-sm-8">
														<input id="AST_SYSTEM" name="AST_SYSTEM" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">EOS일자</label>
													<div class="col-sm-8">
														<div class="date DATEPICKER input-group" id="datepicker">
															<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
															<input type="text" class="form-control" id="AST_EOD_DATE" data-inputmask="'alias': 'yyyy-mm-dd'">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">품명</label>
													<div class="col-sm-8">
														<input id="AST_PRODUCT_NAME" name="AST_PRODUCT_NAME" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">모델명</label>
													<div id="div_getId" class="col-sm-8">
														<input id="AST_MODEL_NAME" name="AST_MODEL_NAME" type="text" class="form-control" >
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">통신망</label>
													<div class="col-sm-8">
														<input id="AST_NETWORK" name="AST_NETWORK" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">OS</label>
													<div class="col-sm-8">
														<input id="AST_OS" name="AST_OS" type="text" class="form-control" >
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">CPU</label>
													<div class="col-sm-8">
														<input id="AST_CPU" name="AST_CPU" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">Memory</label>
													<div id="div_getId" class="col-sm-8">
														<input id="AST_MEMORY" name="AST_MEMORY" type="text" class="form-control" >
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">HDD</label>
													<div class="col-sm-8">
														<input id="AST_HDD" name="AST_HDD" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">IP</label>
													<div class="col-sm-8">
														<input id="AST_IP" name="AST_IP" type="text" class="form-control" >
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">라이선스</label>
													<div class="col-sm-8">
														<input id="AST_LICENSE" name="AST_LICENSE" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">개수</label>
													<div class="col-sm-8">
														<input id="AST_COUNT" name="AST_COUNT" type="text" class="form-control" >
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label"><small>유지정비계약</small></label>
													<div class="col-sm-8">
														<input id="AST_SUPPORT_CONTRACT" name="AST_SUPPORT_CONTRACT" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label"><small>월 유지정비료</small></label>
													<div class="col-sm-8">
														<input id="AST_SUPPORT_FEE_MONTH" name="AST_SUPPORT_FEE_MONTH" type="text" class="form-control">
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">통신망(중)</label>
													<div class="col-sm-8">
														<input id="AST_M_NETWORK" name="AST_M_NETWORK" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">위치(대)</label>
													<div class="col-sm-8">
														<input id="AST_L_LOCATION" name="AST_L_LOCATION" type="text" class="form-control" >
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">위치(중)</label>
													<div class="col-sm-8">
														<input id="AST_M_LOCATION" name="AST_M_LOCATION" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">위치(소)</label>
													<div class="col-sm-8">
														<input id="AST_S_LOCATION" name="AST_S_LOCATION" type="text" class="form-control" >
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">로그</label>
													<div class="col-sm-8">
														<input id="AST_LOG" name="AST_LOG" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">시리얼번호</label>
													<div class="col-sm-8">
														<input id="AST_SERIAL_NUM" name="AST_SERIAL_NUM" type="text" class="form-control" >
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">처분방법</label>
													<div class="col-sm-8">
														<input id="AST_DISPOSAL_TYPE" name="AST_DISPOSAL_TYPE" type="text" class="form-control">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">처분일자</label>
													<div class="col-sm-8">
														<div class="date DATEPICKER input-group" id="datepicker">
															<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
															<input type="text" class="form-control" id="AST_DISPOSAL_DATE" data-inputmask="'alias': 'yyyy-mm-dd'">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">취득일</label>
													<div class="col-sm-8">
														<div class="date DATEPICKER input-group" id="datepicker">
															<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
															<input type="text" class="form-control" id="AST_GET_DATE" data-inputmask="'alias': 'yyyy-mm-dd'">
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">수정일</label>
													<div class="col-sm-8">
														<div class="date DATEPICKER input-group" id="datepicker">
															<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
															<input type="text" class="form-control" id="AST_GET_MOD_DATE" data-inputmask="'alias': 'yyyy-mm-dd'">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">협력업체</label>
													<div class="col-sm-8">
														<select id="AST_SUPPORT_COMPANY" class="form-control">
															${CDE00002}
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
							</div>
						</div>
					</div>
				<!-- 탭 end -->
				<!-- content -->
				</div>
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

<!-- Input mask -->
<script src="${imageServer}/js/plugins/inputmask/jquery.inputmask.bundle.min.js"></script>

<!-- Custom and plugin javascript end -->
<script>

	$.g_node_id = '';

</script>

<script>

	$.fncClearForm = function() {
		$('input.form-control').val('');
		$('select').val('0');
	};

	$.fncSearchData = function(node_id) {
		$.ritusAjax({
			url: '${pageContext.request.contextPath}/data/asset/assetDetail.rts',
			data: { data_id : node_id },
			dataType: 'json',
			success: function(data) {
				$('#F1 .form-control').each(function() {
					var id = $(this).attr('id');
					var d = eval('data.' + id);
	
					if ( typeof d != 'undefined' )
						$(this).val(d);
				});
			}
		});	
	};

	$.fncWindowResize = function() {
		var integerContentHeight = $.getGridHeight(60);
		$('div.full-height').height(integerContentHeight);
	};

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
	                     return '${pageContext.request.contextPath}/data/asset/assetTree.rts';
					  },
	                 'data' : function(node) {
	                     var id = node.id == '#' ? '' : node.id;
	                     return {
	                         'parent_cd' : id
	                     };
	                 }
	             }
			},
			'plugins' : [ 'types', 'contextmenu', 'search' ],
			'contextmenu' : {
				"items": function ($node) {
					if ( $.g_node_id != '' && $.g_node_id.indexOf('CDE') == -1 ) {
						return {
							"Delete": {
								"label": "자산삭제",
								"action": function (data) {
									$.alertConfirmCallback('자산 삭제', '정말로 삭제하시겠습니까?', '', function() {
										$.fncDeleteData();
									});
								}
							}
						};
					}
				}
			}
		}).bind(
				"select_node.jstree", function(evt, data) {
					$.g_node_id = data.node.id;
					var path = data.node.original.metaData.VALUE_PATH;
					$('#asset_string').html(path);
					
					$.fncClearForm();
					if ( $.g_node_id != '' && $.g_node_id.indexOf('CDE') == -1 )
						$.fncSearchData($.g_node_id);
				}
		);
	};
	
	$.fncDeleteData = function() {
		var url = '${pageContext.request.contextPath}/data/common/delete.rts';
		
		$.ritusAjax({
			url: url,
			data: { category_id:'AST00001', data_id:$.g_node_id },
			success: function(data) {
				if ( data.result ) {
					alert('삭제되었습니다.');
					$('#humanResourceTree').jstree('refresh');
				}
			}
		});	
	};
	
	$.fncGetFormData = function(node_id) {
		var sendData = {
				category_id : 'AST00001'
		};
		
		if ( node_id.indexOf('CDE') == -1 ) sendData.data_id = node_id;
		else sendData.AST_PRNT_CD = node_id;
		
		$('#F1 .form-control').each(function() {
			var id = $(this).attr('id');
			var d = $(this).val();
			
			if ( d != '' && d != '0' )
				eval('sendData.' + id + ' = "' + d + '"');
		});
		
		return sendData;
	};
	
	$.fncSaveData = function() {
		if ( $.g_node_id == '' ) {
			alert('자산을 선택해주세요.');
			return;
		}
		
		var isPass = true;
		$('#F1 .required').each(function() {
			var v = $(this).val();
			if ( typeof v == 'undefined' || v == '' || v == '0' )
				isPass = false;
		});
		
		if ( !isPass ) {
			alert('필수 데이터를 모두 입력해주세요.');
			return;
		}
		
		var is_modify = false;
		if ( $.g_node_id.indexOf('CDE') == -1 ) is_modify = true;
		
		var url = '${pageContext.request.contextPath}/data/common/create.rts';
		if ( is_modify ) url = '${pageContext.request.contextPath}/data/common/modify.rts';
		
		$.ritusAjax({
			url: url,
			data: $.fncGetFormData($.g_node_id),
			dataType: 'json',
			success: function(data) {
				if ( data.result ) {
					alert('저장되었습니다.');
					$('#humanResourceTree').jstree('refresh');
				} else alert('오류발생[' + data.message + ']');
			}
		});	
	};
</script>

<script>
$(function() {
	$(':input').inputmask();
	$.fncDrawHrTree();
	
	$('.YEARPICKER').datepicker({
    	format: 'yyyy',
    	minViewMode: 2,
    	language: 'kr',
    	autoclose: true
    });
	
	$('.DATEPICKER').datepicker({
		keyboardNavigation: false,
		forceParse: false,
		autoclose: true,
		language: 'kr',
		format: "yyyy-mm-dd"
	});
	
	$('#btnSave').click($.fncSaveData);
	
	$('#btnUpload').click(function() {
		location.href = '${pageContext.request.contextPath}/page/asset/assetUpload.rts';
	});

	$(window).bind('resize', function () {
		$('div.slimscrollContent').slimscroll({
			height: $.getGridHeight(150) + 'px'
		});

		$('div.slimscrollTree').slimscroll({
			height: $.getGridHeight(110) + 'px'
		});
	}).trigger('resize');
});

</script>