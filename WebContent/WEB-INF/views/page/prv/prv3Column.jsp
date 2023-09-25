<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<div class="row  border-bottom white-bg dashboard-header">
	<div class="col-md-12">
		<button id="btnCreate" type="button" class="btn btn-w-m btn-default">포틀릿 관리</button>
	</div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-md-4">
			<c:choose>
				<c:when test="${empty col1List}">
				</c:when>
				<c:otherwise>
						<c:forEach items="${col1List}" var="item">
							<div class="row" style="padding:0px 5px;">
								<div class="ibox">
									<div class="ibox-title">
										${item.portlet_title}
									</div>
									<div class="ibox-content">
										${item.html_sources}
									</div>
								</div>
							</div>
  						</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="col-md-4">
			<c:choose>
				<c:when test="${empty col2List}">
				</c:when>
				<c:otherwise>
						<c:forEach items="${col2List}" var="item">
							<div class="row" style="padding:0px 5px;">
								<div class="ibox">
									<div class="ibox-title">
										${item.portlet_title}
									</div>
									<div class="ibox-content">
										${item.html_sources}
									</div>
								</div>
							</div>
  						</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="col-md-4">
			<c:choose>
				<c:when test="${empty col3List}">
				</c:when>
				<c:otherwise>
						<c:forEach items="${col3List}" var="item">
							<div class="row" style="padding:0px 5px;">
								<div class="ibox">
									<div class="ibox-title">
										${item.portlet_title}
									</div>
									<div class="ibox-content">
										${item.html_sources}
									</div>
								</div>
							</div>
  						</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
  	</div>
</div>

<div class="modal inmodal fade" id="detailModal" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">페이지 생성</h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
		        	<div class="row">
		        		<div class="col-md-3">
		        		
			        			<div class="dd" id="nestable">
		        					<c:choose>
		        						<c:when test="${empty noSelectList}">
		        							<ol class="dd-empty"></ol>
		        						</c:when>
		        						<c:otherwise>
		        							<ol class="dd-list">
			        							<c:forEach items="${noSelectList}" var="item">
						        					<li class="dd-item" data-id="${item.portlet_id}">
				                                        <div class="dd-handle">${item.portlet_title}</div>
				                                    </li>
						        				</c:forEach>
					        				</ol>
		        						</c:otherwise>
		        					</c:choose>
	                            </div>
		        			
		        		</div>
		        		<div class="col-md-9">
		        			<div class="row white-bg" style="padding:10px 0px">
		        				<div class="col-sm-4">
		        					<div class="dd" id="column1">
		        						<c:choose>
			        						<c:when test="${empty col1List}">
			        							<ol class="dd-empty"></ol>
			        						</c:when>
			        						<c:otherwise>
			        							<ol class="dd-list">
				        							<c:forEach items="${col1List}" var="item">
							        					<li class="dd-item" data-id="${item.portlet_id}">
					                                        <div class="dd-handle">${item.portlet_title}</div>
					                                    </li>
							        				</c:forEach>
						        				</ol>
			        						</c:otherwise>
			        					</c:choose>
		        					</div>
		        				</div>
		        				<div class="col-sm-4">
		        					<div class="dd" id="column2">
		        						<c:choose>
			        						<c:when test="${empty col2List}">
			        							<ol class="dd-empty"></ol>
			        						</c:when>
			        						<c:otherwise>
			        							<ol class="dd-list">
				        							<c:forEach items="${col2List}" var="item">
							        					<li class="dd-item" data-id="${item.portlet_id}">
					                                        <div class="dd-handle">${item.portlet_title}</div>
					                                    </li>
							        				</c:forEach>
						        				</ol>
			        						</c:otherwise>
			        					</c:choose>
		        					</div>
		        				</div>
		        				<div class="col-sm-4">
		        					<div class="dd" id="column3">
		        						<c:choose>
			        						<c:when test="${empty col3List}">
			        							<ol class="dd-empty"></ol>
			        						</c:when>
			        						<c:otherwise>
			        							<ol class="dd-list">
				        							<c:forEach items="${col3List}" var="item">
							        					<li class="dd-item" data-id="${item.portlet_id}">
					                                        <div class="dd-handle">${item.portlet_title}</div>
					                                    </li>
							        				</c:forEach>
						        				</ol>
			        						</c:otherwise>
			        					</c:choose>
		        					</div>
		        				</div>
		        			</div>
		        		</div>
		        	</div>
				</div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
                <button id="btnSave" type="button" class="btn btn-primary">저장</button>
            </div>
        </div>
    </div>
</div>

<style>
	.dd-empty {
		min-height: 32px;
	}
</style>

<!-- jqGrid -->
<script src="${imageServer}/js/plugins/jqGrid/jquery.jqGrid.min.js"></script>

<!-- iCheck -->
<script src="${imageServer}/js/plugins/iCheck/icheck.min.js"></script>

<!-- Nestable List -->
<script src="${imageServer}/js/plugins/nestable/jquery.nestable.js"></script>

<script>

	$.page_id = ${page_id};

</script>


<script>
	/*
	 * functions
	 */
	
	$.insertPage = function() {
		var col1 = $('#column1').nestable('serialize');
		var col2 = $('#column2').nestable('serialize');
		var col3 = $('#column3').nestable('serialize');
		
		var cols = [ col1, col2, col3 ];
		
		var sendData = {
				page_id : $.page_id,
				cols : JSON.stringify(cols)
		};

    	$.ritusAjax({
    		url: '${pageContext.request.contextPath}/data/prv/placePortlet.rts',
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
    	$('#nestable').nestable({
        	group: 1,
        	maxDepth: 1
        });
    	
    	$('#column1').nestable({
        	group: 1,
        	maxDepth: 1
        });
    	
    	$('#column2').nestable({
        	group: 1,
        	maxDepth: 1
        });
    	
    	$('#column3').nestable({
        	group: 1,
        	maxDepth: 1
        });

    	/* buttons action */
    	$('#btnCreate').click($.createPage);
    	$('#btnSave').click(function() {
    		$.insertPage();
    	});
    	
    	/* UI Setting */
    	$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    	
    	/* events */
   		$(window).bind('resize', function () {
       	});
    });

</script>