package chap1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//요청 URL : 요청	페이지 설정 
//http://localhost:8088/chap1/currentTime 요청시 호출되도록 설정
@WebServlet("/currentTime")
public class currentTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public currentTime() {
        super();
    }

	//get방식 요청인 경우 호출되는 메서드
    //request : 요청객체
    //response : 응답객체
	protected void doGet(HttpServletRequest request,  
	HttpServletResponse response) throws ServletException, IOException { 
		response.setContentType("text/html; charset=UTF-8");
		
		Calendar c = Calendar.getInstance();
		int h = c.get(Calendar.HOUR_OF_DAY);
		int m = c.get(Calendar.MINUTE);
		int s = c.get(Calendar.SECOND);
		
		PrintWriter out = response.getWriter();	//문자형 출력
		out.println("<html><head><title>현재시간</title></head>");
		out.println("<body>");
		out.println("<h1>현재시간:"+h+"시"+m+"분"+s+"초");
		out.println("</body></html>");
	}

	//post방식 요청인 경우 호출되는 메서드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
