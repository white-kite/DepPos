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
    <title>오직 메뉴</title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>

</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="depVO" id="detailForm" name="detailForm" method="post">
        <input type="hidden" name="selectedId" />
        <div id="content_pop">
        	<!-- 타이틀 -->
        	<div id="title">
        		<ul>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><a onclick="parent.location.href='/DepPos/DepList.do'">부서 목록 조회</a></li>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><a onclick="parent.location.href='/DepPos/DepChart.do'">부서 조직도 조회</a></li>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><a onclick="parent.location.href='/DepPos/PosList.do'">직급 목록 조회</a></li>
        		</ul>
        	</div>
        		<ul>
         			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><a onclick="parent.location.href='/DepPos/OnlyDepChart.do'">부서 조직도 조회</a></li>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><a onclick="parent.location.href='/DepPos/Chart.do'">부서 이것저것 조회</a></li>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><a onclick="parent.location.href='/DepPos/ChartFrame.do'">부서 조직도 프레임 조회</a></li>
        			

        		</ul>
        	
        
        	<!-- List -->
        	
        </div>


        	
        	

        	
        
    </form:form>
</body>
</html>