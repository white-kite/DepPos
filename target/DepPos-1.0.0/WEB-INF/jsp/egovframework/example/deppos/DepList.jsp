<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : DepList.jsp
  * @Description : Dep List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>부서목록 조회</title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/style.css'/>"/>
    <script type="text/javaScript" language="javascript" defer="defer">
        
        /* 글 수정 화면 function */
        function fn_egov_select(id) {
        	document.listForm.selectedId.value = id;
            window.open("<c:url value='/updateDepView.do?selectedId="+id+"'/>", "", "width=770, height=500, left=100, top=50");
            document.listForm.submit();
        	
        	/* document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateDepView.do'/>";
           	document.listForm.submit(); */
        }
        
        /* 글 등록 화면 function */
        function fn_egov_addView() {
        	window.open("<c:url value='/addDep.do'/>", "depreg", "width=770, height=500, left=100, top=50");
        	document.listForm.submit();
           	/* document.listForm.action = "<c:url value='/addDep.do'/>";
           	document.listForm.submit(); */
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.listForm.action = "<c:url value='/DepList.do'/>";
           	document.listForm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/DepList.do'/>";
           	document.listForm.submit();
        }
        
        
    </script>


	<!-- 출처: https://cheonfamily.tistory.com/7 [천리길도 한 걸음부터] 
	브라우저 타이틀 맨 왼쪽에 보면 있는 아이콘이 없거나 경로가 맞지 않으면 뜨는 오류 제거 코드
	http://localhost:8080/favicon.ico 404 를 없애준다.-->
	<link rel="shortcut icon" href="#"/>
	
	
	
</head>

<body>
    <form:form commandName="searchVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="container">
        	<!-- 타이틀 -->

        	
        	<div id="tab" class="tab_bg">
        		<ul>
        			<li> <a href="/DepPos/DepList.do" class="tab_on">부서 목록 조회</a> </li>
        			<li> <a href="/DepPos/DepChart.do" class="tab">부서 조직도 조회</a> </li>
        			<li> <a href="/DepPos/PosList.do" class="tab">직급 목록 조회</a> </li>
        		</ul>
        	</div>
        	
        	
        	첫 화면은 사용중인 부서만 보여집니다. 미사용 부서 확인 필요 시 검색을 해주세요.
        	
        	<!-- // 타이틀 -->
        	<div id="search_box">
        		<ul>
        			<li>
        				<label for="SearchField2">검색구분</label>
        				&nbsp; &nbsp;
        			   <%--  <label for="searchCondition" style="visibility:hidden;"><spring:message code="search.choose" /></label> --%>
        				<%-- <form:select path="searchCondition" name="SearchField2" id="SearchField2" style="width:100px">
        					<form:option value="0" label="부서명" />
        					<form:option value="1" label="부서코드" />
        				</form:select> --%>
        				
        				<select name="SearchField2" id="SearchField2" style="width:100px">
			                <option value="0">부서명</option>
			                <option value="1">부서코드</option>
        				</select>
        			&nbsp;
        			<label for="SearchField2">검색어 입력</label>
        				&nbsp; &nbsp;
        			<%-- <label for="searchKeyword" style="visibility:hidden;display:none;"><spring:message code="search.keyword" /></label> --%>
                        <form:input path="searchKeyword" name="SearchText2" id="SearchText2" class="input"/>
                    
                     <!-- 사용여부 -->
                    &nbsp;&nbsp;
        			<label for="SearchField2">사용여부</label>
        				&nbsp; &nbsp;
        			
        					<form:radiobutton path="searchUseYn" value="0" label=" 사용" checked="checked" id="radio_01" name="radio_01" class="check" />  &nbsp; &nbsp;
        					<form:radiobutton path="searchUseYn" value="1" label=" 미사용" id="radio_02" name="radio_02" class="check"/>
        					
        					<%-- <form:radiobutton path="searchUseYn" value="0" checked="checked" id="radio_01" name="radio_01" class="check" />
        					<label for="radio_01">사용</label>
        					 &nbsp; &nbsp;
        					<form:radiobutton path="searchUseYn" value="1"ㄴ id="radio_02" name="radio_02" class="check"/>
        					<label for="radio_02">미사용</label> --%>
        					
        			</li>
                </ul>
                <div class="btn">
        	            <span>
        	                <a href="javascript:fn_egov_selectList();"  class="btn_gray">검색</a>
        	                
        	            </span>
        	    </div>    
        	</div>
        	<!-- List -->
        	
        	<div class="align_multi mgt30 mgb10">
        	<ul>
        		<li class="multi_r">
        			<a href="javascript:fn_egov_addView();" class="btn_mint_s">등록</a>
        		</li>
        	</ul>
        	</div>
        	
        	<!-- <div id="table"> -->
        		<div class="align_multi mgt10 mgb10">
        		<table class="tbl_board_list" summary="부서코드, 부서명, 상위부서명, 사용여부 표시하는 테이블">
        			<caption style="visibility:hidden">부서코드, 부서명, 상위부서명, 사용여부 표시하는 테이블</caption>
        			<colgroup>
        				<col width="40"/>
        				<col width="250"/>
        				<col width="250"/>
        				<col width="200"/>
        				<col width="?"/>
        				
        			</colgroup>
        			<tr>
        				<th align="center">No</th>
        				<th align="center">부서코드</th>
        				<th align="center">부서명</th>
        				<th align="center">상위부서명</th>
        				<th align="center">사용여부</th>
        				
        			</tr>
        			<c:forEach var="result" items="${resultList}" varStatus="status">
            			<tr>
            				<td align="center" class="listtd"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
            				<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.depCode}"/>')"><c:out value="${result.depCode}"/></a></td>
            				<td align="center" class="listtd"><c:out value="${result.depName}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.depUpde}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.depUse}"/>&nbsp;</td>
            				
            			</tr>
        			</c:forEach>
        		</table>
        	</div>
        	<!-- /List -->
        	<div class="paging">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<form:hidden path="pageIndex" />
        	</div>
        	
        	
 
 
        </div>
    </form:form>
</body>
</html>
