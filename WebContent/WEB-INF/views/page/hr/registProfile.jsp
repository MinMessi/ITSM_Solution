<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<!-- start 상단 버튼 영역 -->
<div class="row  border-bottom white-bg dashboard-header" style="height:57px;">
	<div class="col-md-12">

		<div class="text-right">
			<div class="infont form-group icons-box navbar-right">
				<button class="btn btn-warning" id="btnInit">새로입력</button>
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
					<h5>조직도</h5>
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
							<li class="active" align="center" style="width:140px"><a data-toggle="tab" href="#tab-1" id="tab1">프로필 등록</a></li>
						</ul>
						<div class="tab-content">
							<div id="tab-1" class="tab-pane active">
								<div class="panel-body slimscrollContent">
									<form id="F1" action="#" class="form-horizontal DATA_INSERT_FORM" cid="ITO00001">
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">성명<i class="text-danger">*</i></label>
													<div id="div_getId" class="col-sm-8">
														<input id="ITO_NAME" name="ITO_NAME" type="text" class="form-control  required" maxlength="6" value="">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">구분<i class="text-danger">*</i></label>
													<div class="col-sm-8">
														<select id="ITO_TYPE" name="ITO_TYPE" class="form-control required">
															${CDE00001}
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">직위</label>
													<div id="div_getId" class="col-sm-8">
														<select id="ITO_POSITION" name="ITO_POSITION" class="form-control">
															${CDE00005}
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">담당업무</label>
													<div class="col-sm-8">
														<select id='ITO_WORK' name='ITO_WORK' class='form-control reference chosen-select' data-placeholder='선택하세요.' multiple>
															${CDE00007}
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">협력업체<i class="text-danger">*</i></label>
													<div id="belongCanvas" class="col-sm-8">
														<select id="ITO_COMPANY" name="ITO_COMPANY" class="form-control required">
															${CDE00002}
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">정/부<i class="text-danger noreside">*</i></label>
													<div class="col-sm-8">
														<select id="ITO_PS" name="ITO_PS" class="form-control reference">
															${CDE00011}
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">성별</label>
													<div class="col-sm-8">
														<select id="ITO_SEX" name="ITO_SEX" class="form-control reference">
															${CDE00003}
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">대체담당</label>
													<div class="col-sm-8">
														<input id="ITO_SND" name="ITO_SND" type="text" class="form-control">
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">이메일</label>
													<div class="col-sm-8">
														<input id="ITO_EMAIL" name="ITO_EMAIL" type="text" class="form-control" style="ime-mode:inactive;" data-inputmask="'alias': 'email'">
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">핸드폰</label>
													<div class="col-sm-8">
														<input id="ITO_MOBILE" name="ITO_MOBILE" type="text" data-inputmask="'mask': '999-999[9]-9999'" class="form-control">
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">업무시작일</label>
													<div class="col-sm-8">
														<div class="date input-group" id="datepicker">
															<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
															<input type="text" class="form-control" id="ITO_WORK_START" data-inputmask="'alias': 'yyyy-mm-dd'">
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label">업무종료일</label>
													<div class="col-sm-8">
														<div class="date input-group" id="datepicker">
															<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
															<input type="text" class="form-control" id="ITO_WORK_END" data-inputmask="'alias': 'yyyy-mm-dd'" >
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="hr-line-dashed"></div>
										<div class="row">
											<div class="col-md-6">
												<div>
													<label class="col-sm-4 control-label"><small>로그인 아이디<i class="text-danger reside">*</i></small></label>
													<div class="col-sm-8">
														<input type="text" class="form-control" id="ITO_USER_ID">
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

<!-- Chosen -->
<script src="${imageServer}/js/plugins/chosen/chosen.jquery.js"></script>

<!-- Custom and plugin javascript end -->
<script>
	$.g_selectedItem = 'D';
	$.node_id = '';
</script>

