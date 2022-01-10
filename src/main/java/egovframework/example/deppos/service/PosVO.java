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
package egovframework.example.deppos.service;

/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
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
public class PosVO extends SampleDefaultVO {

	private static final long serialVersionUID = 1L;

	/** 직책코드 */
	private String posCode;
	
	/** 직책비고 */
	private String posName;

	/** 직책사용여부 */
	private String posUse;

	/** 직책비고 */
	private String posNote;
	
	/** 직책등록자 */
	private String posRegm;
	
	/** 직책등록일시 */
	private String posRegd;
	
	/** 직책수정자 */
	private String posUptm;
	
	/** 직책수정일시 */
	private String posUptd;



	public String getPosCode() {
		return posCode;
	}

	public void setPosCode(String posCode) {
		this.posCode = posCode;
	}

	public String getPosName() {
		return posName;
	}

	public void setPosName(String posName) {
		this.posName = posName;
	}

	public String getPosUse() {
		return posUse;
	}

	public void setPosUse(String posUse) {
		this.posUse = posUse;
	}

	public String getPosNote() {
		return posNote;
	}

	public void setPosNote(String posNote) {
		this.posNote = posNote;
	}

	public String getPosRegm() {
		return posRegm;
	}

	public void setPosRegm(String posRegm) {
		this.posRegm = posRegm;
	}

	public String getPosRegd() {
		return posRegd;
	}

	public void setPosRegd(String posRegd) {
		this.posRegd = posRegd;
	}

	public String getPosUptm() {
		return posUptm;
	}

	public void setPosUptm(String posUptm) {
		this.posUptm = posUptm;
	}

	public String getPosUptd() {
		return posUptd;
	}

	public void setPosUptd(String posUptd) {
		this.posUptd = posUptd;
	}


	

	

}
