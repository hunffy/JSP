<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간단한 select 구문 실행 결과 확인</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<form method="post">
<textarea cols="60" rows="5" name="sql"></textarea>
   <input type="submit"  value="실행" >
</form>

</body>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");

Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","kic","1234");

Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("");


ResultSetMetaData rsmt = rs.getMetaData();
%>

<table><tr>
<% for(int i=1; i<=rsmt.getColumnCount(); i++){ %>
<th><%=rsmt.getColumnName(i) %></th>
<% }%> </tr>

<% while(rs.next()) {%>
<tr>
<% for(int i=1; i<=rsmt.getColumnCount(); i++) {%>
<td><%=rs.getString(i) %></td>
<% } %>
</tr>
<% } %>
</table>
</html>