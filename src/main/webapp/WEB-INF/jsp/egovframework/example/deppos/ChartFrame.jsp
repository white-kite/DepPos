<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>조직도</title>
</head>
<frameset rows = "100,*" cols="*" border="1">
	<frame src='OnlyMenu.do' name='menu'>
<frameset rows="*" cols="300,800,*" frameborder="Yes" border="0">
	<frame src='OnlyDepChart.do' name='left' scrolling="AUTO" noresize>
	<frame src='whois.do' name='center'>
	<frame src='spec.do' name='right'>
</frameset>
</frameset>
<body>

</body>
</html>