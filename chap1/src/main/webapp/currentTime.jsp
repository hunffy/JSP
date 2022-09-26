<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
   <%-- src/main/webapp/currentTime.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재시간</title>
</head>
<body>
<%//자바 영역
	Calendar c = Calendar.getInstance();
	int h = c.get(Calendar.HOUR_OF_DAY);
	int m = c.get(Calendar.MINUTE);
	int s = c.get(Calendar.SECOND);
		
%>
<h1>현재시간:<%=h %>시<%=m %>분<%=s %>초</h1>
실제 웹어플리케이션 폴더 : <%= request.getRealPath("/") %>
</body>
</html>