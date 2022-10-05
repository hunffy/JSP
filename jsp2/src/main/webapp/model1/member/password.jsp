<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jsp2/src/main/webapp/model1/member/password.jsp 
     
     1. 로그아웃상태인 경우. 로그인 하세요. 메세지 출력
        opener 페이지를 loginForm.jsp 페이지 이동.
           현재페이지 닫기.
     2. pass,chgpass 파라미터 값 저장
     
     3. pass 비밀번호가 db에 저장된 비밀번호와 틀리면
        비밀번호 오류 메세지 출력. passwordForm.jsp 페이지 이동
        
     4. pass 비밀번호가 db에 저장된 비밀번호와 같으면 =>비밀번호 검증완료
        MemberDao.updatePass(login.chgpass) => 새로운 비밀번호로 수정
        비밀번호 수정 성공.
        -메세지 출력후 opener 페이지를 info.jsp 페이지 이동. 
          현재페이지 닫기
        
         비밀번호 수정 실패.
        -메세지 출력후 opener 페이지를 updateForm.jsp페이지 이동.
         현재페이지 닫기.
--%>


<% 
   String login = (String)session.getAttribute("login");
	boolean opener = true;
	boolean closer = true;
	String msg = null;
	String url = null;
	
	//1.로그아웃상태인 경우.
	if(login == null){
		msg = "로그인 하세요";
		url = "loginForm.jsp";
		
	//2. 파라미터값 저장
	}else {
		String pass = request.getParameter("pass");
		String chgpass = request.getParameter("chgpass");
	
		//3번을위한 변수선언
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		
		//4번
		if(pass.equals(mem.getPass())) { //pass:입력값  mem.getPass() : db에저장된 pass값 비밀번호 일치
			if(dao.updatePass(login,chgpass)){ //결과가 true면 비밀번호가 정상변경
				msg = "비밀번호가 변경되었습니다";
				url = "info.jsp?id="+login;
			}else{	//비밀번호 변경실패
				msg = "비밀번호 변경시 오류가 발생했습니다.";
				url = "updateForm.jsp?id="+login;
			}
			
		}else{ //비밀번호 오류, 기존비밀번호와 등록된 비밀번호가 틀린경우
			//3. pass 비밀번호가 db에 저장된 비밀번호와 틀리면 
			// 비밀번호 오류. 메시지출력, 현재페이지를 passwordForm.jsp로 이동
			msg ="비밀번호가 틀렸습니다.";
			closer=false;
			opener=false;
			url = "passwordForm.jsp";
		}
	}
   %>
   <script type="text/javascript">
   	alert("<%=msg%>")
   	<% if (opener) {%> 			//opener가 true일때
   		opener.location.href="<%=url%>"
   	<% } else {%> 				//opener가 false일때 현재페이지(새창)를 url값으로 변경
   		location.href="<%=url%>"
   	<%}%>
   	<% if (closer) {%>
   		self.close()
   <%}%>
   </script>