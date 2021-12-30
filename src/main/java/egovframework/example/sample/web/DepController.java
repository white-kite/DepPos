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
public class DepController {

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
	 * 글 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SampleDefaultVO
	 * @param model
	 * @return "egovSampleList"
	 * @exception Exception
	 */
	@RequestMapping(value = "/DepList.do")
	public String selectDepList(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {

		
		
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

		List<?> depList = depService.selectDepList(searchVO);
		model.addAttribute("resultList", depList);

		int totCnt = depService.selectDepListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "deppos/DepList";
	}

	/**
	 * 글 등록 화면을 조회한다.
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addDep.do", method = RequestMethod.GET)
	public String addDepView(@ModelAttribute("searchVO") SampleDefaultVO searchVO, Model model) throws Exception {
		model.addAttribute("depVO", new DepVO());
		
		System.out.println("addDep.do에 GET에 들어왔다.");
		
		List<?> catchDepList = depService.catchDepList();
		System.out.println("catchDepList===="+catchDepList);
		model.addAttribute("catchDepList", catchDepList);
		
		return "deppos/DepRegister";
	}

	/**
	 * 글을 등록한다.
	 * @param VO - 등록할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovDepList.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addDep.do", method = RequestMethod.POST)
	public String addDep(@ModelAttribute("searchVO") SampleDefaultVO searchVO, DepVO depVO, BindingResult bindingResult, Model model, SessionStatus status)
			throws Exception {
		System.out.println("addDep.do에 POST에 들어왔다.");
		// Server-Side Validation
		beanValidator.validate(depVO, bindingResult);

		List<?> catchDepList = depService.catchDepList();
		System.out.println("catchDepList===="+catchDepList);
		model.addAttribute("catchDepList", catchDepList);
		
		System.err.println("catchDepList===="+catchDepList.size());
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("depVO", depVO);
			return "deppos/DepRegister";
		}

		
		
		depService.insertDep(depVO);
		status.setComplete();
		return "deppos/DepRegister";
		/*return "forward:/DepList.do";*/
	}

	/**
	 * 글 수정화면을 조회한다.
	 * @param id - 수정할 글 id
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping("/updateDepView.do")
	public String updateDepView(@RequestParam("selectedId") String id, @ModelAttribute("searchVO") SampleDefaultVO searchVO, Model model) throws Exception {
		DepVO depVO = new DepVO();
		depVO.setDepCode(id);
		// 변수명은 CoC 에 따라 depVO
		model.addAttribute(selectDep(depVO, searchVO, model));
		return "deppos/DepRegister";
	}

	/**
	 * 글을 조회한다.
	 * @param depVO - 조회할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return @ModelAttribute("depVO") - 조회한 정보
	 * @exception Exception
	 */
	public DepVO selectDep(DepVO depVO, @ModelAttribute("searchVO") SampleDefaultVO searchVO, Model model) throws Exception {
		System.out.print("selectDepVO에 들어왔다.");
		model.addAttribute("depVO", depVO);
	
		List<?> catchDepList = depService.catchDepList();
		System.out.println("catchDepList===="+catchDepList);
		model.addAttribute("catchDepList", catchDepList);
		
		System.err.println("catchDepList===="+catchDepList.size());

		
		
		return depService.selectDep(depVO);
	}

	/**
	 * 글을 수정한다.
	 * @param depVO - 수정할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/DepList.do"
	 * @exception Exception
	 */
	@RequestMapping("/updateDep.do")
	public String updateDep(@ModelAttribute("searchVO") SampleDefaultVO searchVO, DepVO depVO, BindingResult bindingResult, Model model, SessionStatus status)
			throws Exception {

		beanValidator.validate(depVO, bindingResult);
		
		List<?> catchDepList = depService.catchDepList();
		model.addAttribute("catchDepList", catchDepList);
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("depVO", depVO);
			return "deppos/DepRegister";
		}

		depService.updateDep(depVO);
		status.setComplete();
		return "deppos/DepRegister";
		/*return "forward:/DepList.do";*/
	}

	/**
	 * 글을 삭제한다.
	 * @param depVO - 삭제할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping("/deleteDep.do")
	public String deleteDep(DepVO depVO, @ModelAttribute("searchVO") SampleDefaultVO searchVO, SessionStatus status) throws Exception {
		depService.deleteDep(depVO);
		status.setComplete();
		return "deppos/DepRegister";
		/*return "forward:/DepList.do";*/
	}

}