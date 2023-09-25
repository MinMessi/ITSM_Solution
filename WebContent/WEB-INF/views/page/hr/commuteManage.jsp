<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<!-- start 상단 버튼 영역 -->
<div class="row	border-bottom white-bg dashboard-header" style="height:57px;">
	<div class="col-md-12">
		<!-- start 선택박스 영역 -->
		<div class="col-sm-2">
			<div class="form-group" id="data_month">
				<div class="input-group date">
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span><input type="text" id="event_month" class="form-control" onchange="$.fncMoveMonth();"	value="${DATE}">
				</div>
			</div>
		</div>
		<!-- 선택박스 영역 end -->

		<!-- start 버튼 영역 -->
		<div class="col-sm-10">

		</div>
		<!-- 버튼 영역 end -->
	</div>
</div>
<!-- 상단 버튼 영역 end -->

<div class="wrapper wrapper-content animated fadeInRight" style="z-index:5">
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
			<div class="ibox float-e-margins">
				<div class="ibox-title headNmText"></div>
				<div class="ibox-content full-height">
					<div id="calendar" ></div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- start standardModal(등급기준) -->
<div class="modal inmodal fade" id="standardModal" tabindex="-1"
	role="dialog" aria-hidden="true">
	<input type="hidden" id="ITO_DATA_ID" class="form-control">
	<input type="hidden" id="ITO_TYPE" class="form-control">
	<input type="hidden" id="ITO_POSITION" class="form-control">
	<input type="hidden" id="ITO_WORK" class="form-control">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">근태관리</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div>
						<label class="col-md-2 control-label" align="right" style="padding-top:8px;">성명</label>
						<div class="col-sm-10">
							<input id="ITO_NAME" name="ITO_NAME" type="text"
								class="form-control required" value="" disabled="disable"
								text-align="center">
						</div>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="row">
					<div>
						<label class="col-md-2 control-label" align="right" style="padding-top:8px;">날짜</label>
						<div class="col-sm-10">
							<input id="ITO_ATT_DATETIME" name="ITO_ATT_DATETIME" type="text"
								class="form-control required" value="" disabled="disable"
								align="center"></input>
						</div>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="row">
					<div>
						<label class="col-md-2 control-label" align="right" style="padding-top:8px;">근태종류</label>
						<div class="col-md-10">
							<select id="ITO_ATT_TYPE" name="ITO_ATT_TYPE" class="form-control reference">
								${CDE00004}
							</select>
						</div>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="row" id='rsn'>
					<div>
						<label class="col-md-2 control-label" align="right" style="padding-top:19px;">사유</label>
						<div class="col-md-10">
							<textarea id="ITO_ATT_REASON" name="ITO_ATT_REASON"
								class="form-control reference"></textarea>
						</div>
					</div>
				</div>

				<!--	 내용 끝-->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-ibk-save" data-dismiss="modal">저장</button>
				<button type="button" class="btn btn-ibk-close" data-dismiss="modal">닫기</button>
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

<style>

	/* full calendar */

	/* 일요일 색 지정 */
	.fc-sun {
		color: red !important;
	}
	
	/* 토요일 색 지정 */
	.fc-sat {
		color: blue !important;
	}
	
	/* 휴일 지정 */
	.fc-holiday {
		color: red !important;
	}

	.clockpicker-popover {
		z-index:9999 !important;
	}
	
	.colorpicker {
		z-index:9999 !important;
	}
</style>

<!-- standardModal(등급기준) end-->

<!-- start Custom and plugin javascript -->
<!-- Mainly scripts -->
<script src="${imageServer}/js/plugins/fullcalendar/moment.min.js"></script>

<!-- jQuery UI custom -->
<script src="${imageServer}/js/jquery-ui.custom.min.js"></script>

<!-- Full Calendar -->
<script src="${imageServer}/js/plugins/fullcalendar/fullcalendar-3.1.0.min.js"></script>
<script src="${imageServer}/js/plugins/fullcalendar/locale/ko.js"></script>

<!-- Data picker -->
<script src="${imageServer}/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="${imageServer}/js/plugins/datapicker/bootstrap-datepicker.kr.js"></script>

<!-- jstree -->
<script src="${imageServer}/js/plugins/jsTree/jstree.min.js"></script>

<!-- jqGrid -->
<script src="${imageServer}/js/plugins/jqGrid/jquery.jqGrid.min.js"></script>

<!-- iCheck -->
<script src="${imageServer}/js/plugins/iCheck/icheck.min.js"></script>

<!-- Chosen -->
<script src="${imageServer}/js/plugins/chosen/chosen.jquery.js"></script>
<!-- Chosen -->
<script src="${imageServer}/js/plugins/moment/moment.js"></script>


<!-- start Custom and plugin javascript -->
<!-- Custom and plugin javascript end -->

