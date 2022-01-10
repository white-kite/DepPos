<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : DepRegister.jsp
  * @Description : Sample Register 화면
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
    <c:set var="registerFlag" value="${empty depVO.depCode ? 'create' : 'modify'}"/>
    <title>부서 <c:if test="${registerFlag == 'create'}">등록</c:if>
                  <c:if test="${registerFlag == 'modify'}">수정</c:if>
    </title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/style.css'/>"/>
    
    <!--For Commons Validator Client Side-->
    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
    <validator:javascript formName="depVO" staticJavascript="false" xhtml="true" cdata="false"/>
    
    <script type="text/javaScript" language="javascript" defer="defer">
        
        /* 글 목록 화면 function */
        function fn_dep_selectList() {
           	document.detailForm.action = "<c:url value='/DepList.do'/>";
           	window.opener.location.href="redirect:/DepList.do";
           	window.close();
           	document.detailForm.submit();
        }
        
        /* 글 삭제 function */
        function fn_dep_delete() {
           	document.detailForm.action = "<c:url value='/deleteDep.do'/>";
           	alert("삭제가 완료 되었습니다. ");
           	
           	document.detailForm.submit();
        }
        
        /* 글 등록 function */
        function fn_dep_save() {
        	frm = document.detailForm;
        	if(!validateDepVO(frm)){
                return;
            }  else if(frm.depCode.value == frm.depUpde.value){
            	alert("부서명과 상위부서명이 같을 수 없습니다.");
            	return;
            } 
        	
        	else{
            	frm.action = "<c:url value="${registerFlag == 'create' ? '/addDep.do' : '/updateDep.do'}"/>";
                frm.submit();
                
                alert("등록이 완료 되었습니다. ");
            }
        }
        
        /* function close1(){
        	opener.location.reload();
        	window.close();
        } */
        
        
        /* 창닫았을때 부모창 reload*/
        window.onbeforeunload = function() {

        	opener.location.reload();
        	window.close();
        }
        
       
    </script>
</head>
<body>

<form:form commandName="depVO" id="detailForm" name="detailForm">
    <div id="container">
    	<!-- 타이틀 -->
    	<div id="title">
    		<ul>
    			<li>
                    <%-- <c:if test="${registerFlag == 'create'}"><spring:message code="button.create" /></c:if>
                    <c:if test="${registerFlag == 'modify'}"><spring:message code="button.modify" /></c:if> --%>
                    <c:if test="${registerFlag == 'create'}"><h4 class="sub_depth01">글쓰기</h4></c:if>
                    <c:if test="${registerFlag == 'modify'}"><h4 class="sub_depth01">글수정</h4></c:if>
                </li>
    		</ul>
    	</div>
    	<!-- // 타이틀 -->
    	<div id="content">
    	<table class="tbl_board_write" style="width:60.8%">
    		<colgroup>
    			<col width="80"/>
    			<col width="200"/>
    		</colgroup>
    		<%-- <c:if test="${registerFlag == 'modify'}">
        		<tr>
        			<td ><label for="depCode">부서코드</label></td>
        			<td >
        				<form:input path="depCode" cssClass="essentiality" maxlength="10" readonly="true" />
        			</td>
        		</tr>
    		</c:if> --%>
    		<tr>
    			<td ><label for="depName">부서코드</label></td>
    			<td >
    				<form:input path="depCode" maxlength="30" cssClass="essentiality" readonly="true" id="calendar" name="calendar" />
    				&nbsp;
    			</td>
    		</tr>
    		<tr>
    			<td ><label for="depName">부서명</label></td>
    			<td >
    				<form:input path="depName" maxlength="30" id="title" class="input" style="width:60.8%" cssClass="txt"/>
    				&nbsp;<form:errors path="depName" />
    			</td>
    		</tr>
    		<tr>
    			<td ><label for="depUpde">상위부서명</label></td>
    			<td >

    				<form:select path="depUpde" id="catchDepList" style="width:130px">
    					<form:option value=''>&nbsp;</form:option>
    					<c:forEach items="${catchDepList}" var="catchDep">
    					<form:option value="${catchDep.depCode}">
    						<c:out value="${catchDep.depName}"/></form:option>
    					</c:forEach>
    				</form:select>

    				<%-- <form:input path="depUpde" maxlength="30" cssClass="txt"/> --%>
    				
    				&nbsp;
    			</td>
    		</tr>
    		<tr>
    			<td ><label for="depNote">비고</label></td>
    			<td >
    				<form:textarea path="depNote" rows="5" cols="58" />&nbsp;
                </td>
    		</tr>
    		<tr>
    			<td ><label for="depUse">사용여부</label></td>
    			<td >
    				<form:radiobutton path="depUse" value="Y" checked="checked"/>&nbsp; 사용 		
    				<form:radiobutton path="depUse" value="N"/>&nbsp; 미사용 
    				
    				<%-- <form:select path="depUse" cssClass="use">
    					<form:option value="Y" label="Yes" />
    					<form:option value="N" label="No" />
    				</form:select> --%>
    			</td>
    		</tr>
    		
    		
    	</table>
      </div>
    	<div class="align_c mgt10">

                    <span>
                        <a href="javascript:fn_dep_selectList();"  class="btn_white">목록</a>
                        
                    </span>

                    <span>
                        <a href="javascript:fn_dep_save();" class="btn_blue">
                            <c:if test="${registerFlag == 'create'}">등록</c:if>
                            <c:if test="${registerFlag == 'modify'}">수정</c:if>
                        </a>
                        
                    </span>

    			<%-- <c:if test="${registerFlag == 'modify'}">
                    <li>
                        <span class="btn_blue_l">
                            <a href="javascript:fn_dep_delete();">삭제</a>
                            <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                        </span>
                    </li>
    			</c:if> --%>

                    <span>
                        <a href="javascript:document.detailForm.reset();" class="btn_gray">초기화</a>
                        
                    </span>
     
                <%-- <li>
                    <span class="btn_blue_l">
                        <a href="javascript:close1();">닫기</a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li> --%>

    	</div>
    </div>
    <!-- 검색조건 유지 -->
    <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="searchUseYn" value="<c:out value='${searchVO.searchUseYn}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>
</body>
</html>