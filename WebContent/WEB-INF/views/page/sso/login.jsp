<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>


<div class="loginColumns animated fadeInDown">
    <div class="row">

        <div class="col-md-6">
            <h2 class="font-bold"><img src="${imageServer}/img/logo.png"></h2>

            <p>
                <span class="text-success">R</span>esource <span class="text-success">I</span>ntegration and <span class="text-success">T</span>otal <span class="text-success">U</span>tilization <span class="text-success">S</span>olution
            </p>

            <p>
                	유니포인트는 유연하고 스마트한 기업 IT 운영을 위한 최적의 IT 통합관리 솔루션을 제공합니다.
            </p>

            <p>
                Ritus는 IT 중요 관리 업무인 사업, 품의, 계약, 예산 및 비용, 자산, 프로젝트, 인력관리를 유연하게 통합관리 할 수 있는 실시간 거버넌스 플랫폼입니다.
            </p>

        </div>
        <div class="col-md-6">
            <div class="ibox-content">
                <form class="m-t" role="form">
                    <div class="form-group">
                        <input id="user_id" type="text" class="form-control" placeholder="아이디" required="">
                    </div>
                    <div class="form-group">
                        <input id="user_pwd" type="password" class="form-control" placeholder="비밀번호" required="">
                    </div>
                    <button id="doLogin" type="button" class="btn btn-primary block full-width m-b">Login</button>

                    <!-- a href="#">
                        <small>Forgot password?</small>
                    </a>

                    <p class="text-muted text-center">
                        <small>Do not have an account?</small>
                    </p>
                    <a class="btn btn-sm btn-white btn-block" href="register.html">Create an account</a -->
                </form>
                <p class="m-t">
                    <small>You can be the smarter business with <a href="http://www.unipoint.co.kr" target="_blank">UNIPOINT</a></small>
                </p>
            </div>
        </div>
    </div>
    <hr/>
    <!-- <div class="row">
        <div class="col-md-6">
            Copyright &copy; 2016 by <strong><a href="http://www.unipoint.co.kr" target="_blank">Unipoint CO.LTD.</a></strong> All rights reserved.
        </div>
        <div class="col-md-6 text-right">
           <small>Ritus</small>
        </div>
    </div> -->
</div>

<!-- Placeholder for under IE11 -->
<script src="${imageServer}/js/plugins/placeholder/placeholder.min.js"></script>

<script>
	//sweet alert
	$.alertWarning = function(title, text) {
	    swal({
	        title: title,
	        text: text,
	        type: "warning"
	    });
	};
</script>

<script>

	$.doLogin = function() {
		//try { event.stopPropagation(); } catch(e) { } //do nothing in catch

		var sendData = {
			user_id : $('#user_id').val(),
			user_pwd : $('#user_pwd').val()
		};

		var isPass = true;
		if ( $.trim(sendData.user_id) == '' ) {
			$('#user_id').attr('placeholder', '아이디를 입력하세요.');
			isPass = false;
		}

		if ( $.trim(sendData.user_pwd) == '' ) {
			$('#user_pwd').attr('placeholder', '비밀번호를 입력하세요.');
			isPass = false;
		}

		if ( !isPass ) return;

		waitingDialog.show('로그인중입니다..');

		$.ajax({
			url: '${pageContext.request.contextPath}/data/sso/login.rts',
			type: 'POST',
			cash: false,
			timeout: 10000,
			dataType: "JSON",
			data: sendData,
			success: function(data) {
				waitingDialog.hide();
				if ( data.token == '' ) {
					//$.alertWarning('로그인 실패', '아이디 또는 비밀번호를 확인하세요.');
					alert('아이디 또는 비밀번호를 확인하세요.');
				} else {
					location.href = "${pageContext.request.contextPath}/page/main/dashboard.rts";
					//location.href = "${pageContext.request.contextPath}" + data.url;
				}
			}
		});
	};

	$(function() {
		$('#user_id').keydown(function(key) {
			if ( key.keyCode == 13 )
				$('#user_pwd').focus();
		});

		$('#user_pwd').keydown(function(key) {
			if ( key.keyCode == 13 )
				$.doLogin();
		});

		$("#doLogin").click(function() {
			$.doLogin();
		});
	});
</script>