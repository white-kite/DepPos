<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : DepChart.jsp
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
    <title>부서 조직도 조회</title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script type="text/javaScript" language="javascript" defer="defer">
        
        
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.listForm.action = "<c:url value='/DepChart.do'/>";
           	document.listForm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/DepChart.do'/>";
           	document.listForm.submit();
        }
        
        
    </script>
    <style type="text/css">

    /* 모든 체크박스를 숨김 처리 한다. */
    input[type="checkbox"] {
        display:none;
    }

    input[type="checkbox"]:checked~ul {
        display:none;
    }
	</style>

</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="searchVO" id="listForm" name="listForm" method="post">
        <!-- <input type="hidden" name="selectedId" /> -->
        <div id="content_pop">
        	<!-- 타이틀 -->
        	<div id="title">
        		<ul>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><a href="/DepPos/DepList.do">부서 목록 조회</a></li>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><a href="/DepPos/DepChart.do">부서 조직도 조회</a></li>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><a href="/DepPos/PosList.do">직급 목록 조회</a></li>
        		</ul>
        	</div>
        	
        	
        	
        	
        	<!-- // 타이틀 -->
        	<%-- <div id="search">
        		<ul>
        			<li>
        			    <label for="searchCondition" style="visibility:hidden;"><spring:message code="search.choose" /></label>
        				<form:select path="searchCondition" cssClass="use">
        					<form:option value="0" label="부서명" />
        					<form:option value="1" label="부서코드" />
        					
        				</form:select>
        			</li>
        			<li><label for="searchKeyword" style="visibility:hidden;display:none;"><spring:message code="search.keyword" /></label>
                        <form:input path="searchKeyword" cssClass="txt"/>
                    </li>
                     <!-- 사용여부 -->
                    
        			<li>
        					<form:radiobutton path="searchUseYn" value="0"  label="사용" checked="checked" />
        					<form:radiobutton path="searchUseYn" value="1" label="미사용"/>
        					
        			</li>
        			<li>
        	            <span class="btn_blue_l">
        	                <a href="javascript:fn_egov_selectList();"><spring:message code="button.search" /></a>
        	                <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
        	            </span>
        	        </li>
                </ul>
        	</div> --%>
        	<!-- List -->
        	<div id="table">
        		<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="부서코드, 부서명, 상위부서명, 사용여부 표시하는 테이블">
        			<caption style="visibility:hidden">상위부서명, 부서명 표시하는 조직도 테이블</caption>
        			<colgroup>
        				<col width="40"/>
        				<col width="100"/>
        				
        				
        				<col width="?"/>
        				
        			</colgroup>
        			<tr>
        				<th align="center">No</th>
        				<th align="center">상위부서명</th>
        				
        				<th align="center">부서명</th>
        				
        				
        			</tr>
        			<c:forEach var="result" items="${resultList}" varStatus="status">
            			<tr>
            				<td align="center" class="listtd"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}"/></td>
            				<td align="center" class="listtd"><c:out value="${result.depUpde}"/>&nbsp;</td>
            				
            				<td align="center" class="listtd"><c:out value="${result.depName}"/>&nbsp;</td>
            				
            				
            			</tr>
        			</c:forEach>
        		</table>
        	</div>
        	<!-- 트리구조 만들기 -->
        	<div class="menu_tree_management">
        	<div class="title">메뉴 관리</div>
    		<div class="table_ctn">
       		<div class="menu_tree">
        	<ul class="tree">
        		<c:forEach var="result" items="${updeList}" varStatus="status">
        			<li>
        				<input type="checkbox" id="root"/>
        				<label for="root"/>부서조직도
        				<ul>
        					<li>
        					<input type="checkbox" id="ch1"/>
        					<label for="ch1"><c:out value="${updeL.depUpde}"/></label>
        						<ul class="sub_menu">
        							<c:forEach var="result" items="${dodeList}" varStatus="status">
        								<li>
        									<a href="">
        										<c:out value="${dodeL.depName}"/>
        									</a>
        								</li>
        							</c:forEach>
        						</ul>
        					</li>
        				</ul>
        			</li>
        		</c:forEach>
        	</ul>
        	</div>
        	</div>
        	</div>
        	
        	
        	<!-- /List -->
        	<div id="paging">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<form:hidden path="pageIndex" />
        	</div>
        	<%-- <div id="sysbtn">
        	  <ul>
        	      <li>
        	          <span class="btn_blue_l">
        	              <a href="javascript:fn_egov_addView();"><spring:message code="button.create" /></a>
                          <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span>
                  </li>
              </ul>
        	</div> --%>
        </div>
    </form:form>
</body>
</html>
