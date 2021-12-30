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
package egovframework.example.sample.service.impl;

import java.util.List;

import egovframework.example.sample.service.DepService;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.DepVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * @Class Name : EgovDepServiceImpl.java
 * @Description : Dep Business Implement Class
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

@Service("depService")
public class DepServiceImpl extends EgovAbstractServiceImpl implements DepService {

	private static final Logger LOGGER = LoggerFactory.getLogger(DepServiceImpl.class);

	/** DepDAO */
	// TODO ibatis 사용
	//@Resource(name = "depDAO")
	//private DepDAO depDAO;
	// TODO mybatis 사용
	 @Resource(name="depMapper")
	private DepMapper depDAO;

	/** ID Generation */
	@Resource(name = "DepCodeGnrService")
	private EgovIdGnrService depcodeGnrService;

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 DepVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertDep(DepVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		/** ID Generation Service */
		String id = depcodeGnrService.getNextStringId();
		vo.setDepCode(id);
		LOGGER.debug(vo.toString());

		depDAO.insertDep(vo);
		return id;
	}

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 DepVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void updateDep(DepVO vo) throws Exception {
		depDAO.updateDep(vo);
	}

	/**
	 * 글을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 DepVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void deleteDep(DepVO vo) throws Exception {
		depDAO.deleteDep(vo);
	}

	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 DepVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	@Override
	public DepVO selectDep(DepVO vo) throws Exception {
		DepVO resultVO = depDAO.selectDep(vo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}

	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectDepList(SampleDefaultVO searchVO) throws Exception {
		return depDAO.selectDepList(searchVO);
	}

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	@Override
	public int selectDepListTotCnt(SampleDefaultVO searchVO) {
		return depDAO.selectDepListTotCnt(searchVO);
	}
	
	/**
	 * 상위부서명 입력 셀렉트 폼에 넣을 부서를 조회한다.
	 */
	public List<?> catchDepList() throws Exception {
		return depDAO.catchDepList();
	}
	
	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectDepChart(SampleDefaultVO searchVO) throws Exception {
		return depDAO.selectDepChart(searchVO);
	}

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	@Override
	public int selectDepChartTotCnt(SampleDefaultVO searchVO) {
		return depDAO.selectDepChartTotCnt(searchVO);
	}
	
	/*상위부서와 하위부서 출력을 위해*/
	public List<?> updeList() throws Exception {
		return depDAO.updeList();
	}
	
	public List<?> dodeList(DepVO vo) throws Exception {
		return depDAO.dodeList(vo);
	}
	
	public List<?> chartList() throws Exception {
		return depDAO.chartList();
	}

}
