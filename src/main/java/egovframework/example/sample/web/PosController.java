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

import egovframework.example.sample.service.PosService;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.PosVO;

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
public class PosController {

	/** EgovSampleService */
	@Resource(name = "posService")
	private PosService posService;

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
	@RequestMapping(value = "/PosList.do")
	public String selectPosList(@ModelAttribute("searchVO") SampleDefaultVO searchVO, ModelMap model) throws Exception {

		
		
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

		List<?> posList = posService.selectPosList(searchVO);
		model.addAttribute("resultList", posList);

		int totCnt = posService.selectPosListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "deppos/PosList";
	}

	/**
	 * 글 등록 화면을 조회한다.
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addPos.do", method = RequestMethod.GET)
	public String addPosView(@ModelAttribute("searchVO") SampleDefaultVO searchVO, Model model) throws Exception {
		model.addAttribute("posVO", new PosVO());
		return "deppos/PosRegister";
	}

	/**
	 * 글을 등록한다.
	 * @param VO - 등록할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovPosList.do"
	 * @exception Exception
	 */
	@RequestMapping(value = "/addPos.do", method = RequestMethod.POST)
	public String addPos(@ModelAttribute("searchVO") SampleDefaultVO searchVO, PosVO posVO, BindingResult bindingResult, Model model, SessionStatus status)
			throws Exception {

		// Server-Side Validation
		beanValidator.validate(posVO, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("posVO", posVO);
			return "deppos/PosRegister";
		}

		posService.insertPos(posVO);
		status.setComplete();
		return "deppos/PosRegister";
		/*return "forward:/PosList.do";*/
	}

	/**
	 * 글 수정화면을 조회한다.
	 * @param id - 수정할 글 id
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param model
	 * @return "egovSampleRegister"
	 * @exception Exception
	 */
	@RequestMapping("/updatePosView.do")
	public String updatePosView(@RequestParam("selectedId") String id, @ModelAttribute("searchVO") SampleDefaultVO searchVO, Model model) throws Exception {
		PosVO posVO = new PosVO();
		posVO.setPosCode(id);
		// 변수명은 CoC 에 따라 posVO
		model.addAttribute(selectPos(posVO, searchVO));
		return "deppos/PosRegister";
	}

	/**
	 * 글을 조회한다.
	 * @param posVO - 조회할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return @ModelAttribute("posVO") - 조회한 정보
	 * @exception Exception
	 */
	public PosVO selectPos(PosVO posVO, @ModelAttribute("searchVO") SampleDefaultVO searchVO) throws Exception {
		return posService.selectPos(posVO);
	}

	/**
	 * 글을 수정한다.
	 * @param posVO - 수정할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/PosList.do"
	 * @exception Exception
	 */
	@RequestMapping("/updatePos.do")
	public String updatePos(@ModelAttribute("searchVO") SampleDefaultVO searchVO, PosVO posVO, BindingResult bindingResult, Model model, SessionStatus status)
			throws Exception {

		beanValidator.validate(posVO, bindingResult);

		if (bindingResult.hasErrors()) {
			model.addAttribute("posVO", posVO);
			return "deppos/PosRegister";
		}

		posService.updatePos(posVO);
		status.setComplete();
		return "deppos/PosRegister";
		/*return "forward:/PosList.do";*/
	}

	/**
	 * 글을 삭제한다.
	 * @param posVO - 삭제할 정보가 담긴 VO
	 * @param searchVO - 목록 조회조건 정보가 담긴 VO
	 * @param status
	 * @return "forward:/egovSampleList.do"
	 * @exception Exception
	 */
	@RequestMapping("/deletePos.do")
	public String deletePos(PosVO posVO, @ModelAttribute("searchVO") SampleDefaultVO searchVO, SessionStatus status) throws Exception {
		posService.deletePos(posVO);
		status.setComplete();
		return "deppos/PosRegister";
		/*return "forward:/PosList.do";*/
	}

}
