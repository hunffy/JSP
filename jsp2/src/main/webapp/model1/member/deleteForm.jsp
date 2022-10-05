<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jsp2/src/main/webapp/model1/member/deleteForm.jsp 
  1. id 파라미터 저장하기
  2. login 여부 검증하기
  	 -로그아웃 상태인 경우
  	 	로그인하세요. 메세지 출력 후 loginForm.jsp 페이지로 이동
  	 =관리자가 아니면서 id 파라미터 정보와 login 정보가 다른 경우
  	 	본인만 탈퇴 가능합니다. 메세지 출력 후 main.jsp 페이지로이동.
  3.화면출력하기	 
--%>
<%
	//1.id 파라미터 저장하기
	String id = request.getParameter("id");

	//2.로그인정보 가져오기
	String login = (String)session.getAttribute("login");
	
	//로그인여부검증. 로그아웃상태
	if(login==null){%> 
	<script type="text/javascript">
	alert("로그인하세요")
	location.href="loginForm.jsp"
	</script>
	
	<%--관리자도아니고, 본인도아닌경우 --%>
	<%}else if(!login.equals("admin")&& !id.equals(login)){%>
	<script type="text/javascript">
	alert("본인만 탈퇴 가능합니다")
	location.href="main.jsp"
	</script>
	
	<%--본인인경우 비밀번호 확인 후 탈퇴페이지로 이동 --%>
	<%}else{%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 전 비밀번호 입력</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
function inputcheck(f) {
	if(f.pass.value ==""){
		alert("비밀번호를 입력하세요")
		f.pass.focus()
		return false
	}
}
</script>
</head> 
<body>
<form action="delete.jsp" method="post"
						onsubmit="return inputcheck(this)"> <%--onsubmit="return inputcheck(this) : 비밀번호검증 --%>
<input type="hidden" name="id" value="<%=id%>">
<table><caption>회원비밀번호 입력</caption>
<tr><th>비밀번호</th><td><input type="password" name="pass" /></td></tr>
<tr><td colspan="2"><input type="submit" value="탈퇴하기" /></td></tr>
</table></form></body></html>
<%}%>