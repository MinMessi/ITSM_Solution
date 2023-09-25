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
			<div class="col-sm-8">
				<div class="text-right">
					<div class="infont form-group icons-box navbar-right">
						<button class="btn btn-success" id="btnRegist">OP 업무일지 등록</button>
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

<!-- OP업무일지 등록 START  -->
	<div class="modal inmodal fade" id="detailModal" tabindex="-1" role="dialog"  aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                <!-- <h4 class="modal-title">장애 등록</h4> -->
	            </div>
	            <div class="modal-body">
					<form id="F1" class="form-horizontal">
						 <div class="report">
						      <div class="paper" id="printSection">
						         <p class="p_tit">한국은행 데이터센터 야간 업무일지</p>
									<div class='col-sm-6'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control required" id="TRB_START_DATE">
										</div>
									</div>
						         <div class="r_box">
						            <table>
						               <tbody>
						                  <tr>
						                     <td>▣ 강남센터 운영근무 현황</td>
						                     <td>운영근무자 [18:00 ~ 09:00]</td>
						                     <td>근무자 : <span>(사인)</span> / PM : <span>(사인)</span></td>
						                  </tr>
						               </tbody>
						            </table>
						         </div>
						         <!-- 강남센터 야간 출입자 및 기술지원내역 -->
						         <div class="r_box">
						            <p class="r_tit">▣ 강남센터 야간 출입자 및 기술지원내역</p>
						            <table>
						               <thead>
						                  <tr>
						                     <th rowspan="2">작업시간</th>
						                     <th colspan="2">작업자</th>
						                     <th rowspan="2">작업내용</th>
						                  </tr>
						                  <tr>
						                     <th>한국은행</th>
						                     <th>협력사</th>
						                  </tr>
						               </thead>
						               <tbody>
						                  <tr>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						               </tbody>
						            </table>
						         </div>
						         <!-- 강남센터 점검시간 -->
						         <div class="r_box">
						            <p class="r_tit">▣ 강남센터 점검시간</p>
						            <table class="fixed">
						               <thead>
						                  <tr>
						                     <th colspan="2">점검시간</th>
						                     <th>18:30</th>
						                     <th>21:00</th>
						                     <th>23:30</th>
						                     <th>-</th>
						                     <th>5:00</th>
						                     <th>8:00</th>
						                     <th>비고</th>
						                  </tr>
						               </thead>
						               <tbody>
						                  <tr>
						                     <td rowspan="5">PART</td>
						                     <td>UNIX</td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td>-</td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td>WINDOWS</td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td>-</td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td>WAS</td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td>-</td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td>DBMS</td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td>-</td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td>NETWORK</td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td>-</td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						               </tbody>
						            </table>
						         </div>
						         <!-- 강남센터 점검 TIMETABLE -->
						         <div class="r_box">
						            <p class="r_tit">▣ 강남센터 점검 TIMETABLE</p>
						            <table>
						               <thead>
						                  <tr>
						                     <th rowspan="2">작업<br>시간</th>
						                     <th>구분</th>
						                     <th rowspan="2">점검 대상</th>
						                     <th rowspan="2">점검 내역</th>
						                     <th rowspan="2">점검 특이사항</th>
						                     <th rowspan="2">비고</th>
						                  </tr>
						                  <tr>
						                     <th>점검/확인</th>
						                  </tr>
						               </thead>
						               <tbody>
						                  <tr>
						                     <td>18:00<br>-<br>18:30</td>
						                     <td>서비스<br>상태확인</td>
						                     <td>Ontune<br>Jennifer<br>Maxgauge<br>CA, Network</td>
						                     <td class="ta_l">시스템, WAS, DBMS, NETWORK<br><div class="sub_txt">임계치, ALARM, SMS 확인</div></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td>18:30<br>-<br>19:00</td>
						                     <td>스크립트<br>실행점검</td>
						                     <td>UNIX<br>WAS<br>DBMS</td>
						                     <td class="ta_l">운영서버 대상<br><div class="sub_txt">ibmsvc User 로그인<br>'check' 명령어 실행 후<br>결과값 점검</div></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td>19:00<br>-<br>19:30</td>
						                     <td>서비스<br>상태확인</td>
						                     <td>Ontune<br>Jennifer<br>Maxgauge<br>CA, Network</td>
						                     <td class="ta_l">시스템, WAS, DBMS, NETWORK<br><div class="sub_txt">임계치, ALARM, SMS 확인</div></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td>20:00<br>-<br>20:30</td>
						                     <td>서비스<br>상태확인</td>
						                     <td>Ontune<br>Jennifer<br>Maxgauge<br>CA, Network</td>
						                     <td class="ta_l">시스템, WAS, DBMS, NETWORK<br><div class="sub_txt">임계치, ALARM, SMS 확인</div></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td>18:00<br>-<br>18:30</td>
						                     <td>서비스<br>상태확인</td>
						                     <td>Ontune<br>Jennifer<br>Maxgauge<br>CA, Network</td>
						                     <td class="ta_l">시스템, WAS, DBMS, NETWORK<br><div class="sub_txt">임계치, ALARM, SMS 확인</div></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td>18:30<br>-<br>19:00</td>
						                     <td>스크립트<br>실행점검</td>
						                     <td>UNIX<br>WAS<br>DBMS</td>
						                     <td class="ta_l">운영서버 대상<br><div class="sub_txt">ibmsvc User 로그인<br>'check' 명령어 실행 후<br>결과값 점검</div></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td>19:00<br>-<br>19:30</td>
						                     <td>서비스<br>상태확인</td>
						                     <td>Ontune<br>Jennifer<br>Maxgauge<br>CA, Network</td>
						                     <td class="ta_l">시스템, WAS, DBMS, NETWORK<br><div class="sub_txt">임계치, ALARM, SMS 확인</div></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td>20:00<br>-<br>20:30</td>
						                     <td>서비스<br>상태확인</td>
						                     <td>Ontune<br>Jennifer<br>Maxgauge<br>CA, Network</td>
						                     <td class="ta_l">시스템, WAS, DBMS, NETWORK<br><div class="sub_txt">임계치, ALARM, SMS 확인</div></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td>20:00<br>-<br>20:30</td>
						                     <td>서비스<br>상태확인</td>
						                     <td>Ontune<br>Jennifer<br>Maxgauge<br>CA, Network</td>
						                     <td class="ta_l">시스템, WAS, DBMS, NETWORK<br><div class="sub_txt">임계치, ALARM, SMS 확인</div></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td>20:00<br>-<br>20:30</td>
						                     <td>서비스<br>상태확인</td>
						                     <td>Ontune<br>Jennifer<br>Maxgauge<br>CA, Network</td>
						                     <td class="ta_l">시스템, WAS, DBMS, NETWORK<br><div class="sub_txt">임계치, ALARM, SMS 확인</div></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td>20:00<br>-<br>20:30</td>
						                     <td>서비스<br>상태확인</td>
						                     <td>Ontune<br>Jennifer<br>Maxgauge<br>CA, Network</td>
						                     <td class="ta_l">시스템, WAS, DBMS, NETWORK<br><div class="sub_txt">임계치, ALARM, SMS 확인</div></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						               </tbody>
						            </table>
						         </div>
						         <!-- 강남센터 점검 특이사항 및 전달사항 -->
						         <div class="r_box">
						            <p class="r_tit">▣ 강남센터 점검 특이사항 및 전달사항</p>
						            <table>
						               <thead>
						                  <tr>
						                     <th>점검시간</th>
						                     <th>PART</th>
						                     <th>점검 특이사항</th>
						                     <th>점검자</th>
						                  </tr>
						               </thead>
						               <tbody>
						                  <tr>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						                  <tr>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                     <td><input type="text"></td>
						                  </tr>
						               </tbody>
						            </table>
						         </div>
						      </div>
						   </div>
						
						<%-- <div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="padding-top:7px;">장애발생 일시<i class="text-danger">*</i></label>
									<div class='col-sm-6'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control required" id="TRB_START_DATE">
										</div>
									</div>
									<div class='col-sm-4'>
										<div class="input-group clockpicker" data-autoclose="true">
			                                <input type="text" class="form-control required" id="TRB_START_TIME" value="" >
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
									<label class='col-sm-2' style="padding-top:7px;">장애종료 일시</label>
									<div class='col-sm-6'>
										<div class="date input-group" id="datepicker">
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
											<input type="text" class="form-control" id="TRB_END_DATE">
										</div>
									</div>
									<div class='col-sm-4'>
										<div class="input-group clockpicker" data-autoclose="true">
			                                <input type="text" class="form-control" id="TRB_END_TIME" value="" >
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
		                			<input type="hidden" class="form-control" id="TRB_AST_CD">
									<label class='col-sm-2' style="padding-top:7px;">대상자산<i class="text-danger">*</i></label>
									<div class='col-sm-10'>
										<input id="TRB_AST_NAME" type="text" class="form-control" disabled>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">요청자</label>
									<div class='col-sm-8'>
										<select id="TRB_REQ_USER_ID" class="form-control">
											${CLIENTS}
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">작업자<i class="text-danger">*</i></label>
									<div class='col-sm-8'>
										<select id="TRB_WORKING_USER_ID" class="form-control required">
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
									<label class='col-sm-4' style="padding-top:7px;">상태</label>
									<div class='col-sm-8'>
										<select id="TRB_STATUS" class="form-control">
											${CDE00016}
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:7px;">서비스명</label>
									<div class='col-sm-8'>
										<input id='TRB_SERVICE_NAME' type='text' class='form-control'>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="padding-top:7px;">장애현황</label>
									<div class='col-sm-10'>
										<textarea class='form-control' id="TRB_CONT"></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="padding-top:7px;">조치내용</label>
									<div class='col-sm-10'>
										<textarea class='form-control' id="TRB_ACTION_CONT"></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="padding-top:7px;">향후계획</label>
									<div class='col-sm-10'>
										<textarea class='form-control' id="TRB_PLAN"></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="padding-top:7px;">비고</label>
									<div class='col-sm-10'>
										<textarea class='form-control' id="TRB_REMARK"></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-12">
								<div>
									<label class='col-sm-2' style="padding-top:7px;">첨부파일</label>
									<div class='col-sm-10'>
										<div id="file_text"></div>
										<button class="btn btn-warning btnUploadFiles" onclick="return false;">파일업로드</button>
										<input id="TRB_FILE" type="hidden" class="form-control">
									</div> 
								</div>
							</div>
						</div> --%>
					</form>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-white btnClose" data-dismiss="modal">닫기</button>
	                <button type="button" class="btn btn-danger btnDel" style="display:none;">삭제</button>
	                <button type="button" class="btn btn-warning btnMod" style="display:none;">수정</button>
	                <button type="button" class="btn btn-primary btnAdd">추가</button>
	                
	                <!-- <button type = "button" class="btn btn-white btnPrint" OnClick="print(document.getElementById('printArea').innerHTML)">프린트</button> -->
	                <button type = "button" class="btn btn-white btnPrint" OnClick=window.print()>프린트</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	
	
	<form id="uploadForm" enctype="multipart/form-data" style="display:none;">
		<input id="uploadMultipleFile" multiple="multiple" type="file" name="filename" />
	</form>
