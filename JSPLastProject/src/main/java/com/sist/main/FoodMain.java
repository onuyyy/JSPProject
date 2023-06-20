package com.sist.main;

import java.util.*;
import java.util.concurrent.ThreadPoolExecutor.DiscardOldestPolicy;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.sist.dao.*;

public class FoodMain {

	
	public static void main(String[] args) {
		
		
		FoodDAO dao = FoodDAO.newInstance();
		
		try {
			
			// 사이트 연결 아래 주소를 다 읽어 온다
			Document doc = Jsoup.connect("https://www.mangoplate.com/").get();
			
			// 태그를 읽어 온다 => 구분 (class,id) => selector
			Elements title = doc.select("div.top_list_slide div.info_inner_wrap span.title");
			Elements subject = doc.select("div.top_list_slide div.info_inner_wrap p.desc");
			Elements poster = doc.select("div.top_list_slide img.center-croping");
			Elements link = doc.select("div.top_list_slide a");
			
			// 태그와 태그 사이 값, 태그 안에 속성 값 읽기
			//    text()			attr() : a, href, ...
			// 속성 선택자 => img[src*=""]
			
			for(int i=0; i<title.size(); i++) {
				System.out.println(i+1);
				System.out.println("제목 : "+title.get(i).text());
				System.out.println("부제목 : "+subject.get(i).text());
				System.out.println("포스터 : "+poster.get(i).attr("data-lazy"));		
				System.out.println("링크 : "+link.get(i).attr("href"));	
				System.out.println("=============================================");
				
				CategoryVO vo = new CategoryVO();
				vo.setTitle(title.get(i).text());
				vo.setSubject(subject.get(i).text());
				
				String p = poster.get(i).attr("data-lazy");
				p = p.replace("&", "#");
				/*
				 * https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/hdlt0tolh0mpvmqg.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80
				 * => 이미지 볼때 &를 바꿔둬야 함
				 */
				
				vo.setPoster(p);
				vo.setLink("https://www.mangoplate.com"+link.get(i).attr("href"));
				dao.foodCategoryInsert(vo);
				
			}
			
			System.out.println("저장 완료");
			
		} catch(Exception ex) {} 
		

	}

}
