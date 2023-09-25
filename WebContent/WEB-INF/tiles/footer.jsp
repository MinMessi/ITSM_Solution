<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>


<script>
	$.attendanceRefresh = function() {
		$.ritusAjax({
			url: '${pageContext.request.contextPath}/data/hr/itoAttendanceInfo.rts',
		 	dataType: 'json',
		 	success: function(data) {
		 		if ( data.result ) {
		 			$('a.attendance').text('퇴근 처리');
		 			$('a.attendance').data('type', data.message);
		 			$('a.attendance').data('title', '퇴근');
		 			
		 			if ( data.message == '2' ) {
		 				$('#att_divider').remove();
		 				$('#att_li').remove();
		 			}
		 		} else {
		 			$('a.attendance').text('출근 처리');
		 			$('a.attendance').data('type', data.message);
		 			$('a.attendance').data('title', '출근');
		 		}
		 	}
		});
	};
	
	$.attendanceUpdate = function(type) {
		$.ritusAjax({
			url: '${pageContext.request.contextPath}/data/hr/itoAttendanceUpdate.rts',
		 	dataType: 'json',
		 	data: { type: type },
		 	success: function(data) {
		 		alert(data.message);
		 		$.attendanceRefresh();
		 	}
		});
	}
	
	$(function() {
		//attendance
		$.attendanceRefresh();
		
		$('a.attendance').click(function() {
			var title = $(this).data('title');
			var type = $(this).data('type');
		
			swal({
				title: title + " 처리",
				text: title + " 처리를 하시겠습니까?",
				showCancelButton: true,
				closeOnConfirm: false
			},
			function() {
				$.attendanceUpdate(type);
			});
		});
		
		$('a.changePWD').click(function() {
			swal({
				title: "비밀번호 확인",
				text: "현재 비밀번호를 입력해주세요.",
				type: "input",
				inputType: 'password',
				showCancelButton: true,
				closeOnConfirm: false,
				inputPlaceholder: "비밀번호를 입력해주세요."
			},
			function(inputValue) {
				if ( inputValue === false ) return false;
				if ( inputValue === "" ) {
					swal.showInputError("비밀번호를 입력해주세요");
					return false;
				}

				$.ritusAjax({
					url: '${pageContext.request.contextPath}/data/sso/checkPWD.rts',
				 	dataType: 'json',
				 	data : { p: inputValue },
				 	success: function(data) {
				 		if ( data.token == '' ) {
				 			swal.showInputError('비밀번호가 맞지 않습니다.');
				 			return false;
				 		}
				 		swal({
							title: "비밀번호 변경",
							text: "새로운 비밀번호를 입력해주세요.",
							type: "input",
							inputType: 'password',
							showCancelButton: true,
							closeOnConfirm: false,
							inputPlaceholder: "비밀번호를 입력해주세요."
						},
						function(inputValue) {
							if ( inputValue === false ) return false;
							if ( inputValue === "" ) {
								swal.showInputError("비밀번호를 입력해주세요");
								return false;
							}

							swal({
								title: "비밀번호 확인",
								text: "동일한 비밀번호를 한 번 더 입력해주세요.",
								type: "input",
								inputType: 'password',
								showCancelButton: true,
								closeOnConfirm: false,
								inputPlaceholder: "비밀번호를 한 번 더 입력해주세요."
							},
							function(secondValue) {
								if ( secondValue === false ) return false;
								if ( secondValue === "" ) {
									swal.showInputError("비밀번호를 입력해주세요");
									return false;
								} else if ( inputValue !== secondValue ) {
									swal.showInputError("비밀번호가 다릅니다.");
									return false;
								}

								$.ritusAjax({
									url: '${pageContext.request.contextPath}/admin/data/manage/users/authChangePWD.rts',
								 	dataType: 'json',
								 	data : { p: secondValue },
								 	success: function(data) {
								 		if ( data.result )
								 			swal("완료", "비밀번호 변경이 완료되었습니다.", "success");
								 		else
								 			swal("실패", "비밀번호 변경을 실패하였습니다.", "fail");
								 	}
								});
							});
						});
				 	}
				});

			});
		});
	});
</script>

<div class="footer">
    <div class="pull-right">
    </div>
    <div>
        Copyright (C) 2020-2023 by <strong><a href="http://www.unipoint.co.kr" target="_blank">Unipoint CO.LTD.</a></strong> All rights reserved.
    </div>
</div>