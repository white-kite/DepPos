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
    
    <!--Ajax Tags-->

	
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="crossorigin="anonymous"></script>
    
    
    
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
        
	</script>
    
    <!-- 출처: https://cheonfamily.tistory.com/7 [천리길도 한 걸음부터] 
	브라우저 타이틀 맨 왼쪽에 보면 있는 아이콘이 없거나 경로가 맞지 않으면 뜨는 오류 제거 코드 head에 추가,
	http://localhost:8080/favicon.ico 404 를 없애준다.-->
	<link rel="shortcut icon" href="#"/>



</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="depVO" id="detailForm" name="detailForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">

        	<!-- List -->
        	
        </div>


        	
        	<!-- css적용 트리구조 만들기 -->
        	<div class="menu_tree">
        	<div class="title">1쿼리 1부서 정렬조직도</div>
        	
        	<ul>
        	
        			<li>
        				<input type="checkbox" id="one"/>
        				<label for="root"/>어느부서가 있을까요?
        				
        				<ul>
        				<c:forEach var="onechartList" items="${onechartList}" varStatus="status">
        					<li>
        					<%-- <a id="who" href="javascript:fn_wholist_select('<c:out value="${onechartList.depCode}"/>')" target="center" > --%>
        					
        					<a class="who" href="<c:url value='/whois.do'/>" onclick="javascript:testAjax('<c:out value="${onechartList.depCode}"/>')"  target="center"><c:out value="${onechartList.depName}"/></a>
        					

        					</li>
        				</c:forEach>
        				</ul>
        				
        			</li>
        			
        	</ul>
        	

        	</div>

			<script >
			  function testAjax(data) {
			
				 console.log("data",data);
			
			  	$.ajax({
					type : 'post',
					data : {depCode : data},
					url : "<c:url value='/whois.do'/>",
					success: function(data) {
					          console.log("data===",data);
					         
					          
					      },
					error : function(error) {
						console.log(error);
					}
				});
			}  
			 
			 
			</script>        	
        	
        	<!-- /List -->
        	
        
    </form:form>
</body>
</html>