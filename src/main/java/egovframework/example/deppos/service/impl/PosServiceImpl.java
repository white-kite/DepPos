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
package egovframework.example.deppos.service.impl;

import java.util.List;

import egovframework.example.deppos.service.PosService;
import egovframework.example.deppos.service.SampleDefaultVO;
import egovframework.example.deppos.service.PosVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * @Class Name : EgovPosServiceImpl.java
 * @Description : Pos Business Implement Class
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

@Service("posService")
public class PosServiceImpl extends EgovAbstractServiceImpl implements PosService {

	private static final Logger LOGGER = LoggerFactory.getLogger(PosServiceImpl.class);

	/** PosDAO */
	// TODO ibatis 사용
	//@Resource(name = "posDAO")
	//private PosDAO posDAO;
	// TODO mybatis 사용
	 @Resource(name="posMapper")
	private PosMapper posDAO;

	/** ID Generation */
	@Resource(name = "PosCodeGnrService")
	private EgovIdGnrService poscodeGnrService;

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 PosVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	@Override
	public String insertPos(PosVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		/** ID Generation Service */
		String id = poscodeGnrService.getNextStringId();
		vo.setPosCode(id);
		LOGGER.debug(vo.toString());

		posDAO.insertPos(vo);
		return id;
	}

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 PosVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void updatePos(PosVO vo) throws Exception {
		posDAO.updatePos(vo);
	}

	/**
	 * 글을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 PosVO
	 * @return void형
	 * @exception Exception
	 */
	@Override
	public void deletePos(PosVO vo) throws Exception {
		posDAO.deletePos(vo);
	}

	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 PosVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	@Override
	public PosVO selectPos(PosVO vo) throws Exception {
		PosVO resultVO = posDAO.selectPos(vo);
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
	public List<?> selectPosList(SampleDefaultVO searchVO) throws Exception {
		return posDAO.selectPosList(searchVO);
	}

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	@Override
	public int selectPosListTotCnt(SampleDefaultVO searchVO) {
		return posDAO.selectPosListTotCnt(searchVO);
	}

}
