<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<!-- start 상단 버튼 영역 -->
<div class="row  border-bottom white-bg dashboard-header" style="height:57px;">
	<div class="col-md-12">

		<div class="text-right">
			<div class="infont form-group icons-box navbar-right">
				<!-- button class="btn btn-warning" id="btnDownload">엑셀다운로드</button -->
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
					<div class="jqGrid_wrapper1">
						<table id="grid_list1"></table>
					    <div id="grid_pager1"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal inmodal fade" id="standardModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                </button>
				<h4 class="modal-title">자산내역</h4>
            </div>
			<div class="modal-body">
			<form id="F0" action="#" class="form-horizontal">
				<div class="form-horizontal">
					<div class="form-group" style="margin-bottom: 0px;">
						<div class="col-lg-12" style="padding-left:10px;">
							<table class="table table-striped" style="margin-bottom: 0px;">
								<tr>
    								<td class="table-label">회계단위</td>
   									<td class="table-content-left dataField" id="AST_ACCOUNT_UNIT">
   									</td>
    								<td class="table-label">회계단위명</td>
									<td class="table-content-right dataField" id="AST_ACCOUNT_UNIT_NAME">
									</td>
								</tr>
								<tr>
    								<td class="table-label">자산ID</td>
   									<td class="table-content-left dataField" id="AST_ID">
   									</td>
    								<td class="table-label">자산분류</td>
									<td class="table-content-right dataField" id="V_AST_PRNT_CD">
									</td>
								</tr>
								<tr>
    								<td class="table-label">자산구분</td>
   									<td class="table-content-left dataField" id="AST_TYPE">
   									</td>
    								<td class="table-label">자산구분명</td>
									<td class="table-content-right dataField" id="AST_TYPE_NAME">
									</td>
								</tr>
								<tr>
    								<td class="table-label">상태코드</td>
									<td class="table-content-right dataField" id="AST_STATUS_CD">
									</td>
									<td class="table-label">시스템ID</td>
    								<td class="table-content-left dataField" id="AST_SYSTEM_ID">
    								</td>
								</tr>
								<tr>
									<td class="table-label">자산명</td>
									<td class="table-content-right dataField" id="AST_NAME">
									</td>
									<td class="table-label">자산관리번호</td>
	                                <td class="table-content-left dataField" id="AST_MANAGE_NUM">
	                                </td>
								</tr>
	                            <tr>
	                                <td class="table-label">관리팀</td>
	                                <td class="table-content-right dataField" id="AST_MANAGE_TEAM">
	                                </td>
	                                <td class="table-label">담당자</td>
								    <td class="table-content-left dataField" id="AST_MANAGER">
								    </td>
	                            </tr>
								<tr>
								    <td class="table-label">배치장소</td>
									<td class="table-content-right dataField" id="AST_LOCATION">
									</td>
									<td class="table-label">상각완료연도</td>
								    <td class="table-content-left dataField" id="AST_DEP_COM_YEAR">
								    </td>
								</tr>
								<tr>
								    <td class="table-label">Host name</td>
									<td class="table-content-right dataField" id="AST_HOST_NAME">
									</td>
									<td class="table-label">업무용도</td>
								    <td class="table-content-left dataField" id="AST_WORK_USE">
								    </td>
								</tr>
								<tr>
								    <td class="table-label">시스템</td>
									<td class="table-content-right dataField" id="AST_SYSTEM">
									</td>
									<td class="table-label">EOS일자</td>
								    <td class="table-content-left dataField" id="AST_EOD_DATE">
								    </td>
								</tr>
								<tr>
								    <td class="table-label">품명</td>
									<td class="table-content-right dataField" id="AST_PRODUCT_NAME">
									</td>
									<td class="table-label">모델명</td>
								    <td class="table-content-left dataField" id="AST_MODEL_NAME">
								    </td>
								</tr>
								<tr>
								    <td class="table-label">통신망</td>
									<td class="table-content-right dataField" id="AST_NETWORK">
									</td>
									<td class="table-label">OS</td>
								    <td class="table-content-left dataField" id="AST_OS">
								    </td>
								</tr>
								<tr>
								    <td class="table-label">CPU</td>
									<td class="table-content-right dataField" id="AST_CPU">
									</td>
									<td class="table-label">Memory</td>
								    <td class="table-content-left dataField" id="AST_MEMORY">
								    </td>
								</tr>
								<tr>
								    <td class="table-label">HDD</td>
									<td class="table-content-right dataField" id="AST_HDD">
									</td>
									<td class="table-label">IP</td>
								    <td class="table-content-left dataField" id="AST_IP">
								    </td>
								</tr>
								<tr>
								    <td class="table-label">라이선스</td>
									<td class="table-content-right dataField" id="AST_LICENSE">
									</td>
									<td class="table-label">개수</td>
								    <td class="table-content-left dataField" id="AST_COUNT">
								    </td>
								</tr>
								<tr>
								    <td class="table-label">유지정비계약</td>
									<td class="table-content-right dataField" id="AST_SUPPORT_CONTRACT">
										
									</td>
									<td class="table-label">월유지정비료</td>
								    <td class="table-content-left dataField" id="AST_SUPPORT_FEE_MONTH">
								    	
								    </td>
								</tr>
								<tr>
								    <td class="table-label">통신망(중)</td>
									<td class="table-content-right dataField" id="AST_M_NETWORK">
										
									</td>
									<td class="table-label">위치(대)</td>
								    <td class="table-content-left dataField" id="AST_L_LOCATION">
								    </td>
								</tr>
								<tr>
								    <td class="table-label">위치(중)</td>
									<td class="table-content-right dataField" id="AST_M_LOCATION">
									</td>
									<td class="table-label">위치(소)</td>
								    <td class="table-content-left dataField" id="AST_S_LOCATION">
								    </td>
								</tr>
								<tr>
								    <td class="table-label">로그</td>
									<td class="table-content-right dataField" id="AST_LOG">
									</td>
									<td class="table-label">시리얼번호</td>
								    <td class="table-content-left dataField" id="AST_SERIAL_NUM">
								    </td>
								</tr>
								<tr>
								    <td class="table-label">처분방법</td>
									<td class="table-content-right dataField" id="AST_DISPOSAL_TYPE">
									</td>
									<td class="table-label">처분일자</td>
								    <td class="table-content-left dataField" id="AST_DISPOSAL_DATE">
								    </td>
								</tr>
								<tr>
								    <td class="table-label">취득일</td>
									<td class="table-content-right dataField" id="AST_GET_DATE">
									</td>
									<td class="table-label">수정일</td>
								    <td class="table-content-left dataField" id="AST_GET_MOD_DATE">
								    </td>
								</tr>
								<tr>
								    <td class="table-label">협력업체</td>
									<td class="table-content-right dataField" colspan=3 id="V_AST_SUPPORT_COMPANY">
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-ibk-close" data-dismiss="modal">닫기</button>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>

