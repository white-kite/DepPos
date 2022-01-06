<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ajax" ri="http://ajaxtags.sourceforge.net/tags/ajaxtags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>누가 있을까요?</title>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample2.css'/>"/>
    
    <!-- 이 다요섯줄은 ajax를 위해 추가한다. -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/ajaxtags/js/prototype.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/ajaxtags/js/scriptaculous/scriptaculous.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/ajaxtags/js/overlibmws/overlibmws.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/ajaxtags/js/ajaxtags.js"></script>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/ajaxtags/css/ajaxtags.css" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/ajaxtags/css/displaytag.css" />


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
        function fn_egov_select(id) {
        	document.detailForm.selectedId.value = id;
           	document.detailForm.action = "<c:url value='/OpenDepChart.do'/>";
           	document.detailForm.submit();
        }
    	
    	
    	
    	/* ajax 시도하기 */
    	
    	
     	$(function (){
    		$("a").click(function(){
    		$(this).html(data+status);})
    		});
    		 
    		
/*     	$(function(){
    		$("a").on("click", function(){
    			$.ajax({
    				type:"GET",
    				url:"<c:url value='/whois.do'/>",
    				error : function(){
    					alert("통신실패;;;");
    				},
    				success : function(Parse_data){
    					$("#Parse_Area").html(Parse_data);
    					alert("통신 데이터 값 :" +Parse_data)
    				}
    			})
    		})
    	})
     */
       
        
    </script>

</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="depVO" id="detailForm" name="detailForm" method="post">


        	<div class="menu_tree">
        	<div class="title">부서원 정렬조직도</div>
        	
        	<ul>
        	
        			<li>
        				<input type="checkbox" id="one"/>
        				<label for="root"/>누가 있을까요?
        				
        				<ul>
        				<c:forEach var="whoisList" items="${whoisList}" varStatus="status">
        					<li>
        						<a target="center">
        					<%-- <a href="javascript:fn_egov_select('<c:out value="${whoisList.empName}"/>')"> --%>
        					<!-- <input type="checkbox" id="two"/> -->
        						<c:out value="${whoisList.empName}"/><!-- </a> -->
        						</a>
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