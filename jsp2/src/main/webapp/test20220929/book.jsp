<%@page import="bookmodel.MemberDao"%>
<%@page import="bookmodel.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
    request.setCharacterEncoding("UTF-8");
 	
 	Member mem = new Member();
 	
 	mem.setWrite(request.getParameter("writer"));
 	mem.setTitle(request.getParameter("title"));
 	mem.setContent(request.getParameter("content"));
 	
 	MemberDao Dao = new MemberDao();
 	if(dao.insert(mem)){
 		
 	
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<table>
	<tr><td>작성자</td><td><%=mem.getWriter() %></td></tr>
	<tr><td>제목</td><td><%=mem.getTitle() %></td></tr>
	<tr><td>내용</td><td><%=mem.getContent() %></td></tr>
</table>
</body>
</html>