<script>

	$.fncClearForm = function(isInit) {
		$.node_id = '';
		$('.headNmText').html('');
		
		if ( isInit )
			$('#humanResourceTree').jstree('deselect_all');
		
		$('input.form-control').val('');
		$('select').val('0');
		
		$(".chosen-select").val('').trigger("chosen:updated");
		
		$('#ITO_USER_ID').prop('disabled', false);
		$.fncRequiredByType();
	};
	
	$.fncSearchData = function(node_id) {
		$.ritusAjax({
			url: '${pageContext.request.contextPath}/data/hr/itoProfile.rts',
			data: { node_id : node_id },
			dataType: 'json',
			success: function(data) {
				$('#F1 .form-control').each(function() {
					var id = $(this).attr('id');
					var d = eval('data.' + id);

					if ( typeof d != 'undefined' ) {
						if ( $(this).hasClass('chosen-select') ) {
							var temp = d.split(',');
    						for ( var i=0; i<temp.length; i++ ) {
    							var options = $(this).find('option');
    							for ( var j=0; j<options.length; j++ ) {
    								if ( $(options[j]).attr('value') == temp[i] ) {
    									$(options[j]).prop('selected', true);
    									break;
    								}
    							}
    						}
						} else $(this).val(d);
					}
				});
				
				$(".chosen-select").trigger("chosen:updated");
				$.fncRequiredByType();
				$('#ITO_USER_ID').prop('disabled', true);
			}
		});	
	};

	$.fncWindowResize = function() {
		var integerContentHeight = $.getGridHeight(60);
		$('div.full-height').height(integerContentHeight);
	};

	$.fncDrawHrTree = function() {
		$.to = false;
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
						return '${pageContext.request.contextPath}/data/hr/itoTree.rts';
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
					if ( $.g_selectedItem == 'U' ) {
						return {
							"Delete": {
								"label": "인력삭제",
								"action": function (data) {
									$.alertConfirmCallback('사용자 삭제', '정말로 삭제하시겠습니까?', '', function() {
										$.fncDeleteData();
										$.fncClearForm();
									});
								}
							}
						};
					}
				}
			}
		}).bind(
				"select_node.jstree", function(evt, data) {
					// 칼렌더를 닫기 위해
					$('.datepicker').css("display", "none");

					if ( typeof data.node.original.metaData.V_ITO_TYPE == 'undefined' )
						$.g_selectedItem = 'D';
					else $.g_selectedItem = 'U';
					
					//초기화
					$.fncClearForm();
					
					$.node_id = '';
					if( $.g_selectedItem == 'U' ) {
						var headNmText = data.node.text;
						$('.headNmText').html("<h5>" + headNmText + "</h5>");

						$.fncSearchData(data.node.id);
						$.node_id = data.node.id;
					}
				}
			);
	};
	
	$.fncGetFormData = function(node_id) {
		var sendData = {
				category_id : 'ITO00001'
		};
		
		if ( node_id != '' ) sendData.data_id = node_id.substring(11);
		
		$('#F1 .form-control').each(function() {
			var id = $(this).attr('id');
			var d = $(this).val();
			
			if ( d != '' && d != '0' )
				eval('sendData.' + id + ' = "' + d + '"');
		});
		
		//유효여부
		sendData.ITO_IS_VALID = '1';
		
		return sendData;
	};
	
	$.fncRequiredByType = function() {
		var v = $('#ITO_TYPE').val();
		
		$('.noreside').hide();
		$('.reside').hide();
		$('#ITO_PS').removeClass('required');
		$('#ITO_USER_ID').removeClass('required');
		
		if ( v == 'CDE00001001' ) {
			$('.reside').show();
			$('#ITO_USER_ID').addClass('required');
		} else if ( v == 'CDE00001002' || v == 'CDE00001003' ) {
			$('.noreside').show();
			$('#ITO_PS').addClass('required');
		}
	};
	
	$.fncSaveData = function() {
		var url = '${pageContext.request.contextPath}/data/common/modify.rts';
		if ( $.node_id == '' ) url = '${pageContext.request.contextPath}/data/common/create.rts';
		
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
		
		var sendData = $.fncGetFormData($.node_id);
		
		$.ritusAjax({
			url: url,
			data: sendData,
			dataType: 'json',
			success: function(data) {
				if ( data.result ) {
					alert('저장되었습니다.');
					$('#humanResourceTree').jstree('refresh');
					
					var user_id = sendData.ITO_USER_ID;
					if ( typeof user_id != 'undefined' && user_id != '' ) {
						$.ritusAjax({
							url: '${pageContext.request.contextPath}/data/hr/createLoginUser.rts',
							data : { user_id : user_id, user_name : sendData.ITO_NAME },
							success: function(data) {
								//do nothing
							}
						});
					}
					
					$.fncClearForm();
				} else alert('오류발생[' + data.message + ']');
			}
		});	
	};
	
	$.fncDeleteData = function() {
		var url = '${pageContext.request.contextPath}/data/common/delete.rts';

		$.ritusAjax({
			url: url,
			data: { category_id:'ITO00001', data_id:$.node_id.substring(11) },
			dataType: 'json',
			success: function(data) {
				alert('삭제되었습니다.');
				$('#humanResourceTree').jstree('refresh');
			}
		});	
	};
</script>

<script>
$(function() {
	$('.noreside, .reside').hide();
	$(':input').inputmask();
	$.fncDrawHrTree();
	
	$('.chosen-select').chosen({
		width: '100%'
	});
	
	$('#ITO_TYPE').change($.fncRequiredByType);
	
	$('.date').datepicker({
		keyboardNavigation: false,
		forceParse: false,
		autoclose: true,
		language: 'kr',
		format: "yyyy-mm-dd"
	});
	
	$('#btnInit').click(function() {
		$.fncClearForm(true);
	});
	
	$('#btnSave').click(function() {
		$.fncSaveData();
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