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

<div class="wrapper wrapper-content animated fadeInRight" style="z-index:5;">
	<div class="row">
		<div class="col-lg-2 hideMenu">
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
		<div class="col-lg-10 hideContent">
			<div class="ibox">
				<div class="ibox-title headNmText"></div>
				<div class="ibox-content full-height">

						<div class="col-sm-12">
							<div class="input-group m-b">
								<div class="input-group-btn">
									<button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button" id="selSearch">작업명 <span class="caret"></span></button>
									<ul id="custom-menu" class="dropdown-menu">
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

	<!-- SR 처리결과 Modal 시작 -->
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
		                	<div class="col-md-12">
		                		<div>
									<label class='col-sm-2' style="padding-top:7px;">작업명<i class="text-danger"></i></label>
									<div class='col-sm-10'>
										<input id='SR_WORK_TITLE' type='text' class='form-control'>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
			                	<div>
			                		<input id="SR_AST_ID" type="hidden" class="form-control">
									<label class='col-sm-2' style="padding-top:7px;">작업대상<i class="text-danger"></i></label>
									<div class='col-sm-10'>
										<input id="SR_AST_NAME" type="text" class="form-control required" disabled>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<label class='col-sm-2' style="padding-top:7px;">적용환경<i class="text-danger">*</i></label>
									<div class='col-sm-10'>
										<select id="SR_APPLY_ENV" class="form-control required" disabled>
											${CDE00021}
										</select>
									</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<label class='col-sm-2' style="padding-top:7px;">이슈<i class="text-danger"></i></label>
								<div class='col-sm-10'>
									<select id="SR_ISSUE" class="form-control">
										${CDE00022}
									</select>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">시스템명</label>
									<div class='col-sm-10'>
										<input type="text" id="SR_SYSTEM_NAME" class='form-control'/>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
		                	<div class="col-md-6">
		                		<div>
									<label class='col-sm-4' style="padding-top:7px;">요청일 <i class="text-danger">*</i></label>
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
									<label class='col-sm-4' style="padding-top:7px;">완료예정일<i class="text-danger"></i></label>
									<div class='col-sm-8'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control resdis" id="SR_COMPLETE_DATE" data-inputmask="'alias': 'yyyy-mm-dd'">
										</div>
									</div>
								</div>
							</div>
						</div>	
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">작업시작시간<i class="text-danger"></i></label>
									<div class='col-sm-8'>
										<div class="input-group clockpicker" data-autoclose="true">
											<input id="SR_WORK_START_TIME" type="text" class="form-control" value="">
											<span class="input-group-addon">
												<span class="fa fa-clock-o"></span>
											</span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px">작업종료시간<i class="text-danger"></i></label>
									<div class='col-sm-8'>
										<div class="input-group clockpicker" data-autoclose="true">
			                                <input id="SR_WORK_END_TIME" type="text" class="form-control" value="">
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
									<input id="SR_REQ_USER_ID" type="hidden" class="form-control">
									<label class='col-sm-4' style="padding-top:7px;">요청자<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<input id="SR_REQ_USER_NAME" type="text" class="form-control required" disabled>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<input id="SR_MANAGER_ID" type="hidden" class="form-control">
									<label class='col-sm-4' style="padding-top:7px;">담당자<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<select id="SR_MANAGER_ID" class="form-control required reqdis">
											${ITOS}
										</select>
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
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">작업결과</label>
									<div class='col-sm-10'>
										<textarea id="SR_RESULT_CONT" class='form-control'></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="margin-right:-5px;">확인내용</label>
									<div class='col-sm-10'>
										<textarea id="SR_CONFIRM_CONT" class='form-control'></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<label class='col-sm-2' style="padding-top:7px;">결과<i class="text-danger">*</i></label>
								<div class='col-sm-10'>
									<select id="SR_RESULT" class="form-control required">
										${CDE00012}
									</select>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<label class='col-sm-4' style="padding-top:7px;">작업시간(전체)<i class="text-danger"></i></label>
								<div class='col-sm-8'>
			                         <input id="SR_WORKING_TIME" class="form-control touchspin2" type="text" value="0">
								</div>
							</div>
							<div class="col-md-6">
								<label class='col-sm-4' style="padding-top:7px;">작업시간(시간외)<i class="text-danger"></i></label>
								<div class='col-sm-8'>
			                         <input id="SR_WORKING_TIME_OUT" class="form-control touchspin2" type="text">
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<label class='col-sm-2' style="padding-top:7px;">첨부파일</label>
								<div class='col-sm-10'>
									<div id="file_text"></div>
									<button class="btn btn-warning btnUploadFiles" onclick="return false;">파일업로드</button>
									<input id="SR_FILE" type="hidden" class="form-control">
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
	
	<!-- 파일 업로드 관련 form -->
	<form id="uploadForm" enctype="multipart/form-data" style="display:none;">
		<input id="uploadMultipleFile" multiple="multiple" type="file" name="filename" />
	</form>	

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