<script>
	//선택된 사용자 코드
	$.g_selectedId = '';
	//선택된 사용자 코드
	$.g_selectedNm = '';
	//선택된 이벤트 ID
	$.g_selectedEventId = '';
	//현재 선택월
	$.g_currentMonth = '';
	$.g_detailInfo = {
			position: '',
			type: '',
			work: ''
	};
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
	                     return '${pageContext.request.contextPath}/data/hr/itoComTree.rts';
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
					
					$.g_selectedId = data.node.original.metaData.DATA_ID;
					$.g_selectedNm = data.node.text;
					
					$('#ITO_DATA_ID').val(data.node.original.metaData.DATA_ID);
					$('#ITO_POSITION').val(data.node.original.metaData.ITO_POSITION);
					$('#ITO_TYPE').val(data.node.original.metaData.ITO_TYPE);
					$('#ITO_WORK').val(data.node.original.metaData.ITO_WORK);
		
					var headNmText = $.g_selectedNm;
					$('.headNmText').html("<h5>" + headNmText + "</h5>");
		
					$('#calendar').fullCalendar('refetchEvents');
		
					$.fncFullCalendar();
					return;
				}
			);
	};

	$.fncFullCalendar = function() {

		var holiday = ${holidayJson};

		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next',
				center : 'title',
				right : ''
			},
			defaultDate: moment().format('YYYY-MM-DD'),
			editable : false,
			droppable : false, // this allows things to be dropped onto the calendar
			drop : function() {
				if ($('#drop-remove').is(':checked')) {
					$(this).remove();
				}
			},
			events : {
				url: '${pageContext.request.contextPath}/data/hr/commuteCalendar.rts',
				data: function() {
					return {
						usr_id: $.g_selectedId
					};
				},
				success: function(data) {
					holiday = data.holiday;
					$("td.fc-day").html("");

					var ev = data.event;
					var events = new Array();
					for ( var i=0; i<ev.length; i++ ) {
						var json = {};
						if(ev[i].V_ITO_ATT_TYPE != null){
							var title = '';
							title = ev[i].V_ITO_ATT_TYPE;
							
							if ( $.g_selectedId == '' )
								title = ev[i].ITO_NAME + ':' + ev[i].V_ITO_ATT_TYPE;
							
							json.title = title;
							json.color = $.fncSetCommuteColor(ev[i].V_ITO_ATT_TYPE);
						}
						json.start = ev[i].ITO_ATT_DATETIME;
						json.end = ev[i].ITO_ATT_DATETIME;
						json.data_id = ev[i].DATA_ID;
						json.att_reason = ev[i].ITO_ATT_REASON;
						json.att_type = ev[i].ITO_ATT_TYPE;
						json.ito_name = ev[i].ITO_NAME;
						json.ito_data_id = ev[i].ITO_DATA_ID;
						
						json.ito_position = ev[i].ITO_POSITION;
						json.ito_type = ev[i].ITO_TYPE;
						json.ito_work = ev[i].ITO_WORK;
						
						events.push(json);
					}
					return events;
				}
			},
			eventClick:function(calEvent, jsEvent, view) {

				var fullDate = calEvent.start._i;
				var title = calEvent.title.toString();
				
				$('#ITO_ATT_TYPE').find('option').each(function() {
					if($(this).attr('value') == 'CDE00004001' )
						$(this).remove();
				});
				
				$('#ITO_ATT_TYPE').append("<option value='CDE00004001'>정상</option>");

				$.g_selectedEventId = calEvent.data_id;
				
				if ( $.g_selectedId == '' )
					$('#ITO_NAME').val(calEvent.ito_name);
				else
					$('#ITO_NAME').val($.g_selectedNm);
				
				$('#ITO_DATA_ID').val(calEvent.ito_data_id);
				$('#ITO_ATT_REASON').val(calEvent.att_reason);
				$('#ITO_ATT_DATETIME').val(fullDate);
				$('#ITO_ATT_TYPE').val(calEvent.att_type);
				
				$('#ITO_POSITION').val(calEvent.ito_position);
				$('#ITO_TYPE').val(calEvent.ito_type);
				$('#ITO_WORK').val(calEvent.ito_work);
				$('#standardModal').modal({backdrop: 'static', keyboard: false});
			},
			viewRender: function(event, element, view) {
				var d = $('#calendar').fullCalendar('getDate');
				var year = d.year();
	
				$.fncCurrentMonth();
				$('.fc-day-top').each(function() {
					var _date = $(this).attr('data-date');
	
					var newArr = holiday.filter(function(item) {
						var date = item.RSR_HOLIDAY_DATE.replace('*', year);
						return date == _date;
					});
					
					if ( newArr.length > 0 ) {
						var title = newArr[0].RSR_HOLIDAY_TITLE;
						if ( typeof title == 'undefined' ) title = '';
						
						$(this).addClass('fc-holiday');
						$(this).prepend('<span style="padding:2px">' + title + '</span>');
					}
				});
			},
			dayClick: function(date, jsEvent, view) {
				if ( $.g_selectedId == '' ) return false;
				
				var d = date.format();
				var isEventDate = false;
	
				$('#calendar').fullCalendar('clientEvents', function(event) {
					var eventDate = event.start.format();
					
					if (d == eventDate) {
						isEventDate = true;
					}
				});
				
				$('#ITO_ATT_TYPE').find('option').each(function() {
					if($(this).attr('value') == 'CDE00004001' )
						$(this).remove();
				});
	
				if ( isEventDate ) {
					return false;
				};
	
				$('#ITO_ATT_TYPE').val('0');
				$.g_selectedEventId = '';

				$('#ITO_NAME').val($.g_selectedNm);
				$('#ITO_ATT_REASON').val('');
				$('#ITO_ATT_DATETIME').val(date.format());
				$('#standardModal').modal({backdrop: 'static', keyboard: false});
			}
		});
	};

	//date선택
	$('#data_month .input-group.date').datepicker({
		minViewMode: 1,
		keyboardNavigation: false,
		forceParse: false,
		autoclose: true,
		todayHighlight: true,
		language: "kr",
		format: 'yyyy-mm'
	});

	/*
	함수명			fncCurrentMonth
	작성자			정종헌
	작성일			2017-03-31
	수정사항
	*/
	$.fncCurrentMonth = function() {
		var date = new Date($('#calendar').fullCalendar('getDate'));
		var yyyy = date.getFullYear().toString();
		var mm = (date.getMonth() + 1).toString();

		$.g_currentMonth = yyyy + '-' + (mm[1] ? mm : '0' + mm[0]);
		$('#event_month').val($.g_currentMonth);
	};

	/*
	함수명			fncMoveMonth
	작성자			정종헌
	작성일			2017-03-31
	수정사항
	*/
	$.fncMoveMonth = function() {
		$.g_currentMonth = $("#event_month").val();
		$('#calendar').fullCalendar('refetchEvents');
		$('#calendar').fullCalendar('gotoDate', $.g_currentMonth + '-01');
		$('a.fc-day-grid-event').height("70px");
	};

	/*
	함수명			fncSetCommuteColor
	작성자			정종헌
	작성일			2017-03-31
	수정사항
	*/
	$.fncSetCommuteColor = function (value) {
		switch(value) {
			case '외근' : return '#d1dade';
			case '정상' : return '#1f77b4';
			case '지각' : return '#f8ac59';
			case '휴가' : return '#1ab394';
			case '야간근무' : return '#1ab394';
			case '교육' : return '#23c6c8';
			case '결근' : return '#ed5565';
		}
	};
	
	$.fncGetFormData = function(data_id) {
		var sendData = {
				category_id : 'ITO00002'
		};
		
		if ( data_id != '' ) sendData.data_id = data_id;
		
		$('#standardModal .form-control').each(function() {
			var id = $(this).attr('id');
			var d = $(this).val();
			
			if ( d != '' && d != '0' )
				eval('sendData.' + id + ' = "' + d + '"');
		});
		
		return sendData;
	};
