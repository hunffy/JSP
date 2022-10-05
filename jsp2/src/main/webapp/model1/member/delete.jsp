<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/jsp2/src/main/webapp/model1/member/delete.jsp

    1. 파라미터값 변수에 저장
    2. method 방식이 post 여부 확인.
    3. id가 관리자인경우는 탈퇴 불가. list.jsp 페이지로이동
    == 추가: 로그인 여부(3-1), 본인탈퇴 여부 검증(3-2) 추가
    4. 비밀번호 검증
       관리자가 강제 탈퇴하려는 경우 	: 관리자비밀번호
       본인 탈퇴인 경우			  	: 본인비밀번호
       
       비밀번호 불일치 : 비밀번호 오류 메세지 출력 후 deleceForm.jsp 페이지로 이동
    5. 비밀번호 일치하는 경우 : 
    	boolean MemberDao().delete(id) 메서드 호출
    	
    	회원정보 삭제 성공 : 
    		일반사용자 : 로그아웃실행.
    				  탈퇴 성공메세지 출력. loginForm.jsp 페이지로 이동
    		관리자 : 탈퇴 성공 메세지 출력. list.jsp 페이지로 이동 
    		
    	회원정보 삭제 실패 : 
    		일반사용자 : 탈퇴실패 메세지 출력. deleteForm.jsp페이지로 이동
    		관리자	: 탈퇴실패 메세지 출력. list.jsp 페이지로 이동
--%>
<%	// 1. 파라미터값 변수에 저장
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = (String)session.getAttribute("login");
	
	
	//2. method = POST 여부 확인. get방식은 파라미터가 url로 post방식은 눈에보이지않음.
	String msg = null;
	String url = null;
	if( !request.getMethod().equals("POST")){ //get인경우는 보안이취약(url에 개인정보누출)
		msg = "입력방식이 오류입니다.";
		url = "deleteForm.jsp?id="+id;
		
	//3. 아이디가 관리자인경우 탈퇴불가. list.jsp 페이지로 이동
	}else if(id.equals("admin")){ //id : 로그인된 id
		msg = "관리자는 탈퇴 불가합니다";
		url = "list.jsp";
		
	//3-1. 로그아웃 상태인 경우 오류 검증
	}else if (login == null){
		msg ="로그인 하세요";
		url ="loginFrom,jsp";
	
	//3-2. 본인 탈퇴 검증
	}else if(!login.equals("admin") && id.equals(login)){
		msg ="본인만 탈퇴 가능합니다.";
		url ="main.jsp";
		
	}else{ //기본검증이 완료가 된 상태
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		
		//4. 비밀번호 검증 비밀번호 틀린경우
		//pass: 입력된 비밀번호 
		//mem.getPass() : DB에 등록된 비밀번호
		if(!pass.equals(mem.getPass())){
			msg ="비밀번호 오류";
			url = "deleteForm.jsp?id=" + id;
		//비밀번호 맞는경우
		}else{
			
			//5. 비밀번호 일치하는경우
			if(dao.delete(id)){
				msg = id + "회원이 탈퇴 되었습니다.";
				
		
				//관리자인경우(회원정보삭제성공)
				if(login.equals("admin")){
					url = "list.jsp";
				}else {	//일반사용자인 경우(회원정보삭제성공)
					session.invalidate(); //세션에 모든정보가 날아감. 초기화 -> 로그아웃
					url = "loginForm.jsp";
				}
			}else {	//회원정보 삭제시 DB에서 오류발생 한 경우
				msg = id + "회원 탈퇴 실패";
				if(login.equals("admin")){//관리자(회원정보삭제실패)
					url = "list.jsp";
				}else{//일반사용자(회원정보삭제실패)
					url = "deleteForm.jsp?id="+id;
				}
			}
		}
	}
	


%>
<script type="text/javascript">
alert("<%=msg%>")
location.href="<%=url%>"
</script>
