<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
	.ladda-button {
		padding: 1px 5px;
		margin-left: 10px;
	}
</style>
<div class="row  border-bottom white-bg dashboard-header">
	<div class="col-md-6">
		<div class="input-group">
        	<div class="input-group-btn">
            	<button data-toggle="dropdown" class="btn btn-white dropdown-toggle" type="button">이름 <span class="caret"></span></button>
                <ul id="custom-menu" class="dropdown-menu">
                	<li search="user_name" select='1'><a>이름</a></li>
                    <li search="user_id" select='0'><a>사번</a></li>
                 </ul>
           	</div>
            <input type="text" id="searchStr" class="form-control"> <span class="input-group-btn"> <button type="button" class="btnSearch btn btn-success"><i class="fa fa-search"></i></button> </span>
      	</div>
	</div>
	<div class="col-md-6">
		<div class="text-right">
			<div class="infont form-group icons-box">
				<ul class="nav navbar-top-links navbar-right">
		            <button class="btn btn-primary" name="save" onclick="$.createUser()">사용자 생성</button>
                </ul>
             </div>
	    </div>
	</div>
</div>


	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
	 		<div class="col-lg-12">
				<div class="jqGrid_wrapper">
		             <table id="user_list"></table>
		             <div id="pager_user_list"></div>
		        </div>
	 		</div>
		</div>
	</div>

	<div class="modal inmodal fade" id="detailModal" tabindex="-1" role="dialog"  aria-hidden="true">
		<input type="hidden" id="action" name="action" />
		<input type="hidden" id="category" name="category" />
		<input type="hidden" id="categoryPrefix" name="categoryPrefix" />
		<input type="hidden" id="category_id" name="category_id" />
		<input type="hidden" id="group_id" name="group_id" />
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	                <h4 class="modal-title">사용자 관리</h4>
	            </div>
	            <div class="modal-body">
					<form id="F1" class="form-horizontal">
						<div class="row">
		                	<div class="col-md-6">
		                		<div>
									<label class='col-sm-4' style="padding-top:8px;">사용자 아이디</label>
									<div class='col-sm-8'>
										<input id='user_id' type='text' class='form-control required'>
									</div>
								</div>
							</div>
							<div class="col-md-6">
			                	<div>
									<label class='col-sm-4' style="padding-top:8px;">사용자 이름</label>
									<div class='col-sm-8'>
										<input id='user_name' type='text' class='form-control required'>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
		                	<div class="col-md-6">
		                		<div>
									<label class='col-sm-4' style="padding-top:8px;">비밀번호</label>
									<div class='col-sm-8'>
										<input id='pwd_1' type='password' class='form-control required'>
									</div>
								</div>
							</div>
							<div class="col-md-6">
			                	<div>
									<label class='col-sm-4' style="padding-top:8px;">비밀번호 확인</label>
									<div class='col-sm-8'>
										<input id='pwd_2' type='password' class='form-control required'>
									</div>
								</div>
							</div>
						</div>
						<div class='hr-line-dashed'></div>
						<div class="row">
							<div class="col-md-6">
								<div>
									<label class='col-sm-4'>사용자 소속</label>
									<div class='col-sm-8'>
										<select id="user_type" class="form-control">
											${CDE00018}
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div>
									<label class='col-sm-4' style="padding-top:8px;">관리페이지</label>
									<div class='col-sm-8' style="padding-top:8px;">
										<div class='i-checks'><label> <input id='isadmin' type='checkbox' class='form-control'> <i></i>접속허용</label></div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-white btnClose" data-dismiss="modal">닫기</button>
	                <button type="button" class="btn btn-danger btnDelete" onclick="$.remove()">삭제</button>
	                <button type="button" class="btn btn-primary btnUpdate" onclick="$.update()">수정</button>
	                <button type="button" class="btn btn-primary btnAdd" onclick="$.add()">추가</button>
	            </div>
	        </div>
	    </div>
	</div>

<!-- jqGrid -->
<script src="${imageServer}/js/plugins/jqGrid/jquery.jqGrid.min.js"></script>

