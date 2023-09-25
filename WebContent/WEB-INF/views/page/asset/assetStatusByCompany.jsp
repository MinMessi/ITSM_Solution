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
					<h5>업체</h5>
					<div class="ibox-tools">
						<a class="collapse-tree-in">
							<i class="fa fa-chevron-left text-danger"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content full-height">
					<div class="jqGrid_wrapper2">
						<table id="grid_list2"></table>
					    <div id="grid_pager2"></div>
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
    								<td class="table-label">자산ID</td>
   									<td class="table-content-left dataField" id="AST_ID">
   										AST-001
   									</td>
    								<td class="table-label">자산분류</td>
									<td class="table-content-right dataField" id="V_AST_PRNT_CD">
										Ubuntu 8
									</td>
								</tr>
								<tr>
    								<td class="table-label">상태코드</td>
									<td class="table-content-right dataField" id="AST_STATUS_CD">
										AST-001
									</td>
									<td class="table-label">시스템ID</td>
    								<td class="table-content-left dataField" id="AST_SYSTEM_ID">
    									AST-001
    								</td>
								</tr>
								<tr>
									<td class="table-label">자산명</td>
									<td class="table-content-right dataField" id="AST_NAME">
										윈도우즈서버
									</td>
									<td class="table-label">자산관리번호</td>
	                                <td class="table-content-left dataField" id="AST_MANAGE_NUM">
	                                	AST-001
	                                </td>
								</tr>
	                            <tr>
	                                <td class="table-label">관리팀</td>
	                                <td class="table-content-right dataField" id="AST_MANAGE_TEAM">
	                                	IT관리
	                                </td>
	                                <td class="table-label">담당자</td>
								    <td class="table-content-left dataField" id="AST_MANAGER">
								    	허영수
								    </td>
	                            </tr>
								<tr>
								    <td class="table-label">배치장소</td>
									<td class="table-content-right dataField" id="AST_LOCATION">
										데이터센터 1층
									</td>
									<td class="table-label">삼각완료연도</td>
								    <td class="table-content-left dataField" id="AST_DEP_COM_YEAR">
								    	2022
								    </td>
								</tr>
								<tr>
								    <td class="table-label">Host name</td>
									<td class="table-content-right dataField" id="AST_HOST_NAME">
										WAPP001
									</td>
									<td class="table-label">업무용도</td>
								    <td class="table-content-left dataField" id="AST_WORK_USE">
								    	백업
								    </td>
								</tr>
								<tr>
								    <td class="table-label">시스템</td>
									<td class="table-content-right dataField" id="AST_SYSTE">
										
									</td>
									<td class="table-label">EOS일자</td>
								    <td class="table-content-left dataField" id="AST_EOD_DATE">
								    	
								    </td>
								</tr>
								<tr>
								    <td class="table-label">품명</td>
									<td class="table-content-right dataField" id="AST_PRODUCT_NAME">
										WAPP001
									</td>
									<td class="table-label">모델명</td>
								    <td class="table-content-left dataField" id="AST_MODEL_NAME">
								    	Windows 2010DE Server
								    </td>
								</tr>
								<tr>
								    <td class="table-label">통신망</td>
									<td class="table-content-right dataField" id="AST_NETWORK">
										
									</td>
									<td class="table-label">OS</td>
								    <td class="table-content-left dataField" id="AST_OS">
								    	Windows 2010 Server
								    </td>
								</tr>
								<tr>
								    <td class="table-label">CPU</td>
									<td class="table-content-right dataField" id="AST_CPU">
										32
									</td>
									<td class="table-label">Memory</td>
								    <td class="table-content-left dataField" id="AST_MEMORY">
								    	256G
								    </td>
								</tr>
								<tr>
								    <td class="table-label">HDD</td>
									<td class="table-content-right dataField" id="AST_HDD">
										8T
									</td>
									<td class="table-label">IP</td>
								    <td class="table-content-left dataField" id="AST_IP">
								    	
								    </td>
								</tr>
								<tr>
								    <td class="table-label">라이선스</td>
									<td class="table-content-right dataField" id="AST_LICENSE">
										Windows 2010 Server
									</td>
									<td class="table-label">개수</td>
								    <td class="table-content-left dataField" id="AST_COUNT">
								    	1
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
								    	데이터센터
								    </td>
								</tr>
								<tr>
								    <td class="table-label">위치(중)</td>
									<td class="table-content-right dataField" id="AST_M_LOCATION">
										1층
									</td>
									<td class="table-label">위치(소)</td>
								    <td class="table-content-left dataField" id="AST_S_LOCATION">
								    	90번덱
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
								    <td class="table-label">협력업체</td>
									<td class="table-content-right dataField" colspan=3 id="V_AST_SUPPORT_COMPANY">
										유니포인트
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

