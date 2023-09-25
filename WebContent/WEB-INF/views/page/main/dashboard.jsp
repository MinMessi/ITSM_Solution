<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page session="false" pageEncoding="utf-8" %>

<div class="wrapper wrapper-content">
	<div class="row">
		<div class="col-lg-4">
			<div class="ibox float-e-margins">
            	<div class="ibox-title">
                	<h5><spring:message code="ui.page.main.DashboardPage.T01" /></h5>
                </div>
                <div class="ibox-content">
					<div>
                       	<div id="stocked_chart1" style="height:120px;"></div>
                    </div>
                </div>
            </div>
		</div>
		<div class="col-lg-4">
			<div class="ibox">
            	<div class="ibox-title">
                	<h5><spring:message code="ui.page.main.DashboardPage.T02" /></h5>
                </div>
                <div class="ibox-content">
					<div>
                       	<div id="stocked_chart2" style="height:120px;"></div>
                    </div>
                </div>
            </div>
		</div>
		<div class="col-lg-4">
			<div class="ibox">
            	<div class="ibox-title">
                	<h5><spring:message code="ui.page.main.DashboardPage.T06" /></h5>
                </div>
                <div class="ibox-content">
					<div class="off_jqGrid_wrapper">
						<table id="off_grid_list"></table>
					    <div id="off_grid_pager"></div>
					</div>
                </div>
            </div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox">
            	<div class="ibox-title">
                	<h5><spring:message code="ui.page.main.DashboardPage.T03" /></h5>
                </div>
                <div class="ibox-content">
					<div class="jqGrid_wrapper1">
						<table id="grid_list1"></table>
					    <div id="grid_pager1"></div>
					</div>
                </div>
            </div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6">
			<div class="ibox">
            	<div class="ibox-title">
                	<h5><spring:message code="ui.page.main.DashboardPage.T04" /></h5>
                </div>
                <div class="ibox-content">
					<div class="jqGrid_wrapper2">
						<table id="grid_list2"></table>
					    <div id="grid_pager2"></div>
					</div>
                </div>
            </div>
		</div>
		<div class="col-lg-6">
			<div class="ibox">
            	<div class="ibox-title">
                	<h5><spring:message code="ui.page.main.DashboardPage.T05" /></h5>
                </div>
                <div class="ibox-content">
					<div class="jqGrid_wrapper3">
						<table id="grid_list3"></table>
					    <div id="grid_pager3"></div>
					</div>
                </div>
            </div>
		</div>
	</div>
</div>

<!-- d3 and c3 charts -->
<script src="${imageServer}/js/plugins/d3/d3.min.js"></script>
<script src="${imageServer}/js/plugins/c3/c3.min.js"></script>

<!-- jqGrid -->
<script src="${imageServer}/js/plugins/jqGrid/jquery.jqGrid.min.js"></script>

<script>
	var root = ${root};
</script>

