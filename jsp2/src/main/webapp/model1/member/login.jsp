<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
    
  1. 아이디, 비밀번호 파라미터를 변수에 저장 
  2. db 정보를 읽기. id에 해당하는 db정보를 읽어서 Member 객체에 저장 
     Member MemberDao.selectOne(id);
  3. 아이디와 비밀번호 검증. 
    - 아이디가 없는 경우      
       아이디가 없습니다. 메세지확인. loginForm.jsp 페이지 이동
    - 아이디 존재. 비밀번호가 틀린경우   
       비밀번호오류 메세지확인. loginForm.jsp 페이지 이동
    - 아이디 존재. 비밀번호가 맞는경우 => 정상적인 로그인.
      session 객체에 로그인 정보 저장.
      main.jsp로 페이지 이동.
     --%>
 <%
 	//1.아이디와 비밀번호 파라미터를 변수에 저장         
 	String id = request.getParameter("id"); //입력한 id값.
 	String pass = request.getParameter("pass"); //입력한 pass값
 	
 	//2. db 정보를 읽기. id에 해당하는 db정보를 읽어서 Member 객체에 저장
 	MemberDao dao = new MemberDao();
 	
 	//id 존재 : db의 id에해당하는 내용 저장
 	//id 존재안하면 : null값 전달
 	Member mem = dao.selectOne(id); //(id)입력한 id값
 	String msg = null;
 	String url = null;
 	
 	if(mem == null){ //아이디가 없는경우
 		msg = "아이디가 틀립니다.";
 		url = "loginForm.jsp";
 		
 	} else if(!pass.equals(mem.getPass())) {//아이디는 존재, 비밀번호가 틀린경우
 		//pass : 화면에서 입력된 비밀번호
 		//mem.getPass() : db에 등록된 아이디의 비밀번호
 		msg = "비밀번호가 틀립니다.";
 		url = "loginForm.jsp";
 	}else{ //아이디존재,비밀번호 일치하는경우 ->정상적인 로그인 상태
 		session.setAttribute("login",id); //session에 로그인 정보 저장
 		msg = "반갑습니다." +  mem.getName() + "님";
 		url = "main.jsp";
 	}
 %>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>