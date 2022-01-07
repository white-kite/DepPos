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
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample2.css'/>"/>
    <script type="text/javaScript" language="javascript" defer="defer">
    
        
        
        /* listForm에서 detailForm으로 수정, form의 commandName도 depVO */
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.detailForm.action = "<c:url value='/OnlyDepChart.do'/>";
           	document.detailForm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.detailForm.pageIndex.value = pageNo;
        	document.detailForm.action = "<c:url value='/OnlyDepChart.do'/>";
           	document.detailForm.submit();
        }
        
    	/*depdode 끌고오기 */
        function fn_wholist_select(id) {
        	document.detailForm.selectedId.value = id;
           	document.detailForm.action = "<c:url value='/OnlyDepChart.do'/>";
           	document.detailForm.submit();
        }
    	
    
       
        
    </script>
    

	
	
	
	<style type="text/css">
	
/* 	input[type="checkbox"]:checked~ul{
            display:none;
        }
	 */
	

	/*
	#tree.form:checkbox checked~ul{
	display:none;
	}
	*/
     /* .hide {
         display: none;
     } */
	</style>

</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="depVO" id="detailForm" name="detailForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">
        	<!-- 타이틀 
        	<div id="title">
        		<ul>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><a href="/DepPos/DepList.do">부서 목록 조회</a></li>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><a href="/DepPos/DepChart.do">부서 조직도 조회</a></li>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><a href="/DepPos/PosList.do">직급 목록 조회</a></li>
        		</ul>
        	</div> -->
        	
        	
        
        	<!-- List -->
        	
        </div>


        	
        	
        	<!-- css적용 트리구조 만들기 -->
        	<div class="menu_tree">
        	<div class="title">1쿼리 1부서 정렬조직도</div>
        	
        	<ul>
        	
        			<li>
        				<input type="checkbox" id="one"/>
        				<label for="root"/>어느부서에 누가 있을까요?
        				
        				<ul>
        				<c:forEach var="result" items="${resultList}" varStatus="status">
        					<li>
        					<a target="center" href="javascript:fn_wholist_select('<c:out value="${result.empName}"/>')">
        					<!-- <input type="checkbox" id="two"/> -->
        						<c:out value="${result.empName}"/></a>
        						<%--<ul class="onechartList">
        							 <c:forEach var="chartList" items="${onechartList}" varStatus="status"> 
        								
	        								<li>
	        									
	        										<c:out value="${onechartList.depDown}"/>
	        									
	        								</li>
        								
        							 </c:forEach> 
        						</ul> --%>
        					</li>
        				</c:forEach>
        				</ul>
        				
        			</li>
        			
        	</ul>
        	

        	</div>
        	
        	
        	<!-- /List -->
        	
        
    </form:form>
</body>
</html>