<script>
	$.stocked_chart = function() {
		$.ritusAjax({
			url: '${pageContext.request.contextPath}/data/main/chart.rts',
	  		data: {},
	  		success: function(data) {
	  			var max = 0;
	  			c3.generate({
	  		        bindto: '#stocked_chart1',
	  		        data:{
	  		            columns: data.chart1.columns,
	  		            names: data.chart1.names,
	  		            type: 'bar',
	  		            groups: data.chart1.groups
	  		        },
	  		        axis : {
	  	    	    	x : {
	  	    	    		type : 'category',
	  	    	    		categories: data.chart1.categories
	  	    	    	},
	  	    	    	y : {
	  	    	    		tick: {
	  	    	    			count: 5,
	  	    	    			format: function(y) {
	  	    	    				var y = parseInt(y);
	  	    	    				if ( y > max ) max = y;
	  	    	    				return y;
	  	    	    			}
	  	    	    		}
	  	    	    	}
	  	    	    }
	  		    });
	  			
	  			var max2 = 0;
	  			c3.generate({
	  		        bindto: '#stocked_chart2',
	  		        data:{
	  		            columns: data.chart2.columns,
	  		            names: data.chart2.names,
	  		            type: 'bar',
	  		            groups: data.chart2.groups
	  		        },
	  		        axis : {
	  	    	    	x : {
	  	    	    		type : 'category',
	  	    	    		categories: data.chart2.categories
	  	    	    	},
	  	    	    	y : {
	  	    	    		tick: {
	  	    	    			count: 5,
	  	    	    			format: function(y) {
	  	    	    				var y = parseInt(y);
	  	    	    				if ( y > max2 ) max2 = y;
	  	    	    				return y;
	  	    	    			}
	  	    	    		}
	  	    	    	}
	  	    	    }
	  		    });
  			}
  		});
	};
	
	$.fncGrid1 = function() {
		var mdata = root.sr;
		$("#grid_list1").jqGrid({
			data: root.sr,
			datatype: 'local',
		    autowidth: true,
		    shrinkToFit: true,
		    width: $('.jqGrid_wrapper1').width(),
		    height: 100,
		    rowNum: 50,
		    rowList: [20, 30, 50],
		    scroll: 1,
		    loadonce: true,
		    gridview: true,
		    colNames: ['DATA_ID', 'SR번호', '작업명', '요청일', '완료예정일', '요청자', '처리자', '상태', '소요시간'],
		    colModel: [
		    	{name: 'DATA_ID', hidden:true},
		        {name: 'SR_NUMBER', width:200},
		        {name: 'SR_WORK_TITLE', width:300, align:'left'},
		        {name: 'SR_REQ_DATE', width:100},
		        {name: 'SR_COMPLETE_DATE', width:100},
		        {name: 'SR_REQ_USER_NAME', width:100},
		        {name: 'SR_MANAGER_NAME', width:100},
		        {name: 'V_SR_RESULT', width:100},
		        {name: 'SR_WORKING_TIME', width:100}
		    ],
		    viewrecords: true,
		    hidegrid: false
		});
	};
	
	$.fncGrid2 = function() {
		$("#grid_list2").jqGrid({
			data: root.support,
			datatype: 'local',
		    autowidth: true,
		    shrinkToFit: true,
		    width: $('.jqGrid_wrapper2').width(),
		    height: 100,
		    rowNum: 50,
		    rowList: [20, 30, 50],
		    scroll: 1,
		    loadonce: true,
		    gridview: true,
		    colNames: ['날짜', '시간', '업체'],
		    colModel: [
		        {name: 'RSR_SUPPORT_DATE', width:150},
		        {name: 'RSR_SUPPORT_TIME', width:150},
		        {name: 'V_RSR_SUPPORT_COMPANY', width:300, align: 'left'},
		    ],
		    viewrecords: true,
		    hidegrid: false
		});
	};
	
	$.fncGrid3 = function() {
		$("#grid_list3").jqGrid({
			data: root.ms,
			datatype: 'local',
		    autowidth: true,
		    shrinkToFit: true,
		    width: $('.jqGrid_wrapper3').width(),
		    height: 100,
		    rowNum: 50,
		    rowList: [20, 30, 50],
		    scroll: 1,
		    loadonce: true,
		    gridview: true,
		    colNames: ['날짜', '작업요약', '상태', '담당업체'],
		    colModel: [
		        {name: 'SUP_REQ_DATE', width:150},
		        {name: 'SUP_WORK_SUMMARY', width:300},
		        {name: 'V_SUP_STATUS', width:50, align: 'left'},
		        {name: 'V_SUP_COMPANY', width:100}
		    ],
		    viewrecords: true,
		    hidegrid: false
		});
	};
	
	$.fncGridOff = function() {
		$.ritusGrid({
			gridObject: '#off_grid_list',
			url: '${pageContext.request.contextPath}/data/hr/offITO.rts',
		    width: $('.off_jqGrid_wrapper').width(),
		    height: 83,
		    rowNum: 50,
		    rowList: [20, 30, 50],
		    scroll: 1,
		    scrollbar: true,
		    autowidth: true,
		    shrinkToFit: true,
		    colNames: ['대상자', '사유', '휴가날짜'],
		    colModel: [
		        {name: 'ITO_NAME', width:60},
		        {name: 'ITO_ATT_REASON', width:100},
		        {name: 'ITO_ATT_DATETIME', width:100}
		    ],
		    viewrecords: true,
		    hidegrid: false
		});
	};
</script>

<script>
	$(function() {
		$.stocked_chart();
		$.fncGrid1();
		$.fncGrid2();
		$.fncGrid3();
		$.fncGridOff();
		
		$(window).bind('resize', function () {
			var width1 = $('.jqGrid_wrapper1').width();
			$('#grid_list1').setGridWidth(width1);
			
			var width2 = $('.jqGrid_wrapper2').width();
			$('#grid_list2').setGridWidth(width2);
			
			var width3 = $('.jqGrid_wrapper3').width();
			$('#grid_list3').setGridWidth(width3);
			
			var width4 = $('.off_jqGrid_wrapper').width();
			$('#off_grid_list').setGridWidth(width4);
		}).trigger('resize');
	});
</script>