package kr.or.bok.ui.data.asset;

import java.io.ByteArrayOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.AbstractView;

import ritus.dao.vos.CategoryFieldVO;
import ritus.ui.data.excel.IColumnInfo;

/**
 *
 * <pre>
 *	인력 업로드용 양식 Excel 생성
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0
 *
 */
@Service
public class ExcelXlsxTemplate extends AbstractView {

	/** Type of content */
	private static final String CONTENT_TYPE = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

	/**
	 * Default constructor
	 */
	public ExcelXlsxTemplate() {
		setContentType(CONTENT_TYPE);
	}

	/**
	 *
	 * <pre>
	 * 1. 개요 : Excel 생성
	 * 2. 처리내용 : Excel 데이터를 생성한다.
	 * </pre>
	 *
	 * @param model			Spring model 객체
	 * @param request			HttpServletRequest
	 * @param response		HttpServletResponse
	 * @throws Exception
	 */
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		try {
			XSSFWorkbook workbook = new XSSFWorkbook();
			XSSFSheet sheet = (XSSFSheet) workbook.createSheet("template");

			@SuppressWarnings("unchecked")
			List<CategoryFieldVO> fieldInfo = (List<CategoryFieldVO>)model.get("fieldInfo");

			String excelName = String.valueOf(model.get("fileName"));

			XSSFCellStyle blueBoldCell = workbook.createCellStyle();
			XSSFFont font = workbook.createFont();
			font.setColor(IndexedColors.BLUE.getIndex());
			font.setBold(true);
			blueBoldCell.setFont(font);
			blueBoldCell.setAlignment(CellStyle.ALIGN_CENTER);

			XSSFRow titleInEng = sheet.createRow(IColumnInfo.ROW_TEMPLATE_FIELDNAME);
			XSSFRow titleInKor = sheet.createRow(IColumnInfo.ROW_TEMPLATE_FIELDKORNAME);

			for ( int i=0; i<fieldInfo.size(); i++ ) {
				CategoryFieldVO field = fieldInfo.get(i);

				XSSFCell engCell = titleInEng.createCell(i);
				XSSFCell korCell = titleInKor.createCell(i);

				engCell.setCellValue(field.getField_name());
				korCell.setCellValue(field.getField_kor_name());

				korCell.setCellStyle(blueBoldCell);
			}

			sheet.createFreezePane(0, IColumnInfo.ROW_TEMPLATE_DATA);

			for ( int i=0; i<titleInKor.getLastCellNum(); i++ ) {
				sheet.autoSizeColumn(i);
				sheet.setColumnWidth(i, sheet.getColumnWidth(i)+1024);
			}

			//sheet.setActiveCell("A4");

			response.setContentType(CONTENT_TYPE);
			response.setHeader("Content-Disposition", "Attachement; Filename=" + excelName + "-excel.xlsx");

			ByteArrayOutputStream os= createTemporaryOutputStream();
			workbook.write(os);

			writeToResponse(response, os);

			if ( os != null ) os.close();
		} catch(Exception e) {
			throw e;
		}

	}

	/**
	 *
	 * <pre>
	 * 1. 개요 : 제한 컬럼
	 * 2. 처리내용 : 제한된 컬럼을 확인한다.
	 * </pre>
	 *
	 * @param field
	 * @return
	 */
	public static boolean enableColumn(CategoryFieldVO field) {
		Map<String, Integer> enabledMap = new HashMap<>();
		
		//enabledMap.put("AST_ID", 1);
		enabledMap.put("AST_ACCOUNT_UNIT", 1);
		enabledMap.put("AST_ACCOUNT_UNIT_NAME", 1);
		enabledMap.put("AST_TYPE", 1);
		enabledMap.put("AST_TYPE_NAME", 1);
		enabledMap.put("AST_MANAGE_NUM", 1);
		enabledMap.put("AST_PRNT_CD", 1);
		enabledMap.put("AST_STATUS_CD", 1);
		enabledMap.put("AST_SYSTEM_ID", 1);
		enabledMap.put("AST_NAME", 1);
		enabledMap.put("AST_WORK_USE", 1);
		enabledMap.put("AST_MANAGER", 1);
		enabledMap.put("AST_MANAGE_TEAM", 1);
		enabledMap.put("AST_PRODUCT_COMPANY", 1);
		enabledMap.put("AST_PRODUCT_NAME", 1);
		enabledMap.put("AST_DEP_COM_STATUS", 1);
		enabledMap.put("AST_DISPOSAL_TYPE", 1);
		enabledMap.put("AST_DISPOSAL_DATE", 1);
		enabledMap.put("AST_GET_DATE", 1);
		enabledMap.put("AST_GET_MOD_DATE", 1);
		enabledMap.put("AST_CONNECT_STATUS", 1);

		if ( enabledMap.get(field.getField_name()) == null ) return false;

		return true;
	}

}