<!-- OP업무일지 등록 START  -->

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
	
	
	  * {margin:0; padding:0; border:0; outline:0; font-size:100%; font-family: 'Noto Sans KR', sans-serif;}
      body {background:#212a33;}
      
      .report {width:800px; margin:50px auto;}
      .report .paper {*overflow:auto; display:inline-block; width:800px; *height:1132px; padding:25px; color:#000; background:#fff;}
      .report .paper .p_tit {padding:25px 0 50px; font-size:25px; font-weight:bold; text-align:center;}
      .report .paper .p_date {margin-bottom:5px; text-align:right; font-size:12px;}
      .report .paper .r_box {margin-bottom:20px;}
      .report .paper .r_box .r_tit {margin:0 0 5px 15px; font-size:12px;}
      .report .paper .r_box table {width:100%; font-size:12px; text-align:center; border-collapse:collapse;}
      .report .paper .r_box table.fixed {table-layout:fixed;}
      .report .paper .r_box table th {height:24px; padding:2px 5px; text-align:center; font-weight:normal; border:1px solid #000;}
      .report .paper .r_box table td {height:24px; padding:2px 5px; line-height:1.3; border:1px solid #000;}
      .report .paper .r_box table td input {display:inline-block; width:100%; min-height:24px; height:100%; background:#fff;}
      .report .paper .r_box table td span {padding-left:100px;}
      .report .paper .r_box table td .sub_txt {position:relative; padding-left:10px;}
      .report .paper .r_box table td .sub_txt:before {content:"-"; position:absolute; left:0;}
      .ta_l {text-align:left;}
      
      

		
		@media print {
		  body * {
		    visibility:hidden;
		    
		  }
		  #printSection, #printSection * {
		    visibility:visible;
		    
		    
		  }
		  #printSection {
		    position:absolute;
		 	padding: 0;
	        margin: 0;
	        left: 0;
	        top: 0;
	        margin-top: 50px;
	       	width:auto;
	        height:auto;
	        display:table;
		    
		  }
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
	$.g_action = "I";
	$.data_id = 0;
</script>

<script>
	
	//프린트 버튼
	$(document).ready(function() {

	    $("#btnPrint").click(function() {
	
	        $("#targetPrint").printThis({
	
	            debug: false,               // show the iframe for debugging
	
	            importCSS: true,            // import page CSS
	
	            importStyle: false,         // import style tags
	
	            printContainer: true,       // grab outer container as well as the contents of the selector
	
	            pageTitle: "",              // add title to print page
	
	            removeInline: false,        // remove all inline styles from print elements
	
	            printDelay: 333,            // variable print delay; depending on complexity a higher value may be necessary
	
	            header: null,               // prefix to html
	
	            footer: null,               // postfix to html
	
	            base: false ,               // preserve the BASE tag, or accept a string for the URL
	
	            formValues: true,           // preserve input/form values
	
	            canvas: false,              // copy canvas elements (experimental)
	
	            doctypeString: "...",       // enter a different doctype for older markup
	
	            removeScripts: false        // remove script tags from print content
	
	        }); 
		
	    });

	});



	$.fncClearForm = function() {
		$('input.form-control').val('');
		$('select').val('0');
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
					} else 
						$.g_selectedPath = ''; */
					
					$.fncGrid1();
				}
		);
	};
	
	$.fncGrid1 = function() {
		var postData = {
				category_id : 'TRB00001',
				TRB_AST_CD : $.g_selectedNode,
				startDate : $('#startDate').val(),
				endDate : $('#endDate').val()
		};
		
		$.ritusGrid({
			gridObject: '#grid_list1',
			url: '${pageContext.request.contextPath}/data/trouble/troubleList.rts',
			postData: postData,
		    width: $('.jqGrid_wrapper1').width(),
		    height: $.getGridHeight(160),
		    shrinkToFit: false,
		    rowNum: 50,
		    rowList: [20, 30, 50],
		    scroll: 1,
		    colNames: ['DATA_ID', '자산명', '발생일', '발생시간', '완료일', '완료시간', '장애 현황', '상태'],
		    colModel: [
		    	{name: 'DATA_ID', hidden:true},
		    	{name: 'TRB_AST_NAME', width:150},
		        {name: 'TRB_START_DATE', width:100},
		        {name: 'TRB_START_TIME', width:100},
		        {name: 'TRB_END_DATE', width:100},
		        {name: 'TRB_END_TIME', width:100},
		        {name: 'TRB_CONT', width:300, align:'left'},
		        {name: 'V_TRB_STATUS', width:100}
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
			url: '${pageContext.request.contextPath}/data/trouble/troubleDetail.rts',
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
				
				if ( typeof data.TRB_FILE != 'undefined' && data.TRB_FILE != '' )
					$.getFiles(data.TRB_FILE);
				
				$('button.btnAdd').hide();
				$('button.btnMod').show();
				$('button.btnDel').show();
				$('#detailModal').modal({backdrop: "static", keyboard: true});
			}
		});	
	}
	
	$.fncGetFormData = function() {
		var sendData = {
				category_id : 'TRB00001'
		};

		 $('#F1 .form-control').each(function() {
			var id = $(this).attr('id');
			var d = $(this).val();
			
			d = d.replaceAll('\n', '<br>');
			
			if ( d != '' && d != '0' )
				eval('sendData.' + id + ' = "' + d + '"');
		});
		
		if ( $.g_action == 'U' ) sendData.data_id = $.data_id;
		
		return sendData;
	};
	
	$.fncSaveData = function() {
		var url = '${pageContext.request.contextPath}/data/common/modify.rts';
		if ( $.g_action == 'I' ) url = '${pageContext.request.contextPath}/data/common/create.rts';
		
		var isPass = true;
		$('#F1 .required').each(function() {
			var v = $(this).val();
			if ( typeof v == 'undefined' || v == '' || v == '0')
				isPass = false;
		});
		
		if ( !isPass ) {
			alert('데이터를 입력해주세요.');
			return;
		}
		
		var sendData = $.fncGetFormData();
		
		$.ritusAjax({
			url: url,
			data: sendData,
			dataType: 'json',
			success: function(data) {
				if ( data.result ) {
					$.uploadFile();
					alert('저장되었습니다.');
					$('#humanResourceTree').jstree('refresh');				
					$.fncClearForm();
					$.fncGrid1();
					$('#detailModal').modal('toggle');
				} else alert('오류발생[' + data.message + ']');
			}
		});	
	};
	
	$.fncClearForm = function(isInit) {
		$('.headNmText').html('');
		
		$('input.form-control').val('');
		$('select').val('0');
		
		$('textarea.form-control').val('');
		
		$('button.btnUploadFiles').text('파일업로드');
		$('button.btnUploadFiles').prop('disabled', false);
		
		$('#file_text').css('padding', '0px');
		$('#file_text').html('');
	};
	
	$.uploadFile = function() {
		var category_id = 'TRB00001';
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
				$('#uploadMultipleFile').val('');
				$('button.btnUploadFiles').text('업로드가 완료되었습니다.');
				$('button.btnUploadFiles').prop('disabled', true);
				
				var file_id = data.message;
				file_id = file_id.replace('[', '').replace(']', '');
				$('#TRB_FILE').val(file_id);
				$('#file_text').html('');
	  			$('#file_text').css('padding', '0px');
			}
		});
	};
	
	$.getFiles = function(file_id) {
		var sendData = {
				file_id : file_id
		};

		$.ritusAjax({
			url: '${pageContext.request.contextPath}/data/trouble/troubleFile.rts',
	  		data: sendData,
	  		success: function(data) {
	  				try {
	  					var a = '<a href="${pageContext.request.contextPath}/data/file_download.rts?category_id=TRB00001&data_id=0&file_id=' + data.FILE_ID + '">' + data.FILE_NAME + '</a>';
			  			$('#file_text').html(a);
			  			$('#file_text').css('padding', '5px');
	  				} catch(e) {}
	  			}
	  		});
	};