</script>

<script>
/**
	화면 로딩 후 최초 호출 영역
*/
$(function() {

	$('.btn-ibk-save').click(function() {

		var a = $('#action').val();
		var sendData = null;
		
		if ( $('#ITO_ATT_TYPE').val() == '0' ) {
			alert('근태 종류를 선택해주세요.');
			return false;
		}

		if($('#ITO_ATT_TYPE').val() != 'CDE00004001' && $('#ITO_ATT_REASON').val().trim() == '') {
			alert('사유를 반드시 입력하여야 합니다.');
			return false;
		}
		
		var url = '${pageContext.request.contextPath}/data/common/modify.rts';
		if ( $.g_selectedEventId == '' ) url = '${pageContext.request.contextPath}/data/common/create.rts';
		if ( $('#ITO_ATT_TYPE').val() == 'CDE00004001' )
			url = '${pageContext.request.contextPath}/data/common/delete.rts';
		
		$.ritusAjax({
			url: url,
			data: $.fncGetFormData($.g_selectedEventId),
			dataType: 'json',
			success: function(data) {
				if ( data.result ) {
					$('#calendar').fullCalendar('refetchEvents');
				} else alert('오류발생[' + data.message + ']');
			}
		});
	});

	$.fncDrawHrTree();
	$.fncFullCalendar();

	$('div.slimscrollTree').slimscroll({
		axis: 'both',
		size: '4px',
		height: $.getGridHeight(110) + 'px',
		width: '100%'
	});

	$(window).bind('resize', function () {
		$('div.slimscrollTree').slimscroll({
				height: $.getGridHeight(110) + 'px'
		});
	});
});

</script>
