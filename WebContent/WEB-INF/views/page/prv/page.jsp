<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<div class="row  border-bottom white-bg dashboard-header">
	<div class="col-md-12">
		<button id="btnCreate" type="button" class="btn btn-w-m btn-default">페이지 생성</button>
	</div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
 		<div class="col-md-12">
 			<div class="jqGrid_wrapper">
	             <table id="page_list"></table>
	             <div id="page_pager_list"></div>
	        </div>
  		</div>
  	</div>
</div>

<div class="modal inmodal fade" id="detailModal" tabindex="-1" role="dialog"  aria-hidden="true">
	<input type="hidden" id="action" name="action" />
	<input type="hidden" id="page_id" name="page_id" />
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">페이지 생성</h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
		        	<div class="form-group">
						<label class="col-sm-2 control-label">페이지 제목</label>
						<div class="col-sm-10"><input id="page_title" name="page_title" type="text" class="form-control required"></div>
		           	</div>
		            <div class="hr-line-dashed"></div>
		            <div class="form-group">
						<label class="col-sm-2 control-label">페이지 타입</label>
						<div class="col-sm-10">
							<label class="checkbox-inline i-checks"> <input type="radio" value="1" name="page_type" > <i></i> 1단 </label>
                            <label class="checkbox-inline i-checks"> <input type="radio" value="2" name="page_type"> <i></i> 2단 </label>
                            <label class="checkbox-inline i-checks"> <input type="radio" value="3" name="page_type"> <i></i> 3단 </label>
						</div>
						<div class="row" style="padding-top:10px;">
							<label class="col-sm-2 control-label"></label>
							<div class="col-sm-10">
								
							</div>
						</div>
		           	</div>
				</div>
            </div>

            <div class="modal-footer">
            	참고 : 페이지 타입을 변경하시면 페이지가 초기화되어 모든 포틀릿이 제거 됩니다.
                <button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
                <button id="btnDelete" type="button" class="btn btn-danger">삭제</button>
                <button id="btnSave" type="button" class="btn btn-primary">저장</button>
            </div>
        </div>
    </div>
</div>

<!-- jqGrid -->
<script src="${imageServer}/js/plugins/jqGrid/jquery.jqGrid.min.js"></script>

<!-- iCheck -->
<script src="${imageServer}/js/plugins/iCheck/icheck.min.js"></script>

<script>
	/*
	 * functions
	 */
	 
	$.drawGrid = function() {
		$.ritusGrid({
			gridObject: '#page_list',
			url: "${pageContext.request.contextPath}/data/prv/pageList.rts",
            height: $.getGridHeight(),
            loadonce: false,
            rowNum: 100,
            page: 1,
            scroll: 1,
            colNames: ['PAGE_ID', '페이지 제목', '페이지 타입'],
            colModel: [
                    { name: 'PAGE_ID', key:true, hidden:true},
                    { name: 'PAGE_TITLE', width:200, format: 'string', sorttype: 'string'},
                    { name: 'PAGE_TYPE', width:100, format: 'string', sorttype: 'string'}
            ],
            sortname: 'PAGE_TITLE',
            sortorder: 'asc',
            pager: "#page_pager_list",
            onSelectRow: function(rowid, status, e) {
            	var PAGE_ID = $(this).jqGrid('getCell', rowid, 'PAGE_ID');
            	var PAGE_TITLE = $(this).jqGrid('getCell', rowid, 'PAGE_TITLE');
            	var PAGE_TYPE = $(this).jqGrid('getCell', rowid, 'PAGE_TYPE');

            	$('#detailModal #page_id').val(PAGE_ID);
            	$('#detailModal #page_title').val(PAGE_TITLE);
            	$('#detailModal input:radio[name=page_type][value=' + PAGE_TYPE + ']').prop('checked', true);
            	$('#detailModal #btnDelete').show();

            	$('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
            	
            	$('#detailModal').modal();
            }
		});
	};
	
	$.insertPage = function() {
    	var sendData = {
    		page_title : $('#detailModal #page_title').val(),
    		page_type : $('#detailModal input:radio[name=page_type]:checked').val()
    	};

    	if ( $.trim(sendData.page_title) == '' || $.trim(sendData.page_type) == '' ) {
    		alert("모든 항목을 입력해주세요.");
    		return;
    	}

    	$.ritusAjax({
    		url: '${pageContext.request.contextPath}/data/prv/createPage.rts',
    		data: sendData,
    		success: function(data) {
    			if ( data.result ) {
    				$('#detailModal').modal('toggle');
    				alert("페이지가 저장되었습니다.");
    				location.reload();
    				//$('#page_list').trigger('reloadGrid');
    			} else {
    				alert(data.message);
    			}
    		}
    	});
    };
    
    $.modifyPage = function() {
    	var sendData = {
    		page_id : $('#detailModal #page_id').val(),
    		page_title : $('#detailModal #page_title').val(),
    		page_type : $('#detailModal input:radio[name=page_type]:checked').val()
    	};

    	if ( $.trim(sendData.page_title) == '' || $.trim(sendData.page_type) == '' ) {
    		alert("모든 항목을 입력해주세요.");
    		return;
    	}

    	$.ritusAjax({
    		url: '${pageContext.request.contextPath}/data/prv/modifyPage.rts',
    		data: sendData,
    		success: function(data) {
    			if ( data.result ) {
    				$('#detailModal').modal('toggle');
    				alert("페이지가 저장되었습니다.");
    				location.reload();
    				//$('#page_list').trigger('reloadGrid');
    			} else {
    				alert(data.message);
    			}
    		}
    	});
    };

    $.deletePage = function() {
    	if ( confirm('삭제하시겠습니까?') ) {

        	$.ritusAjax({
        		url: '${pageContext.request.contextPath}/data/prv/deletePage.rts',
        		data: { page_id : $('#detailModal #page_id').val() },
        		success: function(data) {
        			if ( data.result ) {
        				$('#detailModal').modal('toggle');
        				alert("페이지가 삭제되었습니다.");
        				location.reload();
        				//$('#page_list').trigger('reloadGrid');
        			} else {
        				alert(data.message);
        			}
        		}
        	});

    	}
    };

    $.createPage = function() {
    	$('#detailModal #page_id').val('');
    	$('#detailModal #page_title').val('');
    	$('#detailModal input:radio[name=page_type][value=1]').prop('checked', true);
    	$('#detailModal #btnDelete').hide();
    	$('#detailModal #action').val('I');
    	
    	$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });

    	$('#detailModal').modal();
    };

</script>

<script>

    $(function() {
    	/* init */
    	$.drawGrid();
    	
    	/* buttons action */
    	$('#btnCreate').click($.createPage);
    	$('#btnDelete').click($.deletePage);
    	$('#btnSave').click(function() {
    		var action = $('#detailModal #action').val();
    		if ( action == 'I' ) $.insertPage();
    		else $.modifyPage();
    	});
    	
    	/* UI Setting */
    	$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    	
    	/* events */
   		$(window).bind('resize', function () {
    		 var width = $('.jqGrid_wrapper').width();
              $('#page_list').setGridWidth(width);
              $('#page_list').setGridHeight($.getGridHeight());
       	});
    });

</script>