</script>

<script>
$(function() {
	$.fncDrawHrTree();
	$.fncGrid1();
	
	$(':input').inputmask();
	
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
	
	$('.clockpicker').clockpicker({
		'default': 'now'
	});
	
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
		$('#detailModal #TRB_AST_NAME').val($.g_selectedNodeText);
		$('#detailModal #TRB_AST_CD').val($.g_selectedNode);
		$('#detailModal').modal({backdrop: 'static', keyboard: false});
	});
	
	$('button.btnAdd, button.btnMod').click(function() {
		$.fncSaveData();
	});
	
	$('button.btnDel').click(function() {
		var url = '${pageContext.request.contextPath}/data/common/delete.rts';

		$.ritusAjax({
			url: url,
			data: { category_id:'TRB00001', data_id:$.data_id },
			success: function(data) {
				alert('삭제되었습니다.');
				$.fncGrid1();
				$('#detailModal').modal('toggle');
			}
		});	
	});
	
	
	
	$('button.btnUploadFiles').click(function() {
		$('#uploadMultipleFile').click();
	});
	
	$('#uploadMultipleFile').change(function() {
		$.uploadFile();
	});
	
	$(window).bind('resize', function () {
		$('div.slimscrollTree').slimscroll({
			height: $.getGridHeight(110) + 'px'
		});
		
		var width1 = $('.jqGrid_wrapper1').width();
		$('#grid_list1').setGridWidth(width1);
		$('#grid_list1').setGridHeight($.getGridHeight(160));
	}).trigger('resize');
});

</script>