/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.sample.web;

import java.util.List;

import egovframework.example.sample.service.DepService;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.DepVO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springmodules.validation.commons.DefaultBeanValidator;

/**
 * @Class Name : EgovSampleController.java
 * @Description : EgovSample Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class ChartController {

	/** EgovSampleService */
	@Resource(name = "depService")
	private DepService depService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * 차트 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/DepChart.do")
	public String selectDepChart(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model, DepVO depVO) throws Exception {

		
		
		/** EgovPropertyService. */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> depList = depService.selectDepChart(searchVO);
		model.addAttribute("resultList", depList);

		int totCnt = depService.selectDepChartTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		/*상위부서와 하위부서 출력을 위해*/
		
		List<?> updeList = depService.updeList();
		System.out.println("updeList===="+updeList);
		model.addAttribute("updeList",updeList);
		
		
		System.out.println("depVO============"+depVO);
		List<?> dodeList = depService.dodeList(depVO);
		model.addAttribute("dodeList",dodeList);
		System.out.println("dodeList===="+dodeList);
		
		return "deppos/DepChart";
	}

	
	
	@RequestMapping(value = "/OnlyDepChart.do")
	public String selectOnlyDepChart(ModelMap model, DepVO depVO) throws Exception {
		
		/*for(int 0; i<sitemap.size(); i) {
			System.out.pringln("1>>"sitemap.get(i).getMenuMn())
		}*/

		/*상위부서와 하위부서 출력을 위해*/
		
		List<?> updeList = depService.updeList();
		System.out.println("updeList===="+updeList);
		model.addAttribute("updeList",updeList);
		
		
		System.out.println("depVO============"+depVO);
		List<?> dodeList = depService.dodeList(depVO);
		model.addAttribute("dodeList",dodeList);
		System.out.println("dodeList===="+dodeList);
		
		
		List<?> chartList = depService.chartList();
		model.addAttribute("chartList",chartList);
		System.out.println("chartList===="+chartList);
		
		
		List<?> onechartList = depService.onechartList();
		model.addAttribute("onechartList", onechartList);
		System.out.println("onechartList===="+onechartList);
		
		return "deppos/OnlyDepChart";
	}
	
	
	
	@RequestMapping("/OpenDepChart.do")
	public String updateDepView(@RequestParam("selectedId") String id, Model model) throws Exception {
		System.out.println("OpenDepChart에 들어왔다.");
		DepVO depVO = new DepVO();
		depVO.setDepCode(id);
		// 변수명은 CoC 에 따라 depVO
		model.addAttribute(selectDode(depVO, model));
		return "deppos/OnlyDepChart";
	}
	
	
	public DepVO selectDode(DepVO depVO, Model model) throws Exception {
		System.out.println("selectDode에 들어왔다.");
		model.addAttribute("depVO", depVO);
	
		List<?> updeList = depService.updeList();
		System.out.println("updeList===="+updeList);
		model.addAttribute("updeList",updeList);

		System.out.println("depVO============"+depVO);
		List<?> dodeList = depService.dodeList(depVO);
		model.addAttribute("dodeList",dodeList);
		System.out.println("dodeList===="+dodeList);

		
		
		return depService.selectDep(depVO);
	}
	
	/**
	 * DepChart 화면을 조회한다.
	 */
	@RequestMapping(value = "/ChartFrame.do")
	public String selectChartFrame(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {
		model.addAttribute("depVO", new DepVO());
		
		System.out.println("ChartFrame.do에 들어왔다.");
		
		
		return "deppos/ChartFrame";
	}
	
	
	
	/**
	 * whois.jsp를 조회한다.
	 */
	@RequestMapping(value = "/whois.do")
	public String selectWhoList(ModelMap model, DepVO depVO) throws Exception {
		
		List<?> whoisList = depService.whoisList(depVO);
		System.out.println("whoisList===="+whoisList);
		model.addAttribute("whoisList",whoisList);
		
		
		
		return "deppos/whois";
	}
	
	@RequestMapping(value = "/spec.do")
	public String selectSpecList(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {
		model.addAttribute("depVO", new DepVO());
				
		return "deppos/spec";
	}
	
	
	@RequestMapping(value = "/OnlyMenu.do")
	public String selectmenuList(DepVO depVO, ModelMap model) throws Exception {

				
		return "deppos/OnlyMenu";
	}
	
	
	
	/*Chart.do는 실험체*/
	@RequestMapping(value = "/Chart.do")
	public String selectchart(ModelMap model,DepVO depVO) throws Exception {
		
		
		
		List<?> updeList = depService.updeList();
		System.out.println("updeList===="+updeList);
		model.addAttribute("updeList",updeList);
		
		
		System.out.println("depVO============"+depVO);
		List<?> dodeList = depService.dodeList(depVO);
		model.addAttribute("dodeList",dodeList);
		System.out.println("dodeList===="+dodeList);
		
		
		List<?> chartList = depService.chartList();
		model.addAttribute("chartList",chartList);
		System.out.println("chartList===="+chartList);
		
		
		List<?> onechartList = depService.onechartList();
		model.addAttribute("onechartList", onechartList);
		System.out.println("onechartList===="+onechartList);
				
		return "deppos/Chart";
	}
	

	

}