<!-- jqGrid -->
<script src="${imageServer}/js/plugins/jqGrid/jquery.jqGrid.min.js"></script>

<!-- Custom and plugin javascript end -->
<script>
	$.g_company_cd = '';
</script>

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

	$.fncGrid2 = function() {
		$("#grid_list2").jqGrid({
			url: '${pageContext.request.contextPath}/data/asset/assetCountByCompany.rts',
			datatype: 'json',
			mtype: 'POST',
		    autowidth: true,
		    shrinkToFit: true,
		    width: $('.jqGrid_wrapper2').width(),
		    height: $.getGridHeight(150),
		    rowNum: 50,
		    rowList: [20, 30, 50],
		    scroll: 1,
		    loadonce: true,
		    gridview: true,
		    sortname: 'CNT',
			sortorder: 'DESC',
		    colNames: ['COMPANY_CD', '협력업체', '자산수'],
		    colModel: [
		    	{name: 'COMPANY_CD', hidden:true},
		        {name: 'COMPANY', width:200},
		        {name: 'CNT', width:50},
		    ],
		    viewrecords: true,
		    hidegrid: false,
		    onCellSelect: function(rowid, icol, cellcontent, e) {
		    	var company_cd = $('#grid_list2').jqGrid('getCell', rowid, 'COMPANY_CD');
		    	$.g_company_cd = company_cd;
		    	$.fncGrid1();
			}
		});
	};
	
	$.fncGrid1 = function() {
		$.ritusGrid({
			gridObject: '#grid_list1',
			url: '${pageContext.request.contextPath}/data/asset/assetList.rts',
			postData: {
				category_id : 'AST00001', 
				company_cd : $.g_company_cd
			},
		    width: $('.jqGrid_wrapper1').width(),
		    height: $.getGridHeight(150),
		    rowNum: 50,
		    rowList: [20, 30, 50],
		    scroll: 1,
		    scrollbar: true,
		    autowidth: true,
		    shrinkToFit: false,
		    colNames: ['DATA_ID', '자산ID', '분류', '상태코드', '시스템ID', '자산명', '자산관리번호', '관리팀', '담당자', '배치장소', '삼각완료연도', 'Host name', '업무용도', '시스템', 'EOS일자', '품명', '모델명', '통신망', 'OS', 'CPU', 'Memory', 'HDD', 'IP', '라이선스', '개수', '유지정비계약', '월유지정비료', '통신망(중)', '위치(대)', '위치(중)', '위치(소)', '로그', '시리얼번호', '협력업체'],
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
	$.fncGrid1();
	$.fncGrid2();

	$(window).bind('resize', function () {
		var width1 = $('.jqGrid_wrapper1').width();
		$('#grid_list1').setGridWidth(width1);
		$('#grid_list1').setGridHeight($.getGridHeight(150));
		
		var width2 = $('.jqGrid_wrapper2').width();
		$('#grid_list2').setGridWidth(width2);
		$('#grid_list2').setGridHeight($.getGridHeight(150));
	}).trigger('resize');
});

</script>