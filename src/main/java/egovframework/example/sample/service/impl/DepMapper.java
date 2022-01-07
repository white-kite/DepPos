/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
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

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.DepVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * dep에 관한 데이터처리 매퍼 클래스
 *
 * @author  표준프레임워크센터
 * @since 2014.01.24
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2014.01.24        표준프레임워크센터          최초 생성
 *
 * </pre>
 */
@Mapper("depMapper")
public interface DepMapper {

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 DepVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	void insertDep(DepVO vo) throws Exception;

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 DepVO
	 * @return void형
	 * @exception Exception
	 */
	void updateDep(DepVO vo) throws Exception;

	/**
	 * 글을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 DepVO
	 * @return void형
	 * @exception Exception
	 */
	void deleteDep(DepVO vo) throws Exception;

	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 DepVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	DepVO selectDep(DepVO vo) throws Exception;

	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> selectDepList(SampleDefaultVO searchVO) throws Exception;

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	int selectDepListTotCnt(SampleDefaultVO searchVO);
	
	/**
	 * 상위부서명 입력 셀렉트 폼에 넣을 부서를 조회한다.
	 */
	List<?> catchDepList() throws Exception;
	
	/**
	 * 글 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> selectDepChart(SampleDefaultVO searchVO) throws Exception;

	/**
	 * 글 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	int selectDepChartTotCnt(SampleDefaultVO searchVO);
	
	/*상위부서와 하위부서 출력을 위해*/
	List<?> updeList() throws Exception;
	List<?> dodeList(DepVO vo) throws Exception;
	List<?> chartList() throws Exception;
	List<?> onechartList() throws Exception;
	
	/*부서에 누가 있는지 알기 위해*/
	List<?> whoisList(DepVO vo) throws Exception;
	
	/**
	 * 부서원을 조회한다.
	 * @param vo - 조회할 정보가 담긴 DepVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	DepVO selectWho(DepVO vo) throws Exception;
}
