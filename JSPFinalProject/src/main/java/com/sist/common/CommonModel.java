package com.sist.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

public class CommonModel {
	
	public static void commonRequestData(HttpServletRequest request) {
		
		// footer 밑에 출력
		FoodDAO dao=FoodDAO.newInstance();
		
		
		// => 공지사항 => 
		// => 방문 맛집
		List<FoodVO> fList=dao.foodTop7();
		request.setAttribute("fList", fList);
							//------ 얘가 충돌하면 안 된다 다른 곳에서 list를 이미 사용했음
		
		
	}
	
}
