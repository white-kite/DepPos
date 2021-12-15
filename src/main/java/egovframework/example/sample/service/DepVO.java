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
package egovframework.example.sample.service;

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
public class DepVO extends SampleDefaultVO {

	private static final long serialVersionUID = 1L;

	/** 부서코드 */
	private String depCode;

	/** 부서비고 */
	private String depName;

	/** 상위부서코드 */
	private String depUpde;

	/** 부서사용여부 */
	private String depUse;

	/** 부서비고 */
	private String depNote;
	
	/** 부서등록자 */
	private String depRegm;
	
	/** 부서등록일시 */
	private String depRegd;
	
	/** 부서수정자 */
	private String depUptm;
	
	/** 부서등록일시 */
	private String depUptd;

	
	
	
	public String getDepCode() {
		return depCode;
	}

	public void setDepCode(String depCode) {
		this.depCode = depCode;
	}

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public String getDepUpde() {
		return depUpde;
	}

	public void setDepUpde(String depUpde) {
		this.depUpde = depUpde;
	}

	public String getDepUse() {
		return depUse;
	}

	public void setDepUse(String depUse) {
		this.depUse = depUse;
	}

	public String getDepNote() {
		return depNote;
	}

	public void setDepNote(String depNote) {
		this.depNote = depNote;
	}

	public String getDepRegm() {
		return depRegm;
	}

	public void setDepRegm(String depRegm) {
		this.depRegm = depRegm;
	}

	public String getDepRegd() {
		return depRegd;
	}

	public void setDepRegd(String depRegd) {
		this.depRegd = depRegd;
	}

	public String getDepUptm() {
		return depUptm;
	}

	public void setDepUptm(String depUptm) {
		this.depUptm = depUptm;
	}

	public String getDepUptd() {
		return depUptd;
	}

	public void setDepUptd(String depUptd) {
		this.depUptd = depUptd;
	}




	
}
