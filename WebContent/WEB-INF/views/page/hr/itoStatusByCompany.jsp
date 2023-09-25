<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<!-- start 상단 버튼 영역 -->
<div class="row  border-bottom white-bg dashboard-header" style="height:57px;">
	<div class="col-md-12">

		<div class="text-right">
			<div class="infont form-group icons-box navbar-right">
				<!-- button class="btn btn-default" id="btnExport">엑셀다운로드</button -->
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
					<div class="jqGrid_wrapper1">
						<table id="grid_list1"></table>
					    <div id="grid_pager1"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-8 hideContent">
			<div class="ibox">
				<div class="ibox-title headNmText"></div>
				<div class="ibox-content full-height">
				
					<div class="panel-body slimscrollContent">
							<div class="col-sm-12">
							<div class="input-group m-b">
								<div class="input-group-btn">
									<button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button" id="selSearch">이름 <span class="caret"></span></button>
									<ul id="custom-menu" class="dropdown-menu">
											<li><a search="ITO_NAME">성명</a></li>
											<li><a search="V_ITO_TYPE">구분</a></li>
											<li><a search="V_ITO_POSITION">직위</a></li>
											<li><a search="V_ITO_COMPANY">협력사</a></li>
											<li><a search="V_ITO_WORK">업무</a></li>
									</ul>
								</div>
								<input type="text" class="form-control"  id="txtSearch"> <span class="input-group-btn"> <button type="button" class="btnGo btn " id="btnSearch">검색
								</button> </span>
							</div>
						</div>
						<br/>
						<br/>
						<div style="padding-top:10px;">
							<div class="jqGrid_wrapper2">
								<table id="grid_list2"></table>
							    <div id="grid_pager2"></div>
							</div>
						</div>
					</div>
					
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

<!-- jqGrid -->
<script src="${imageServer}/js/plugins/jqGrid/jquery.jqGrid.min.js"></script>

<!-- Custom and plugin javascript end -->

<script>
	$.g_SearchOption = 'ITO_NAME';
	$.g_SearchStr = '';
	$.g_companyCd = '';
</script>
<script>
	$.fncGrid1 = function() {
		$.ritusGrid({
			gridObject: '#grid_list1',
			url: '${pageContext.request.contextPath}/data/hr/humanCountByCompany.rts',
		    width: $('.jqGrid_wrapper1').width(),
		    height: $.getGridHeight(150),
		    rowNum: 100,
            page: 1,
            scroll: 1,
			loadonce: false,
			sortname: 'CNT',
			sortorder: 'DESC',
		    colNames: ['COMPANY_CD', '협력업체', '명수'],
		    colModel: [
		        {name: 'COMPANY_CD', hidden:true},
		        {name: 'COMPANY', width:200},
		        {name: 'CNT', width:50}
		    ],
			onCellSelect: function(rowid, index, icol, cellcontent, e) {
				var company_cd = $('#grid_list1').jqGrid('getCell', rowid, 'COMPANY_CD');
				$.g_companyCd = company_cd;
				$.fncGrid2(company_cd);
			}
		});
	};
	
	$.fncGrid2 = function() {
		var postData = {
				'category_id': 'ITO00001'
		};
		if ( arguments.length == 1 )
			postData.company_cd = arguments[0];
		
		if ( $.g_SearchStr != '' ) {
			postData.searchOption = $.g_SearchOption;
			postData.searchStr = $.g_SearchStr;
		}
		
		//$("#grid_list2").GridUnload();
		$.ritusGrid({
			gridObject: '#grid_list2',
			url: '${pageContext.request.contextPath}/data/hr/itoList.rts',
			postData: postData,
		    width: $('.jqGrid_wrapper2').width(),
		    height: $.getGridHeight(230),
		    rowNum: 15,
            page: 1,
            scroll: 1,
		    loadonce: false,
		    colNames: ['DATA_ID', '성명', '구분', '직위', '협력사', '업무', '모바일', '이메일'],
		    colModel: [
		        {name: 'DATA_ID', hidden:true},
		        {name: 'ITO_NAME', width:100},
		        {lname: 'V_ITO_TYPE', width:100},
		        {name: 'V_ITO_POSITION', width:100},
		        {name: 'V_ITO_COMPANY', width:100},
		        {name: 'V_ITO_WORK', width:200},
		        {name: 'ITO_MOBILE', width:150},
		        {name: 'ITO_EMAIL', width:150, align:'left'}
		    ]
		});
	};
</script>

<script>
$(function() {
	$.fncGrid1();
	$.fncGrid2();
	
	$('ul.dropdown-menu > li > a').click(function() {
    	eval('$.g_SearchOption = $(this).attr("search")');
    	var text = $(this).text();
        $(this).parent().parent().parent().find('button').html(text + ' <span class="caret"></span>');
    });
	
	$('#btnSearch').click(function() {
		$.g_SearchStr = $('#txtSearch').val();
		if ( $.trim($.g_SearchStr) == '' )
			alert('검색어를 입력하세요.');
		else $.fncGrid2($.g_companyCd);
	});
	
	$('#txtSearch').keydown(function(key) {
		if ( key.keyCode == 13 )
			$('#btnSearch').click();
	});

	$(window).bind('resize', function () {
		var width1 = $('.jqGrid_wrapper1').width();
		$('#grid_list1').setGridWidth(width1);
		$('#grid_list1').setGridHeight($.getGridHeight(150));
		
		var width2 = $('.jqGrid_wrapper2').width();
		$('#grid_list2').setGridWidth(width2);
		$('#grid_list2').setGridHeight($.getGridHeight(230));
	}).trigger('resize');
});

</script>