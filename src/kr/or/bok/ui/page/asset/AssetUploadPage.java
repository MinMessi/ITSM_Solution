package kr.or.bok.ui.page.asset;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ritus.ui.page.IPage;
import ritus.ui.utils.ICSSPlugins;
import ritus.ui.utils.UseCSS;

/**
 *
 * <pre>
 *	자산 엑셀 업로드
 * </pre>
 *
 * @author Unipoint 이원혁 차장
 * @version 1.0
 *
 */
@Component("page.asset.assetupload")
public class AssetUploadPage implements IPage {

	@Override
	public ModelAndView invoke(Map<String, String> parameters, HttpServletRequest request, HttpServletResponse response,
			ModelAndView result) {

		String imageServer = (String) result.getModelMap().get("imageServer");

		//set CSS
		result.addObject("CSS", UseCSS.getCSS(imageServer,
				ICSSPlugins.jqGrid,
				ICSSPlugins.jQueryUI
		));

		//breadcrumb 설정
		String breadcrumb = "/자산관리/자산 엑셀 업로드";
		result.addObject("breadcrumb", breadcrumb.split("/"));

		return result;
	}

}
