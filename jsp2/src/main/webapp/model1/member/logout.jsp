<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--/jsp2/src/main/webapp/model1/member/logout.jsp 
    1. session에 등록되어있는 로그인정보 제거하기.
    2. loginForm.jsp페이지로 이동
    --%>
<% 
//1. session에 등록되어있는 로그인정보 제거하기.
	session.removeAttribute("login"); //login 속성만 제거하는방법. session 유지
	
	session.invalidate(); //기존 session 제거. session 새로 할당 ()

//2. loginForm.jsp페이지로 이동
	response.sendRedirect("loginForm.jsp");

%>