<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>

<div class="row  border-bottom white-bg dashboard-header">
	<div class="col-md-12">
		<div class="text-right">
			<button id="btnDataUpload" type="button" class="btn btn-w-m btn-success">엑셀업로드</button>
			<button id="btnDataSave" type="button" class="btn btn-w-m btn-primary" style="display:none;">데이터 저장</button>
			<button id="btnDataCancle" type="button" class="btn btn-w-m btn-danger" style="display:none;">취소</button>
			<button id="btnTemplateDownload" type="button" class="btn btn-w-m btn-warning">양식 다운로드</button>
		</div>
	</div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<!-- div class="col-md-12 text-warning">필수입력 필드입니다.</div -->
 		<div class="col-md-12">
 			<div class="jqGrid_wrapper">
	             <table id="upload_list"></table>
	             <div id="upload_pager_list"></div>
	        </div>
  		</div>
  	</div>
</div>

<form id="uploadForm" enctype="multipart/form-data">
	<input type="file" id="uploadFile" accept=".xlsx" style="display:none;"/>
</form>

<style>
	 .ui-jqgrid .ui-jqgrid-htable th div {
		height: auto;
		overflow: hidden;
		padding-right: 2px;
		padding-left: 2px;
		padding-top: 4px;
		padding-bottom: 4px;
		position: relative;
		vertical-align: text-top;
	}

	.ui-jqgrid tr.jqgrow td {
		padding : 2px;
		height: 32px;
	}

	#upload_list tbody input {
		width: 90%;
		height: 98%;
		text-align : center;
		font-size: 13px;
	}
</style>

<!-- jqGrid -->
<script src="${imageServer}/js/plugins/jqGrid/jquery.jqGrid.min.js"></script>

<!-- Input mask -->
<script src="${imageServer}/js/plugins/inputmask/jquery.inputmask.bundle.min.js"></script>

