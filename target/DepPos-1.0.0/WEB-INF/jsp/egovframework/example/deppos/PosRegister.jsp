<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : PosRegister.jsp
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
    <c:set var="registerFlag" value="${empty posVO.posCode ? 'create' : 'modify'}"/>
    <title>직급 <c:if test="${registerFlag == 'create'}">등록</c:if>
                  <c:if test="${registerFlag == 'modify'}">수정</c:if>
    </title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    
    <!--For Commons Validator Client Side-->
    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
    <validator:javascript formName="posVO" staticJavascript="false" xhtml="true" cdata="false"/>
    
    <script type="text/javaScript" language="javascript" defer="defer">
        
        /* 글 목록 화면 function */
        function fn_pos_selectList() {
           	document.detailForm.action = "<c:url value='/PosList.do'/>";
           	window.opener.location.href="redirect:/PosList.do";
           	window.close();
           	document.detailForm.submit();
        }
        
        /* 글 삭제 function */
        function fn_pos_delete() {
           	document.detailForm.action = "<c:url value='/deletePos.do'/>";
           	alert("삭제가 완료 되었습니다.");
           	
           	document.detailForm.submit();
        }
        
        /* 글 등록 function */
        function fn_pos_save() {
        	frm = document.detailForm;
        	if(!validatePosVO(frm)){
                return;
            }else{
            	frm.action = "<c:url value="${registerFlag == 'create' ? '/addPos.do' : '/updatePos.do'}"/>";
                frm.submit();
                
                alert("등록이 완료 되었습니다.");
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
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<form:form commandName="posVO" id="detailForm" name="detailForm">
    <div id="content_pop">
    	<!-- 타이틀 -->
    	<div id="title">
    		<ul>
    			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>
                    <c:if test="${registerFlag == 'create'}"><spring:message code="button.create" /></c:if>
                    <c:if test="${registerFlag == 'modify'}"><spring:message code="button.modify" /></c:if>
                </li>
    		</ul>
    	</div>
    	<!-- // 타이틀 -->
    	<div id="table">
    	<table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
    		<colgroup>
    			<col width="150"/>
    			<col width="?"/>
    		</colgroup>
    		<%-- <c:if test="${registerFlag == 'modify'}">
        		<tr>
        			<td class="tbtd_caption"><label for="posCode">직급코드</label></td>
        			<td class="tbtd_content">
        				<form:input path="posCode" cssClass="essentiality" maxlength="10" readonly="true" />
        			</td>
        		</tr>
    		</c:if> --%>
    		<tr>
    			<td class="tbtd_caption"><label for="posName">직급코드</label></td>
    			<td class="tbtd_content">
    				<form:input path="posCode" maxlength="30" cssClass="essentiality" readonly="true" />
    				&nbsp;
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="posName">직급명</label></td>
    			<td class="tbtd_content">
    				<form:input path="posName" maxlength="30" cssClass="txt"/>
    				&nbsp;<form:errors path="posName" />
    			</td>
    		</tr>
    		
    		<tr>
    			<td class="tbtd_caption"><label for="posNote">비고</label></td>
    			<td class="tbtd_content">
    				<form:textarea path="posNote" rows="5" cols="58" />&nbsp;
                </td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="posUse">사용여부</label></td>
    			<td class="tbtd_content">
    				    <form:radiobutton path="posUse" value="Y" checked="checked"/>&nbsp; 사용  			
    					<form:radiobutton path="posUse" value="N"/>&nbsp; 미사용 
    				<%-- <form:select path="posUse" cssClass="use">
    					<form:option value="Y" label="Yes" />
    					<form:option value="N" label="No" />
    				</form:select> --%>
    			</td>
    		</tr>
    		
    		
    	</table>
      </div>
    	<div id="sysbtn">
    		<ul>
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:fn_pos_selectList();">목록</a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:fn_pos_save();">
                            <c:if test="${registerFlag == 'create'}">등록</c:if>
                            <c:if test="${registerFlag == 'modify'}">수정</c:if>
                        </a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
    			<%-- <c:if test="${registerFlag == 'modify'}">
                    <li>
                        <span class="btn_blue_l">
                            <a href="javascript:fn_pos_delete();">삭제</a>
                            <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                        </span>
                    </li>
    			</c:if> --%>
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:document.detailForm.reset();">초기화</a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
                <%-- <li>
                    <span class="btn_blue_l">
                        <a href="javascript:close1();">닫기</a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li> --%>
            </ul>
    	</div>
    </div>
    <!-- 검색조건 유지 -->
    <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>
</body>
</html>