<style>
	.ui-jqgrid .ui-jqgrid-htable th div {
		height: auto;
		overflow: hidden;
		padding-right: 2px;
		padding-left: 2px;
		padding-top: 4px;
		padding-bottom: 4px;
		position: relative;
		vertical-align: text-top;
	}

	.input-daterange.input-group input {
		background-color: #FFFFFF;
	}

	.ui-jqgrid tr.jqgrow td {
		white-space: nowrap !important;
	}

	.col-lg-12 .col-sm-6 {
		float: right;
		margin-right: 50px;
	}

	.table.table-striped tr td .list-unstyled.sr-files {
		width: 95%;
		height: 90px;
	}

	.table.table-striped td.table-label {
		width: 15%;
		text-align: right;
		font-weight: bold;
	}

	.table.table-striped td.table-content-left {
		width: 30%;
	}

	.table.table-striped td.table-content-right {
		width: 40%;
	}

	.table.table-striped textarea.view-control {
		width: 95%;
		background-color: #F5F5F9;
	}

	input::-ms-clear {
		display: none;
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
	$.fncSearchData = function(ast_cd) {
		$.ritusAjax({
			url: '${pageContext.request.contextPath}/data/asset/assetDetail.rts',
			data: { data_id : ast_cd },
			dataType: 'json',
			success: function(data) {
				$('#F0 td.dataField').each(function() {
					var id = $(this).attr('id');
					var d = eval('data.' + id);
	
					if ( typeof d != 'undefined' )
						$(this).text(d);
					else $(this).text('');
				});
				
				$('#standardModal').modal({backdrop: "static", keyboard: true});
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
	                         'parent_cd' : id,
	                         'is_code' : '1',
	                         'is_custom' : '1'
	                     };
	                 }
	             }
			},
			'plugins' : [ 'types', 'search' ],
		}).bind(
				"select_node.jstree", function(evt, data) {
					$('.headNmText').text(data.node.value);
					$.fncGrid1(data.node.id);
				}
		);
	};
	
	$.fncGrid1 = function(ast_cd) {
		$.ritusGrid({
			gridObject: '#grid_list1',
			url: '${pageContext.request.contextPath}/data/asset/assetList.rts',
			postData: {
				category_id : 'AST00001',
				ast_cd : ast_cd
			},
		    width: $('.jqGrid_wrapper1').width(),
		    height: $.getGridHeight(150),
		    rowNum: 50,
		    rowList: [20, 30, 50],
		    scroll: 1,
		    scrollbar: true,
		    autowidth: true,
		    shrinkToFit: false,
		    colNames: ['DATA_ID', '자산ID', '상위자산', '상태코드', '시스템ID', '자산명', '자산관리번호', '관리팀', '담당자', '배치장소', '삼각완료연도', 'Host name', '업무용도', '시스템', 'EOS일자', '품명', '모델명', '통신망', 'OS', 'CPU', 'Memory', 'HDD', 'IP', '라이선스', '개수', '유지정비계약', '월유지정비료', '통신망(중)', '위치(대)', '위치(중)', '위치(소)', '로그', '시리얼번호', '협력업체'],
		    colModel: [
		    	{name: 'DATA_ID', hidden:true},
		        {name: 'AST_ID', width:100},
		        {name: 'V_AST_PRNT_CD', width:100},
		        {name: 'AST_STATUS_CD', width:100},
		        {name: 'AST_SYSTEM_ID', width:100},
		        {name: 'AST_NAME', width:200, align:'left'},
		        {name: 'AST_MANAGE_NUM', width:100},
		        {name: 'AST_MANAGE_TEAM', width:100},
		        {name: 'AST_MANAGER', width:100},
		        {name: 'AST_LOCATION', width:100},
		        {name: 'AST_DEP_COM_YEAR', width:100},
		        {name: 'AST_HOST_NAME', width:100},
		        {name: 'AST_WORK_USE', width:100},
		        {name: 'AST_SYSTEM', width:100},
		        {name: 'AST_EOS_DATE', width:100},
		        {name: 'AST_PRODUCT_NAME', width:100},
		        {name: 'AST_MODEL_NAME', width:100},
		        {name: 'AST_NETWORK', width:100},
		        {name: 'AST_OS', width:100},
		        {name: 'AST_CPU', width:100},
		        {name: 'AST_MEMORY', width:100},
		        {name: 'AST_HDD', width:100},
		        {name: 'AST_IP', width:100},
		        {name: 'AST_LICENSE', width:100},
		        {name: 'AST_COUNT', width:100},
		        {name: 'AST_SUPPORT_CONTRACT', width:100},
		        {name: 'AST_SUPPORT_FEE_MONTH', width:100},
		        {name: 'AST_M_NETWORK', width:100},
		        {name: 'AST_L_LOCATION', width:100},
		        {name: 'AST_M_LOCATION', width:100},
		        {name: 'AST_S_LOCATION', width:100},
		        {name: 'AST_LOG', width:100},
		        {name: 'AST_SERIAL_NUM', width:100},
		        {name: 'V_AST_SUPPORT_COMPANY', width:100}
		    ],
		    viewrecords: true,
		    hidegrid: false,
		    onCellSelect: function(rowid, icol, cellcontent, e) {
		    	var data_id = $('#grid_list1').jqGrid('getCell', rowid, 'DATA_ID');
		    	$.fncSearchData(data_id);
				return;
			}
		});
	};
</script>

<script>
$(function() {
	$(':input').inputmask();
	$.fncDrawHrTree();
	$.fncGrid1('');
	
	$(window).bind('resize', function () {
		$('div.slimscrollContent').slimscroll({
			height: $.getGridHeight(150) + 'px'
		});

		$('div.slimscrollTree').slimscroll({
			height: $.getGridHeight(110) + 'px'
		});
		
		var width1 = $('.jqGrid_wrapper1').width();
		$('#grid_list1').setGridWidth(width1);
		$('#grid_list1').setGridHeight($.getGridHeight(150));
	}).trigger('resize');
});

</script>