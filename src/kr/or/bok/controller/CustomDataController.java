package kr.or.bok.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.or.bok.manager.CustomDataManager;
import kr.or.bok.ui.data.asset.ExcelXlsxTemplate;
import ritus.dao.services.FieldService;
import ritus.dao.vos.CategoryFieldVO;
import ritus.dao.vos.LoginUserVO;
import ritus.sso.SSO;
import ritus.ui.utils.ReturnMessage;
import ritus.utils.CalendarUtil;
import ritus.utils.LogUtil;
import ritus.utils.StringUtil;

/**
 *
 * <pre>
 * 	Custom 데이터 처리 컨트롤러
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0
 *
 */
@Controller
public class CustomDataController {

	/** 필드 조회 DAO */
	@Autowired
	private FieldService fieldService;
	
	@Autowired
	private CustomDataManager dataManager;

	/** 공통 로거 */
	private static final Logger logger = LoggerFactory.getLogger(CustomDataController.class);

	/*
	 * Upload 위치 설정
	 */
	@Value("${ritus.upload.path}")
	private String uploadPath;

	/**
	 * <pre>
	 * 1. 개요 : 자산 입력 양식 엑셀 다운로드
	 * 2. 처리내용 : 엑셀 다운로드 처리
	 * </pre>
	 *
	 * @param result				ModelAndView
	 * @param map					Spring에서 변환 된 HttpServletRequest 내의 파라미터
	 * @param request				HttpServletRequest
	 * @param response			HttpServletResponse
	 * @return 	ModelAndView
	 */
	@RequestMapping(value = "/data/downloadAssetTemplate")
	public ModelAndView itoTemplateDownload( ModelAndView result, Map<String, String> map, HttpServletRequest request, HttpServletResponse response ) {
		List<CategoryFieldVO> fieldInfo = null;

		LoginUserVO userVO = SSO.check(request);
		if ( userVO == null ) {
			result.setViewName("page/error/403");
			return result;
		}

		String category_id = StringUtil.getData(request.getParameter("cid"), "AST00001");
		String fileName = "Asset_template";

		fieldInfo = fieldService.selectCategoryFieldAll(category_id);
		if ( fieldInfo == null ) {
			result.setViewName("page/error/404");
			return result;
		}

		List<CategoryFieldVO> newFieldInfo = new ArrayList<>();
		for ( CategoryFieldVO fieldVO : fieldInfo ) {
			if ( ExcelXlsxTemplate.enableColumn(fieldVO) )
				newFieldInfo.add(fieldVO);
		}

		ModelMap modelMap = result.getModelMap();
		modelMap.put("fileName", fileName);
		modelMap.put("fieldInfo", newFieldInfo);

		result.setView(new ExcelXlsxTemplate());

		return result;
	}

	/**
	 *
	 * <pre>
	 * 1. 개요 : 자산 외주인력 엑셀 업로드
	 * 2. 처리내용 : ITO 외주인력 정보 엑셀 업로드
	 * </pre>
	 *
	 * @param map					Spring에서 변환 된 HttpServletRequest 내의 파라미터
	 * @param request				HttpServletRequest
	 * @param response			HttpServletResponse
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/data/excelUploadAsset")
	public @ResponseBody String excelUploadITO(@RequestParam Map<String, String> map, HttpServletRequest request, HttpServletResponse response) {
		ReturnMessage rm = new ReturnMessage(true, "업로드 하였습니다.");

		LoginUserVO userVO = SSO.check(request);
		if ( userVO == null ) {
			rm.set(false, "403, 허가받지 않은 사용자입니다.");
			return rm.toJSONString();
		}

		MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
		String category_id = StringUtil.getData(map.get("category_id"), "AST00001");

		List<String> fileNames = this.uploadExcelFile(mRequest);

		for ( String fileName : fileNames ) {
			try {
				//1. JSON 데이터 생성
				JSONArray jsonArray = dataManager.createJSONData(fileName, category_id, true);
				rm.setMessage(jsonArray.toString());
			} catch(SQLException e) {
				e.printStackTrace();
				LogUtil.printErrorBanner(logger, fileName + " failed");
				rm.setResult(false);
				rm.setMessage("업로드를 실패하였습니다.");
				e.printStackTrace();
			} catch(Exception e) {
				e.printStackTrace();
				LogUtil.printErrorBanner(logger, fileName + " failed");
				rm.setResult(false);
				rm.setMessage("업로드를 실패하였습니다.");
				e.printStackTrace();
			}
		}

		return rm.toJSONString();
	}

	/**
	 * <pre>
	 * 1. 개요 : 엑셀 업로드
	 * 2. 처리내용 : 엑셀 업로드 처리
	 * </pre>
	 *
	 * @param request				MultipartHttpServletRequest
	 * @return 업로드 된 파일명 리스트
	 */
	private List<String> uploadExcelFile(MultipartHttpServletRequest request) {
		List<String> uploadedFileNames = new ArrayList<>();

		String uploadPath = getUploadPath();

		Iterator<String> fileNames = request.getFileNames();
		while( fileNames.hasNext() ) {
			String uploadFileName = fileNames.next();
			MultipartFile mFile = request.getFile(uploadFileName);
			String fileName = mFile.getOriginalFilename();

			if ( fileName != null && !fileName.equals("") ) {
				File file = null;
				try {
					String newFileName = UUID.randomUUID().toString();
					file = new File(uploadPath + newFileName);
					mFile.transferTo(file);

					uploadedFileNames.add(uploadPath + newFileName);
				} catch(Exception e) {
					e.printStackTrace();
				} finally {
					//if ( file != null && file.exists() )
						//file.delete();
				}
			}
		}

		return uploadedFileNames;
	}

	/**
	 * <pre>
	 * 1. 개요 : 업로드 위치 생성
	 * 2. 처리내용 : 파일 업로드 위치 생성 및 반환
	 * - 업로드 날짜를 비교하여 (기본업로드 위치)/(해당년도)/(해당월) 을 반환
	 * </pre>
	 *
	 * @return 파일 업로드 위치
	 */
	private String getUploadPath() {
		String uploadPath = this.uploadPath;
		String yyyy = CalendarUtil.getToday("yyyy");
		String mm = CalendarUtil.getToday("MM");

		uploadPath = uploadPath + yyyy + File.separator + mm + File.separator;

		File dir = new File(uploadPath);
		if ( !dir.isDirectory() )
			dir.mkdirs();

		return uploadPath;
	}

}