<script>
	$.requiredField = [ 'AST_NAME', 'AST_PRNT_CD' ];
	$.uploadFields = [ 'AST_ID', 'AST_ACCOUNT_UNIT', 'AST_ACCOUNT_UNIT_NAME', 'AST_TYPE', 'AST_TYPE_NAME',
							'AST_MANAGE_NUM', 'AST_PRNT_CD', 'AST_STATUS_CD', 'AST_SYSTEM_ID', 'AST_NAME',
							'AST_WORK_USE', 'AST_MANAGER', 'AST_MANAGE_TEAM', 'AST_PRODUCT_COMPANY',
							'AST_PRODUCT_NAME', 'AST_DEP_COM_STATUS', 'AST_DISPOSAL_TYPE', 'AST_DISPOSAL_DATE',
							'AST_GET_DATE', 'AST_GET_MOD_DATE', 'AST_CONNECT_STATUS' ];

	//jqGridInlineAfterRestoreRow
	$.lastSelection;
	$.editRow = function(id, icol, cellcontent, e) {
		if ( id && id != $.lastSelection ) {
			var grid = $('#upload_list');
			grid.jqGrid('restoreRow', $.lastSelection);
			grid.jqGrid('editRow', id, {keys:true});

			$.lastSelection = id;

			$('input[name=AST_DISPOSAL_DATE]').attr('data-inputmask', "'alias': 'yyyy-mm-dd'");
			$('input[name=AST_GET_DATE]').attr('data-inputmask', "'alias': 'yyyy-mm-dd'");
			$('input[name=AST_GET_MOD_DATE]').attr('data-inputmask', "'alias': 'yyyy-mm-dd'");
			$('input[name=AST_CONNECT_STATUS]').attr('data-inputmask', "'mask': '9'");
			$('input[name=AST_DEP_COM_STATUS]').attr('data-inputmask', "'mask': '9'");

			$(':input').inputmask();
			$('.ui-jqgrid input').addClass('form-control');
			$('.ui-jqgrid input').css('padding', '0px');
			//$('.ui-jqgrid input').css('background', '#e5e6e7');
		}
	};

	$.loadGrid = function(category_id) {
		//1. field 항목 조회
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/data/manage/field/fieldList.rts',
			type: 'POST',
			cash: false,
			timeout: 30000,
			dataType: "JSON",
			data: {
				category_id: category_id, 
				sidx: 'FIELD_UI_ORDER',
				rows: 100
			},
			success: function(data) {
				var colNames = [];
				var colModels = [];

				for ( var i=0; i<data.rows.length; i++ ) {
					if ( data.rows[i].field_type_name != 'CATEGORY' ) {
						var field_name = data.rows[i].field_name;
						var field_kor_name = data.rows[i].field_kor_name;
						
						if ( $.uploadFields.indexOf(field_name) >= 0 ) {

							if ( $.requiredField.indexOf(field_name) >= 0 )
								field_kor_name = "<span class='text-warning' title='필수 사항입니다.'>" + field_kor_name + "</span>";
	
							colNames.push(field_kor_name);
							
							if ( field_name == 'AST_ID' )
								colModels.push( { name: field_name, hidden:true } );
							else {
		    					colModels.push( {
		    						name: field_name,
		    						width:100,
		    						editable: true,
		    						edittype: 'text'
		    					} );
							}
							
						}
					}
				}

				$("#upload_list").GridUnload();
				$("#upload_list").jqGrid({
		            datatype: "local",
		            height: $.getGridHeight(110),
		            colNames: colNames,
					colModel: colModels,
		            autowidth: true,
		            shrinkToFit: false,
		            viewrecords: true,
		            hidegrid: false,
		            pager: "#upload_pager_list",
		            editurl: 'clientArray',
		            onCellSelect: $.editRow
		        }).trigger("reloadGrid");

				$('#upload_list').bind('jqGridInlineAfterSaveRow', function(e, rowid, orgClickEvent) {
					$.lastSelection = null;
				});
			}
		});
	};

	$.templateDownload = function() {
		location.href = '${pageContext.request.contextPath}/data/downloadAssetTemplate.rts';
	};

	$.dataUpload = function() {
		$('#uploadFile').click();
	};

	$.uploadExcelFile = function() {
		waitingDialog.show('업로드중입니다.');
		if ( $('#uploadFile').val() == '' ) return;

		var form = document.getElementById("uploadForm");
		form.enctype = 'multipart/form-data';

		var formData = new FormData(form);
		formData.append('category_id', 'AST00001');
		formData.append('fileObj', $('#uploadFile')[0].files[0]);

		$.ajax({
			url: '${pageContext.request.contextPath}/data/excelUploadAsset.rts',
			processData : false,
			contentType : false,
			data: formData,
			type: 'POST',
			success: function(data) {
				setTimeout('waitingDialog.hide()', 600);
				$('#uploadFile').val('');

				var json = eval(data.message);

				if ( data.result ) {
					$("#upload_list").jqGrid('setGridParam', {
						rowNum: json.length,
			            rowList: [json.length],
						data: json
					}).trigger("reloadGrid");

					$('#btnDataUpload').hide();
					$('#btnDataSave').show();
					$('#btnDataCancle').show();
				}
			}
		});

	};

	$.saveData = function() {
		waitingDialog.show('저장중입니다.');

		var data = $('#upload_list').jqGrid('getRowData');
		for (var i=0; i<data.length; i++ )
			$('#upload_list').jqGrid('saveRow', i+1);

		data = $('#upload_list').jqGrid('getRowData');

		var isOK = true;
		for ( var i=0; i<data.length; i++ ) {
			$.each(data[i], function(key, value) {
				if ( $.requiredField.indexOf(key) > 0 ) {
					if ( value == null || typeof value == 'undefined' || $.trim(value) == '' ) {
						alert('필수 항목을 입력해주세요.');
						isOK = false;
						return false;
					}
				}
			});
		}

		if ( !isOK ) {
			waitingDialog.hide();
			return;
		}

		$.ritusAjax({
			url: '${pageContext.request.contextPath}/data/asset/assetExcelSave.rts',
			data: { data: JSON.stringify(data) },
			timeout : 3600000,
			success: function(returnData) {
				waitingDialog.hide();
				if ( returnData.result ) {
					alert('데이터를 저장하였습니다.');
					$('#btnDataUpload').show();
					$('#btnDataSave').hide();
					$('#btnDataCancle').hide();
				} else
					alert('오류가 발생하여 데이터를 저장하지 못하였습니다.');
			}
		});
	};
</script>

<script>

    $(function() {
    	$.loadGrid('AST00001');

    	$('#btnTemplateDownload').click(function() {
    		$.templateDownload();
    	});

    	$('#btnDataUpload').click(function() {
    		$.dataUpload();
    	});

    	$('#btnDataSave').click(function() {
    		$.saveData();
    	});

    	$('#btnDataCancle').click(function() {
    		$.alertConfirm(
        			'데이터 저장 취소',
        			'저장되지 않은 데이터는 모두 제거됩니다',
        			'데이터 저장이 취소되었습니다.',
        			function() {
        				$("#upload_list").jqGrid('clearGridData');

        				$('#btnDataUpload').show();
        	    		$('#btnDataSave').hide();
        	    		$('#btnDataCancle').hide();
        			}
			);
    	});

    	$('#uploadFile').on("change", function() {
    		$.uploadExcelFile();
    	});

   		$(window).bind('resize', function () {
    		 var width = $('.jqGrid_wrapper').width();
              $('#upload_list').setGridWidth(width);
              $('#upload_list').setGridHeight($.getGridHeight(110));
       	});

   		$(window).on('beforeunload', function() {
   			if ( $('#btnDataSave').css('display') != 'none' )
   				return "데이터가 저장되지 않았습니다.";
   		});

    });

</script>