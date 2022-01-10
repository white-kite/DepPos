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
    <!-- 지루해서 넣어둔 효과 추후 삭제 예정 -->
    <script type="text/javascript">
// <![CDATA[
var colour="random"; // in addition to "random" can be set to any valid colour eg "#f0f" or "red"
var sparkles=50;

/****************************
*  Tinkerbell Magic Sparkle *
*(c)2005-13 mf2fm web-design*
*  http://www.mf2fm.com/rv  *
* DON'T EDIT BELOW THIS BOX *
****************************/
var x=ox=400;
var y=oy=300;
var swide=800;
var shigh=600;
var sleft=sdown=0;
var tiny=new Array();
var star=new Array();
var starv=new Array();
var starx=new Array();
var stary=new Array();
var tinyx=new Array();
var tinyy=new Array();
var tinyv=new Array();

window.onload=function() { if (document.getElementById) {
  var i, rats, rlef, rdow;
  for (var i=0; i<sparkles; i++) {
    var rats=createDiv(3, 3);
    rats.style.visibility="hidden";
    rats.style.zIndex="999";
    document.body.appendChild(tiny[i]=rats);
    starv[i]=0;
    tinyv[i]=0;
    var rats=createDiv(5, 5);
    rats.style.backgroundColor="transparent";
    rats.style.visibility="hidden";
    rats.style.zIndex="999";
    var rlef=createDiv(1, 5);
    var rdow=createDiv(5, 1);
    rats.appendChild(rlef);
    rats.appendChild(rdow);
    rlef.style.top="2px";
    rlef.style.left="0px";
    rdow.style.top="0px";
    rdow.style.left="2px";
    document.body.appendChild(star[i]=rats);
  }
  set_width();
  sparkle();
}}

function sparkle() {
  var c;
  if (Math.abs(x-ox)>1 || Math.abs(y-oy)>1) {
    ox=x;
    oy=y;
    for (c=0; c<sparkles; c++) if (!starv[c]) {
      star[c].style.left=(starx[c]=x)+"px";
      star[c].style.top=(stary[c]=y+1)+"px";
      star[c].style.clip="rect(0px, 5px, 5px, 0px)";
      star[c].childNodes[0].style.backgroundColor=star[c].childNodes[1].style.backgroundColor=(colour=="random")?newColour():colour;
      star[c].style.visibility="visible";
      starv[c]=50;
      break;
    }
  }
  for (c=0; c<sparkles; c++) {
    if (starv[c]) update_star(c);
    if (tinyv[c]) update_tiny(c);
  }
  setTimeout("sparkle()", 40);
}

function update_star(i) {
  if (--starv[i]==25) star[i].style.clip="rect(1px, 4px, 4px, 1px)";
  if (starv[i]) {
    stary[i]+=1+Math.random()*3;
    starx[i]+=(i%5-2)/5;
    if (stary[i]<shigh+sdown) {
      star[i].style.top=stary[i]+"px";
      star[i].style.left=starx[i]+"px";
    }
    else {
      star[i].style.visibility="hidden";
      starv[i]=0;
      return;
    }
  }
  else {
    tinyv[i]=50;
    tiny[i].style.top=(tinyy[i]=stary[i])+"px";
    tiny[i].style.left=(tinyx[i]=starx[i])+"px";
    tiny[i].style.width="2px";
    tiny[i].style.height="2px";
    tiny[i].style.backgroundColor=star[i].childNodes[0].style.backgroundColor;
    star[i].style.visibility="hidden";
    tiny[i].style.visibility="visible"
  }
}

function update_tiny(i) {
  if (--tinyv[i]==25) {
    tiny[i].style.width="1px";
    tiny[i].style.height="1px";
  }
  if (tinyv[i]) {
    tinyy[i]+=1+Math.random()*3;
    tinyx[i]+=(i%5-2)/5;
    if (tinyy[i]<shigh+sdown) {
      tiny[i].style.top=tinyy[i]+"px";
      tiny[i].style.left=tinyx[i]+"px";
    }
    else {
      tiny[i].style.visibility="hidden";
      tinyv[i]=0;
      return;
    }
  }
  else tiny[i].style.visibility="hidden";
}

document.onmousemove=mouse;
function mouse(e) {
  if (e) {
    y=e.pageY;
    x=e.pageX;
  }
  else {
    set_scroll();
    y=event.y+sdown;
    x=event.x+sleft;
  }
}

window.onscroll=set_scroll;
function set_scroll() {
  if (typeof(self.pageYOffset)=='number') {
    sdown=self.pageYOffset;
    sleft=self.pageXOffset;
  }
  else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
    sdown=document.body.scrollTop;
    sleft=document.body.scrollLeft;
  }
  else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
    sleft=document.documentElement.scrollLeft;
    sdown=document.documentElement.scrollTop;
  }
  else {
    sdown=0;
    sleft=0;
  }
}

window.onresize=set_width;
function set_width() {
  var sw_min=999999;
  var sh_min=999999;
  if (document.documentElement && document.documentElement.clientWidth) {
    if (document.documentElement.clientWidth>0) sw_min=document.documentElement.clientWidth;
    if (document.documentElement.clientHeight>0) sh_min=document.documentElement.clientHeight;
  }
  if (typeof(self.innerWidth)=='number' && self.innerWidth) {
    if (self.innerWidth>0 && self.innerWidth<sw_min) sw_min=self.innerWidth;
    if (self.innerHeight>0 && self.innerHeight<sh_min) sh_min=self.innerHeight;
  }
  if (document.body.clientWidth) {
    if (document.body.clientWidth>0 && document.body.clientWidth<sw_min) sw_min=document.body.clientWidth;
    if (document.body.clientHeight>0 && document.body.clientHeight<sh_min) sh_min=document.body.clientHeight;
  }
  if (sw_min==999999 || sh_min==999999) {
    sw_min=800;
    sh_min=600;
  }
  swide=sw_min;
  shigh=sh_min;
}

function createDiv(height, width) {
  var div=document.createElement("div");
  div.style.position="absolute";
  div.style.height=height+"px";
  div.style.width=width+"px";
  div.style.overflow="hidden";
  return (div);
}

function newColour() {
  var c=new Array();
  c[0]=255;
  c[1]=Math.floor(Math.random()*256);
  c[2]=Math.floor(Math.random()*(256-c[1]/2));
  c.sort(function(){return (0.5 - Math.random());});
  return ("rgb("+c[0]+", "+c[1]+", "+c[2]+")");
}
// ]]>
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
