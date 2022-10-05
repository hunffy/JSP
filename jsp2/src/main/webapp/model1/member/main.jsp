<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--/jsp2/src/main/webapp/model1/member/main.jsp 
    
    1. 로그인 여부 검증
    	로그인상태 : 화면 보여주기
    	로그아웃상태 : 로그인하세요. 메세지 출력 후 loginForm.jsp로 이동
    --%>
<%
	//로그인 상태 검증
	// login : login된 아이디 값이 존재 -> 로그인 상태.
	String login = (String)session.getAttribute("login"); //login.jsp페이지 else구문에 정의되어있음
	
	//로그인상태
	if(login != null){ 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<body>
<h3><%=login %>로 로그인 되었습니다.</h3>
<h3><a href="logout.jsp">로그아웃</a></h3>
<h3><a href="info.jsp?id=<%=login%>">회원정보보기</a></h3> <%-- id= <%=login%> 아이디입력값 --%>
<% if(login.equals("admin")) { //여기서 login은 세션에등록된 id값.로그인 아이디가 admin(관리자)인 경우  %>
<h3><a href="list.jsp">회원목록보기</a></h3>
<% } %>
</body>
</html>


<% } else {//로그아웃 상태%>
<script type="text/javascript">
alert("로그인하세요") 
location.href="loginForm.jsp"
</script> 
<% } %>