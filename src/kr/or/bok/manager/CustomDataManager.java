package kr.or.bok.manager;

import java.io.File;
import java.io.FileInputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import ritus.common.CommonField;
import ritus.dao.vos.CategoryFieldVO;
import ritus.ui.data.excel.IColumnInfo;
import ritus.utils.LogUtil;

/**
 * <pre>
 * Custom 데이터 처리
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0
 *
 */
@Repository
public class CustomDataManager {

	/** 공통 로거 */
	private static final Logger logger = LoggerFactory.getLogger(CustomDataManager.class);

	/**
	 * <pre>
	 * 1. 개요 : 엑셀 데이터 변환
	 * 2. 처리내용 : 엑셀 파일을 읽어 JSON 데이터로 변환한다.
	 * </pre>
	 *
	 * @param fileFullPath					파일 전체 경로
	 * @param category_id				Ritus 카테고리 아이디
	 * @param isDeleteOriginalFile		원본 파일 삭제 여부
	 * @throws SQLException
	 */
	public JSONArray createJSONData(String fileFullPath, String category_id, boolean isDeleteOriginalFile) throws SQLException {
		File file = new File(fileFullPath);

		FileInputStream fis = null;
		XSSFWorkbook workbook = null;
		JSONArray root = new JSONArray();

		try {

			fis = new FileInputStream(file);
			workbook = new XSSFWorkbook(fis);
			XSSFSheet sheet = workbook.getSheetAt(0);

			int rows = sheet.getPhysicalNumberOfRows() + IColumnInfo.ROW_TEMPLATE_COUNT_BLANK;
			if ( rows < IColumnInfo.ROW_TEMPLATE_DATA ) {
				fis.close();

				LogUtil.printErrorBanner(logger, "rows " + rows);

				throw new SQLException("There is no data in ExcelFile");
			}

			LogUtil.printBanner(logger, "total rows " + rows);

			for ( int rowIndex=IColumnInfo.ROW_TEMPLATE_DATA; rowIndex<rows; rowIndex ++ ) {
				JSONObject json = new JSONObject();

				Map<String, String> parameters = new HashMap<>();
				XSSFRow fieldRow = sheet.getRow(IColumnInfo.ROW_TEMPLATE_FIELDNAME);
				XSSFRow dataRow = sheet.getRow(rowIndex);
				if ( dataRow != null && fieldRow != null ) {
					for ( int columnIndex=0; columnIndex<fieldRow.getPhysicalNumberOfCells(); columnIndex++ ) {
						XSSFCell fieldCell = fieldRow.getCell(columnIndex);
						XSSFCell dataCell = dataRow.getCell(columnIndex);

						String fieldName = fieldCell.getStringCellValue();
						CategoryFieldVO fieldVO = CommonField.getField(category_id, fieldName);

						try {
							switch (dataCell.getCellType()) {
					        	case XSSFCell.CELL_TYPE_NUMERIC:
					        		if( HSSFDateUtil.isCellDateFormatted(dataCell) ) { // 날짜
					        			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
					        			if( fieldVO.getField_type_name().equals("MONTH") )
					        				formatter = new SimpleDateFormat("yyyy-MM");

					        			json.put(fieldCell.getStringCellValue(), formatter.format(dataCell.getDateCellValue()));
					        		} else { // 숫자
					        			Double cellValue = dataCell.getNumericCellValue();
					        			json.put(fieldCell.getStringCellValue(), String.valueOf(cellValue.longValue()));
					        		}
					        		break;
					        	case XSSFCell.CELL_TYPE_STRING:
					        		json.put(fieldCell.getStringCellValue(), dataCell.getStringCellValue());
					        		break;
					        	case XSSFCell.CELL_TYPE_BLANK:
					        		json.put(fieldCell.getStringCellValue(), "");
					        		break;
					        	case XSSFCell.CELL_TYPE_ERROR:
					        		json.put(fieldCell.getStringCellValue(), "");
					        		break;
							}
						} catch(NullPointerException e) {
							parameters.put(fieldCell.getStringCellValue(), "");
						}
					}
					root.put(json);
				}
			}

		} catch(Exception e) {
			e.printStackTrace();
			throw new SQLException(e);
		} finally {
			try {
				fis.close();

				if ( isDeleteOriginalFile )
					file.delete();
			} catch(Exception e) {
				//what can i do?
			}
		}

		return root;
	}

}
