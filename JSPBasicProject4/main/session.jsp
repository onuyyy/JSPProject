<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 
    
    	request response session => 웹 개발의 핵심
    	
    	session은 서버에 저장한다 : 사용자의 정보를 지속적으로 관리
    		1) 장바구니, 결제, 예약, 추천
    		2) session에 저장이 되면 모든 JSP에서 사용이 가능하다 => 전역변수
    	클래스명 => HttpSession 
    				클라이언트마다 1개 생성 => id가 부여 (구분자)
    	주요 메소드 
    		String getId() : session마다 저장 구분자
    		setMaxinactiveInterval() : 저장 기간을 설정
    			=> 기본 default => 1800 (초단위 30분)
    			=> 경매
    		isNew() : ID가 할당이 된 것인지 여부 확인
    		 invalidate() : sessionx레 저장된 모든 내용을 지운다 
    		 setAttribute() : session에 정보 저장 	
    		 getAttribute() : 저장된 데이터 읽기
    		 removeAttribute() : 저장된 데이터 일부를 지울 때 사용  
    
     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Session(session)</h1>
</body>
</html>