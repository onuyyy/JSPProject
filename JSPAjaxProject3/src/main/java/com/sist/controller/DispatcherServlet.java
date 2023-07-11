package com.sist.controller;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import com.sist.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * 	스프링의 MVC 구조
 * 
 * 	화면단 (view 단) : JSP => EL/JSTL
 * 	구현단 (비지니스 로직) : Java => 데이터베이스 연결 (요청 처리)
 * 	연결 (화면, 구현) : 서블릿 => controller
 * 
 * 	model 1 (순수하게 jsp) => 분석 편리 / 단점 : 확장성, 재사용 어려움
 * 	model 2 (jsp/java) => 동시 개발, 확장성, 재사용 용이 / 단점 : 복합성
 * 					   => controller에 집중
 * 	domain : controller를 나눠서 분산 작업
 * 			
 * 	mvc의 동작 구조
 * 	* controller를 찾는 방법
 * 
 * 		
 * 	** 이미 만들어진 메소드 호출 (재호출) : redirect
 * 	   새로운 데이터를 JSP로 전송 : forward
 * 
 * 	어노테이션 : if를 대체 / index (찾기 중심) / a로 들어오면 A 처리, b로 들어오면 B로 처리한다
 * 
 * 
 */

		// url 주소 => .do로 들어오면 controller를 찾겠다 
@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	List<String> clsList=new ArrayList<String>();


	public void init(ServletConfig config) throws ServletException {
		
		clsList.add("com.sist.model.DiaryModel");
		
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 사용자가 보내준 URI 주소 읽어 오기
		String cmd=request.getRequestURI();
		// http://localhost/JSPAjaxProject3/diary3/diary.do
		// 	 				------------------------------- uri	
		
		System.out.println("cmd="+cmd);
		cmd=cmd.substring(request.getContextPath().length()+1);
		System.out.println("cmd="+cmd);
		
		try {
			
			// 메소드 찾아서 호출
			for(String cls:clsList) {
				
				// 클래스 정보 읽기
				Class clsNmae=Class.forName(cls);
				// 클래스 메모리 할당
				Object obj=clsNmae.getDeclaredConstructor().newInstance();
				// 메소드 전체를 읽어 온다
				Method[] methods=clsNmae.getDeclaredMethods();
				
				// 메소드 위에 있는 어노테이션 읽기
				for(Method m:methods) {
					RequestMapping rm=m.getAnnotation(RequestMapping.class);
					if(rm.value().equals(cmd)) {
						// 조건에 맞는 메소드를 호출해라
						String jsp=(String)m.invoke(obj, request, response);
						// request를 보내주고 결과 값을 담아서 들어온다
						RequestDispatcher rd=request.getRequestDispatcher(jsp);
						rd.forward(request, response);
					}
				}
				
			}
			
		} catch(Exception ex) {}
		
	}

}
