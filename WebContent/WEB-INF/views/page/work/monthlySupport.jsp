<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<!-- start 상단 버튼 영역 -->
<div class="row	border-bottom white-bg dashboard-header" style="height:57px;">
	<div class="col-md-12">
		<!-- start 선택박스 영역 -->
		<div class="col-sm-2">
			<div class="form-group" id="data_month">
				<div class="input-group date MONTHPICKER">
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
		<div class="col-lg-12 hideContent">
			<div class="ibox float-e-margins">
				<div class="ibox-content full-height">
				<div id="calendar" ></div>
			</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal inmodal fade" id="standardModal" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">점검관리</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div>
						<label class="col-md-2 control-label" align="right" style="padding-top:8px;">날짜</label>
						<div class="col-sm-10">
							<div class="date input-group DATEPICKER" id="datepicker">
								<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
								<input type="text" class="form-control required" id="RSR_SUPPORT_DATE" disabled>
							</div>
						</div>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="row">
					<div>
						<label class="col-md-2 control-label" align="right" style="padding-top:8px;">시간</label>
						<div class="col-sm-10">
							<div class="input-group clockpicker" data-autoclose="true">
                               <input id="RSR_SUPPORT_TIME" type="text" class="form-control" value="">
                               <span class="input-group-addon">
                                   <span class="fa fa-clock-o"></span>
                               </span>
                           </div>
						</div>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="row">
					<div>
						<label class="col-md-2 control-label" align="right" style="padding-top:8px;">업체명</label>
						<div class="col-md-10">
							<select id="RSR_SUPPORT_COMPANY" name="RSR_SUPPORT_COMPANY" class="form-control reference">
								${CDE00002}
							</select>
						</div>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="row">
					<div>
						<label class="col-md-2 control-label" align="right" style="padding-top:8px;">색상</label>
						<div class="col-md-10">
							<input type="text" id="RSR_SUPPORT_COLOR" class="form-control cpicker" value="#ff0000" />
						</div>
					</div>
				</div>

				<!--	 내용 끝-->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" id="btnSave" data-dismiss="modal">저장</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<div class="modal inmodal fade" id="detailModal" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">점검관리(수정)</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div>
						<label class="col-md-2 control-label" align="right" style="padding-top:8px;">날짜</label>
						<div class="col-sm-10">
							<div class="date input-group DATEPICKER" id="datepicker">
								<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
								<input type="text" class="form-control required" id="RSR_SUPPORT_DATE">
							</div>
						</div>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="row">
					<div>
						<label class="col-md-2 control-label" align="right" style="padding-top:8px;">시간</label>
						<div class="col-sm-10">
							<div class="input-group clockpicker" data-autoclose="true">
                               <input id="RSR_SUPPORT_TIME" type="text" class="form-control" value="">
                               <span class="input-group-addon">
                                   <span class="fa fa-clock-o"></span>
                               </span>
                           </div>
						</div>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="row">
					<div>
						<label class="col-md-2 control-label" align="right" style="padding-top:8px;">업체명</label>
						<div class="col-md-10">
							<select id="RSR_SUPPORT_COMPANY" name="RSR_SUPPORT_COMPANY" class="form-control reference">
								${CDE00002}
							</select>
						</div>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="row">
					<div>
						<label class="col-md-2 control-label" align="right" style="padding-top:8px;">색상</label>
						<div class="col-md-10">
							<input type="text" id="RSR_SUPPORT_COLOR" class="form-control cpicker"  />
						</div>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="row">
					<div>
						<label class="col-md-2 control-label" align="right" style="padding-top:8px;">업체주소</label>
						<div class="col-md-10">
							<textarea id="COM_ADDRESS" class="form-control" disabled></textarea>
						</div>
					</div>
				</div>
				<div class="hr-line-dashed"></div>
				<div class="row">
					<div>
						<label class="col-md-2 control-label" align="right" style="padding-top:8px;">대표번호</label>
						<div class="col-md-10">
							<input type="text" class="form-control required" id="COM_PHONE" disabled>
						</div>
					</div>
				</div>

				<!--	 내용 끝-->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" id="btnComplete" data-dismiss="modal">점검완료</button>
				<button type="button" class="btn btn-warning" id="btnModify" data-dismiss="modal">수정</button>
				<button type="button" class="btn btn-danger" id="btnDelete" data-dismiss="modal">삭제</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- End modal -->

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