<!-- iCheck -->
<script src="${imageServer}/js/plugins/iCheck/icheck.min.js"></script>

<!-- Toastr script -->
<script src="${imageServer}/js/plugins/toastr/toastr.min.js"></script>

<script type="text/javascript">

	function btn_setIcon(cellvalue, options, rowObject) {
		var buttonCost = '<i class="fa fa-list"></i>';
		return buttonCost;
	}
	
	function getUserTypeString(cellvalue, options, rowObject) {
		var text = '';
		$.each($('#detailModal #user_type option'), function(index, obj) {
			var v = $(obj).attr('value');
			if ( cellvalue == v )
				text = $(obj).text();
		});
		return text;
	}
	
	function getUserType(p) {
		var text = '';
		$.each($('#detailModal #user_type option'), function(index, obj) {
			var v = $(obj).text();
			if ( p == v )
				text = $(obj).attr('value');
		});
		return text;
	}

	$(function() {
		$('#detailModal .btnDelete').hide();

		$.getUserList();

		$('#custom-menu > li').click(function() {
			$('#custom-menu > li').attr('select', '0');
			$(this).attr('select', '1');

			$('button.dropdown-toggle').html($(this).text() + ' <span class="caret"></span>');
		});

		$('button.btnSearch').click(function() {
			$.getUserList();
		});
	});

	$.getUserList = function() {
		var searchOption = $('#custom-menu > li[select="1"]').attr('search');
		var searchStr = $('#searchStr').val();
		if ( searchStr == null || searchStr == '' ) searchOption = '';

		$("#user_list").GridUnload();
		$("#user_list").jqGrid({
    		url: "${pageContext.request.contextPath}/admin/data/manage/users/authUsers.rts",
    		postData: {
    			searchOption: searchOption,
    			searchStr: searchStr
    		},
    		sortname : 'USER_ID',
			sortorder : 'ASC',
            mtype: "POST",
            datatype: "json",
            height: $.getGridHeight(),
            colNames: ["사용자 아이디", "사용자 이름", "사용자 소속", "마지막 로그인 시간", "isadmin"],
			colModel: [
			           {name: 'user_id', format: 'string'},
			           {name: 'user_name', format: 'string'},
			           {name: 'user_type', formatter: getUserTypeString},
			           {name: 'lastlogin', format: 'date'},
			           {name: 'isadmin', hidden:true}
			],
            autowidth: true,
            shrinkToFit: true,
            viewrecords: true,
            rowNum: 15,
            rowList: [15, 30, 50, 100],
            hidegrid: false,
            pager: "#pager_user_list",
            onCellSelect: function(rowid, icol, cellcontent, e) {
            	var user_id = $(this).jqGrid('getCell', rowid, 'user_id');

           		var user_name = $(this).jqGrid('getCell', rowid, 'user_name');
           		var isadmin = $(this).jqGrid('getCell', rowid, 'isadmin');
           		var user_type = $(this).jqGrid('getCell', rowid, 'user_type');

           		$('#detailModal #user_id').val(user_id);
           		$('#detailModal #user_name').val(user_name);
           		$('#detailModal #user_type').val(getUserType(user_type));
           		if ( isadmin == 'Y' )
           			$('#detailModal #isadmin').prop('checked', true);
           		else $('#detailModal #isadmin').prop('checked', false);

           		$('#detailModal div.i-checks').iCheck({
                       checkboxClass: 'icheckbox_square-green',
                       radioClass: 'iradio_square-green',
                   });

           		$('#detailModal #user_id').prop('disabled', true);

           		$('#detailModal .btnDelete').show();
           		$('#detailModal .btnUpdate').show();
           		$('#detailModal .btnAdd').hide();

           		$('#detailModal').modal();
            }
		}).trigger("reloadGrid");
	};

	$.createUser = function() {
		$('#detailModal #user_id').val('');
		$('#detailModal #user_name').val('');
		$('#detailModal #user_type').val('0');
		$('#detailModal #pwd_1').val('');
		$('#detailModal #pwd_2').val('');
		$('#detailModal #isadmin').prop('checked', false);

		$('#detailModal #user_id').prop('disabled', false);

		$('#detailModal div.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });

		$('#detailModal .btnDelete').hide();
		$('#detailModal .btnUpdate').hide();
		$('#detailModal .btnAdd').show();
		$('#detailModal').modal();
	};

	$.add = function() {
		var user_id = $('#detailModal #user_id').val();
		var pwd_1 = $('#detailModal #pwd_1').val();
		var pwd_2 = $('#detailModal #pwd_2').val();
		var user_name = $('#detailModal #user_name').val();
		var user_type = $('#detailModal #user_type').val();
		var isadmin = $('#detailModal #isadmin').parent().hasClass('checked')? 'Y':'N';

		var sendData = {
			user_id : user_id,
			user_name : user_name,
			user_type : user_type,
			isadmin : isadmin
		};

		if ( user_id == '' ) {
			alert('사용자 아이디를 입력해주세요.');
			return;
		} else if ( user_name == '' ) {
			alert('사용자 이름을 입력해주세요.');
			return
		} else if ( pwd_1 == '' ) {
			alert('비밀번호를 입력해주세요.');
			return;
		} else if ( pwd_1 != pwd_2 ) {
			alert('비밀번호가 서로 다릅니다.');
			return;
		} else
			sendData.user_pwd = pwd_1;

		$.ajax({
    		url: '${pageContext.request.contextPath}/admin/data/manage/users/createUser.rts',
    		type: 'POST',
    		cash: false,
    		timeout: 30000,
    		dataType: "JSON",
    		data: sendData,
    		success: function(data) {
    			toastr.options.timeOut = 1000;
				toastr.success(data.message, '사용자정보');

    			$('#detailModal .btnClose').click();
    			$('#user_list').trigger('reloadGrid');
    		}
		});
	};

	$.update = function() {
		var user_id = $('#detailModal #user_id').val();
		var pwd_1 = $('#detailModal #pwd_1').val();
		var pwd_2 = $('#detailModal #pwd_2').val();
		var user_name = $('#detailModal #user_name').val();
		var user_type = $('#detailModal #user_type').val();
		var isadmin = $('#detailModal #isadmin').parent().hasClass('checked')? 'Y':'N';

		var sendData = {
			user_id : user_id,
			user_name : user_name,
			user_type : user_type,
			isadmin : isadmin
		};

		if ( user_name == '' ) {
			alert('사용자 이름을 입력해주세요.');
			return
		} else if ( pwd_1 != '' || pwd_2 != '' ) {
			if ( pwd_1 != pwd_2 ) {
				alert('비밀번호가 서로 다릅니다.');
				return;
			} else
				sendData.user_pwd = pwd_1;
		}

		$.ajax({
    		url: '${pageContext.request.contextPath}/admin/data/manage/users/modifyUser.rts',
    		type: 'POST',
    		cash: false,
    		timeout: 30000,
    		dataType: "JSON",
    		data: sendData,
    		success: function(data) {
    			toastr.options.timeOut = 1000;
				toastr.success(data.message, '사용자정보');

    			$('#detailModal .btnClose').click();
    			$('#user_list').trigger('reloadGrid');
    		}
		});
	};

	$.remove = function() {
		var user_id = $('#detailModal #user_id').val();

		var sendData = {
			user_id : user_id
		};

		if ( confirm('삭제하시겠습니까?') ) {

			$.ajax({
	    		url: '${pageContext.request.contextPath}/admin/data/manage/users/deleteUser.rts',
	    		type: 'POST',
	    		cash: false,
	    		timeout: 30000,
	    		dataType: "JSON",
	    		data: sendData,
	    		success: function(data) {
	    			toastr.options.timeOut = 1000;
    				toastr.success(data.message, '사용자정보');

	    			$('#detailModal .btnClose').click();
	    			$('#user_list').trigger('reloadGrid');
	    		}
			});

		}
	};

</script>