<!-- iCheck -->
<script src="${imageServer}/js/plugins/iCheck/icheck.min.js"></script>

<!-- touchspin -->
<script src="${imageServer}/js/plugins/touchspin/jquery.bootstrap-touchspin.min.js"></script>

<!-- Custom and plugin javascript end -->

<script>
	$.g_selectedPath = '';
	$.g_selectedNode = '';
	$.g_selectedNodeText = '';
	$.g_selectedDataID = '';
	$.g_usrID = '${userInfo.user_id}';
	$.g_searchOption = 'SR_WORK_TITLE';
	$.g_searchSRNum = '';
	$.g_objModal = '';
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
			url: '${pageContext.request.contextPath}/data/work/srresultlistbyito.rts',
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
		    colNames: ['DATA_ID', 'SR_REQ_USER_ID', 'SR_MANAGER_ID', 'SR No.', '자산명', '작업명', '요청일', '완료예정일', '요청자', '담당자', '상태', '소요시간'],
		    colModel: [
		    	{name: 'DATA_ID', hidden:true},
		    	{name: 'SR_REQ_USER_ID', hidden:true},
		    	{name: 'SR_MANAGER_ID', hidden:true},
		    	{name: 'SR_NUMBER', width:200, align:'left'},
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
		    	// $('btn.btnDelete').hide();
		    	
		    	var complete_date = $('#grid_list1').jqGrid('getCell', rowid, 'SR_COMPLETE_DATE');
		    	var req_id = $('#grid_list1').jqGrid('getCell', rowid, 'SR_REQ_USER_ID');
		    	var man_id = $('#grid_list1').jqGrid('getCell', rowid, 'SR_MANAGER_ID');
		    	var data_id = $('#grid_list1').jqGrid('getCell', rowid, 'DATA_ID');
		    	var sr_num = $('#grid_list1').jqGrid('getCell', rowid, 'SR_NUMBER');
		    	
				$.g_selectedDataID = data_id;
				$.g_searchSRNum = sr_num;
				
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
				
				
				
		    	$('#detailModal3 .btnAdd').show();
		    	$.fncGetData('#detailModal3', data_id);
		    	
		    	if ( $.g_usrID != man_id && $.g_usrID != req_id ) {
	    			$('#detailModal3 .btnAdd').hide();
	    			$('#detailModal3 .btnUploadFiles').prop('disabled', true);
	    		}
		    	
		    	$('#detailModal3').modal({backdrop: "static", keyboard: true});
		    	
				return;
			}
		});
	};
	
	$.fncClearData = function(obj) {
		$(obj + ' .form-control').each(function() {
			if ( $(this).context.nodeName == 'SELECT' ) {
				$(this).find('option:first-child').attr('checked', true);
			
			} else if( $(this).attr('id') == 'SR_REQ_USER_ID' || $(this).attr('id') == 'SR_REQ_USER_NAME' ) {
				$(this).find('#SR_REQ_USER_ID').val('${userInfo.user_id}');
				$(this).find('#SR_REQ_USER_NAME').val('${userInfo.user_name}');
			
			} else if( $(this).attr('id') == 'SR_REQ_DATE' ) {
				$(this).find('#SR_REQ_DATE').val('${today}');
			
			} else {
				$(this).val('');
			}
		});
		
		$('#uploadMultipleFile').val('');
		
		$(obj + ' .btnUploadFiles').text('파일업로드');
		$(obj + ' .btnUploadFiles').prop('disabled', false);
		
		$(obj + ' #file_text').css('padding', '0px');
		$(obj + ' #file_text').html('');
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
				
				
				if ( typeof data.SR_FILE != 'undefined' && data.SR_FILE != '' )
					$.getFiles(obj, data.SR_FILE);
			}
		});	
	};
	
	$.fncGetFormData = function(obj) {
		var sendData = {
				category_id : 'RSR00001'
		};

		sendData.data_id = $.g_selectedDataID;
		sendData.SR_NUMBER = $.g_searchSRNum;
		
		$(obj + ' .form-control').each(function() {
			var id = $(this).attr('id');
			var d = $(this).val();
			
			d = d.replaceAll('\n', '<br>');
			
			if ( d != '' && d != '0' )
				eval('sendData.' + id + ' = "' + d + '"');
		});
		
		if ( typeof sendData.SR_MANAGER_ID != 'undefined' ) {
			sendData.SR_MANAGER_NAME = $(obj + ' #SR_MANAGER_ID option:selected').text();
		}
		
		if ( sendData.SR_WORKING_TIME && sendData.SR_WORKING_TIME_OUT ) {
			var workTime = parseFloat(sendData.SR_WORKING_TIME);
			var workTimeOut = parseFloat(sendData.SR_WORKING_TIME_OUT);

			sendData.SR_WORKING_TIME_IN = workTime - workTimeOut;
			
		} else if ( sendData.SR_WORKING_TIME && !sendData.SR_WORKING_TIME_OUT ) {
			sendData.SR_WORKING_TIME_IN = sendData.SR_WORKING_TIME;
			
		} else {
			sendData.SR_WORKING_TIME_IN = '';
			
		}
		
		return sendData;
	};
	
	$.fncSaveData = function(obj) {
		var url = '${pageContext.request.contextPath}/data/work/modify.rts';
		
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
					$.fncClearData(obj);
					$.fncGrid1();
				} else alert('오류발생[' + data.message + ']');
			}
		});	
	};
	
	$.uploadFile = function(obj) {
		var category_id = 'RSR00001';
		var data_id = '0';

		if ( $('#uploadMultipleFile').val() == '' ) return false;
		
		var form = document.getElementById("uploadForm");
		form.enctype = 'multipart/form-data';

		var formData = new FormData(form);
		formData.append('category_id', category_id);
		formData.append('data_id', data_id);

		$.ritusAjaxFormData({
			url: '${pageContext.request.contextPath}/data/file_upload.rts',
			formData: formData,
			success: function(data) {
				$(obj + ' #uploadMultipleFile').val('');
				$(obj + ' .btnUploadFiles').text('업로드가 완료되었습니다.');
				$(obj + ' .btnUploadFiles').prop('disabled', true);
				
				var file_id = data.message;
				file_id = file_id.replace('[', '').replace(']', '');
				$(obj + ' #SR_FILE').val(file_id);
				$(obj + ' #file_text').html('');
	  			$(obj + ' #file_text').css('padding', '0px');
			}
		});
	};
	
	$.getFiles = function(obj, file_id) {
		var sendData = {
				file_id : file_id
		};

		$.ritusAjax({
			url: '${pageContext.request.contextPath}/data/work/srfile.rts',
	  		data: sendData,
	  		success: function(data) {
	  				try {
	  					var a = '<a href="${pageContext.request.contextPath}/data/file_download.rts?category_id=RSR00001&data_id=0&file_id=' + data.FILE_ID + '">' + data.FILE_NAME + '</a>';
			  			$(obj + ' #file_text').html(a);
			  			$(obj + ' #file_text').css('padding', '5px');
	  				} catch(e) {}
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
		
	$('#detailModal3 .btnAdd').click(function() {
		$.fncSaveData('#detailModal3');
	});
	
	$('#detailModal3 .btnUploadFiles').click(function() {
		$.g_objModal = '#detailModal3';
		$('#uploadMultipleFile').click();
	});
	
	$('#uploadMultipleFile').change(function() {
		$.uploadFile($.g_objModal);
	});
	
	$('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green',
    });
	
	$(".touchspin2").TouchSpin({
        min: 0,
        max: 1000,
        step: 0.1,
        decimals: 2,
        boostat: 5,
        maxboostedstep: 10,
        postfix: '시간',
        buttondown_class: 'btn btn-white',
        buttonup_class: 'btn btn-white'
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