<!-- Clock picker -->
<script src="${imageServer}/js/plugins/clockpicker/clockpicker.js"></script>

<!-- Color picker -->
<script src="${imageServer}/js/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>

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

	$.g_mgnr_id = ('${userInfo.isadmin}' == 'Y'? '' : '${userInfo.user_id}');
</script>

<script>
	
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
				//do nothing
			},
			eventDrop : function(event, delta, revertFunc) {
				console.log(event);
				console.log(delta);
				console.log(revertFunc);
			},
			events : {
				url: '${pageContext.request.contextPath}/data/work/supportCalendar.rts',
				data: function() {
					return {
						type: 'A'
					};
				},
				success: function(data) {
					holiday = data.holiday;
					$("td.fc-day").html("");

					var ev = data.event;
					var events = new Array();
					for ( var i=0; i<ev.length; i++ ) {
						var json = {};
						if(ev[i].RSR_SUPPORT_COMPANY != null){
							var title = ev[i].V_RSR_SUPPORT_COMPANY;
							var color = ev[i].RSR_SUPPORT_COLOR;
							if ( typeof color == 'undefined' || color == '' ) 
								color = '#1f77b4';
							json.title = title;
							json.color = color;
							json.rsr_support_company = ev[i].RSR_SUPPORT_COMPANY;
						} 
						
						json.start = ev[i].RSR_SUPPORT_DATE;
						json.end = ev[i].RSR_SUPPORT_DATE;
						json.time = ev[i].RSR_SUPPORT_TIME;
						json.data_id = ev[i].DATA_ID;
						events.push(json);
					}
					return events;
				}
			},
			eventClick:function(calEvent, jsEvent, view) {

				var fullDate = calEvent.start._i;

				$.g_selectedEventId = calEvent.data_id;
				$('#detailModal #RSR_SUPPORT_DATE').val(fullDate);
				$('#detailModal #RSR_SUPPORT_TIME').val(calEvent.time);
				$('#detailModal #RSR_SUPPORT_COMPANY').val(calEvent.rsr_support_company);
				$('#detailModal #RSR_SUPPORT_COLOR').val(calEvent.color);
				$('#detailModal #RSR_SUPPORT_COLOR').colorpicker('setValue', calEvent.color);
				$('#detailModal #COM_ADDRESS').val('');
				$('#detailModal #COM_PHONE').val('');
				
				$.fncLoadData(calEvent.rsr_support_company);
				
				$('#detailModal').modal({backdrop: 'static', keyboard: false});
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
				$.g_selectedEventId = '0';
				var d = date.format();
	
				$('#standardModal #RSR_SUPPORT_DATE').val(date.format());
				$('#standardModal').modal({backdrop: 'static', keyboard: false});
			}
		});
	};

	$.fncCurrentMonth = function() {
		var date = new Date($('#calendar').fullCalendar('getDate'));
		var yyyy = date.getFullYear().toString();
		var mm = (date.getMonth() + 1).toString();

		$.g_currentMonth = yyyy + '-' + (mm[1] ? mm : '0' + mm[0]);
		$('#event_month').val($.g_currentMonth);
	};

	$.fncMoveMonth = function() {
		$.g_currentMonth = $("#event_month").val();

		$('#calendar').fullCalendar('gotoDate', $.g_currentMonth + '-01');
		$('#calendar').fullCalendar('refetchEvents');
		
		$('a.fc-day-grid-event').height("70px");
	};
	
	$.fncLoadData = function(company_cd) {
		$.ritusAjax({
			url: '${pageContext.request.contextPath}/data/work/companyDetail.rts',
			data: {
				company_cd: company_cd	
			},
			dataType: 'json',
			success: function(data) {
				$('#detailModal #COM_ADDRESS').val(data.COM_ADDRESS);
				$('#detailModal #COM_PHONE').val(data.COM_PHONE);
			}
		});	
	};
	
	$.fncSaveData = function(sendData) {
		var url = '${pageContext.request.contextPath}/data/common/modify.rts';
		if ( sendData.data_id == '0' ) url = '${pageContext.request.contextPath}/data/common/create.rts';
		
		$.ritusAjax({
			url: url,
			data: sendData,
			dataType: 'json',
			success: function(data) {
				if ( data.result ) {
					alert('저장되었습니다.');
					$('#calendar').fullCalendar('refetchEvents');
				} else alert('오류발생[' + data.message + ']');
			}
		});	
	};
	
	$.fncDeleteData = function() {
		if ( $.g_selectedEventId == '' ) {
			alert('이벤트를 선택해주세요.');
			return
		}
		
		var url = '${pageContext.request.contextPath}/data/common/delete.rts';

		$.ritusAjax({
			url: url,
			data: { category_id:'RSR00004', data_id:$.g_selectedEventId },
			dataType: 'json',
			success: function(data) {
				alert('삭제되었습니다.');
				$('#calendar').fullCalendar('refetchEvents');
			}
		});	
	};
</script>

<script>
/**
	화면 로딩 후 최초 호출 영역
*/
$(function() {

	$('#btnSave, #btnModify').click(function() {
		var modal = '#standardModal';
		if ( $(this).attr('id') == 'btnModify' )
			modal = '#detailModal';

		var a = $('#action').val();
		var sendData = null;
		
		if ( $(modal + ' #RSR_SUPPORT_COMPANY').val() == '0' ) {
			alert('업체명을 선택해주세요.');
			return false;
		}

		if ( $(modal + ' #RSR_SUPPORT_DATE').val() == '' ) {
			alert('날짜를 선택해주세요.');
			return false;
		}
		
		if ( $(modal + ' #RSR_SUPPORT_TIME').val() == '' ) {
			alert('시간을 선택해주세요.');
			return false;
		}
		
		var sendData = {
				category_id : 'RSR00004',
				data_id : $.g_selectedEventId,
				RSR_SUPPORT_DATE : $(modal + ' #RSR_SUPPORT_DATE').val(),
				RSR_SUPPORT_COMPANY : $(modal + ' #RSR_SUPPORT_COMPANY').val(),
				RSR_SUPPORT_TIME : $(modal + ' #RSR_SUPPORT_TIME').val(),
				RSR_SUPPORT_COLOR : $(modal + ' #RSR_SUPPORT_COLOR').val(),
		}
		
		$.fncSaveData(sendData);
	});
	
	$('#btnComplete').click(function() {
		var modal = '#detailModal';
		var a = $('#action').val();
		var sendData = null;
		
		if ( $(modal + ' #RSR_SUPPORT_COMPANY').val() == '0' ) {
			alert('업체명을 선택해주세요.');
			return false;
		}

		if ( $(modal + ' #RSR_SUPPORT_DATE').val() == '' ) {
			alert('날짜를 선택해주세요.');
			return false;
		}
		
		if ( $(modal + ' #RSR_SUPPORT_TIME').val() == '' ) {
			alert('시간을 선택해주세요.');
			return false;
		}
		
		var sendData = {
				category_id : 'RSR00004',
				data_id : $.g_selectedEventId,
				RSR_SUPPORT_DATE : $(modal + ' #RSR_SUPPORT_DATE').val(),
				RSR_SUPPORT_COMPANY : $(modal + ' #RSR_SUPPORT_COMPANY').val(),
				RSR_SUPPORT_TIME : $(modal + ' #RSR_SUPPORT_TIME').val(),
				RSR_SUPPORT_COLOR : '#1f77b4',
		}
		
		$.fncSaveData(sendData);
	});
	
	$('#detailModal #RSR_SUPPORT_COMPANY').change(function() {
		var v = $(this).val();
		
		if ( v != '0' )
			$.fncLoadData(v);
		else {
			$('#detailModal #COM_ADDRESS').val('');
			$('#detailModal #COM_PHONE').val('');
		}
	});
	
	$('#btnDelete').click($.fncDeleteData);

	$.fncFullCalendar();
	
	$('.MONTHPICKER').datepicker({
    	format: 'yyyy-mm',
    	minViewMode: 1,
    	autoclose: true,
    	language: 'kr'
    });

	$('.DATEPICKER').datepicker({
		keyboardNavigation: false,
		forceParse: false,
		autoclose: true,
		language: 'kr',
		format: "yyyy-mm-dd"
	});

	$('div.slimscrollTree').slimscroll({
		axis: 'both',
		size: '4px',
		height: $.getGridHeight(110) + 'px',
		width: '100%'
	});
	
	$('.clockpicker').clockpicker();
	
	$('.cpicker').colorpicker();

	$(window).bind('resize', function () {
		$('div.slimscrollTree').slimscroll({
				height: $.getGridHeight(110) + 'px'
		});
	});
});

</script>
