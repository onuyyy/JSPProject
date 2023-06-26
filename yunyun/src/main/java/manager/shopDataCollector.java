package manager;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import data_vo.ShoppingMallVO;

/*
사커붐 : https://soccerboom.co.kr
상세 주소 : ul.prdList div.thumbnail a
이미지 : div.xans-element- div.thumbnail img
상품명 : table.prdTable tbody td [0]
브랜드명 : 1
원산지 : 2
소비자가 : 3 
판매가 : 4


 */

public class shopDataCollector {
	private String[] urlList = {
		"https://soccerboom.co.kr/category/%EC%A3%BC%EB%8B%88%EC%96%B4%EC%97%AC%EC%84%B1/28/", //주니어 여성 21
		"https://soccerboom.co.kr/category/%EC%B6%95%EA%B5%AC%ED%99%94%ED%92%8B%EC%82%B4%ED%99%94/29/", // 축구화 풋살화 6
		"https://soccerboom.co.kr/category/%ED%8A%B8%EB%A0%88%EC%9D%B4%EB%8B%9D%ED%99%94/30/", // 트레이닝화 8
		"https://soccerboom.co.kr/category/%EC%B6%95%EA%B5%AC%EA%B3%B5/31/", //축구공 4
		"https://soccerboom.co.kr/category/%EC%B6%95%EA%B5%AC%EC%9A%A9%ED%92%88/32/", //축구용품 34
		"https://soccerboom.co.kr/category/%EA%B3%A8%ED%82%A4%ED%8D%BC%EC%9A%A9%ED%92%88/33/", //골피커용품 4
		"https://soccerboom.co.kr/category/%EA%B8%B0%EB%8A%A5%EC%84%B1%EC%9B%A8%EC%96%B4/355/", // 기능성웨어 5
		"https://soccerboom.co.kr/category/%EC%9C%A0%EB%8B%88%ED%8F%BC/34/", //유니폼 32
		"https://soccerboom.co.kr/category/%EC%9D%98%EB%A5%98/35/", //의류 62
		"https://soccerboom.co.kr/category/%ED%83%80%EC%A2%85%EB%AA%A9/37/", //타종목 4
	};
	private int[] no = {
			21,6,8,4,34,4,5,32,62,4
	};
	public shopDataCollector() {
		try {
			for(int i=0;i<urlList.length;i++) {
				
				for(int a=1;a<=no[i];a++) {
					Document doc = Jsoup.connect(urlList[i]+"?page="+a).get();
					
					Elements url = doc.select("ul.prdList div.thumbnail a");
					
					for(int j=0;j<url.size();j++) {
						doc = Jsoup.connect("https://soccerboom.co.kr" + url.get(j).attr("href")).get();
						
						Element image = doc.selectFirst("div.xans-element- div.thumbnail img");
						Elements info = doc.select("table.prdTable tbody td");
						Elements size = doc.select("tbody.xans-element- option");
						Element detailImage = doc.selectFirst("div.xans-product-detail div.cont img:not([src^=data]):last-of-type");
						
						System.out.println(i+"카테고리 "+a+"페이지 "+j+"번");
						System.out.println(url.get(j).attr("href")); //상세페이지 링크
						System.out.println("https:"+image.attr("src")); // 상품 이미지
						System.out.println(info.get(0).text());//상품명
						System.out.println(info.get(1).text());//브랜드명
						System.out.println(info.get(2).text());//원산지
						System.out.println(info.get(3).text());//소비자가
						System.out.println(info.get(4).text());//판매가
						String st=""; // 옵션(사이즈)
						for(int k=2;k<size.size();k++) {
							st += size.get(k).text() + "^";
						}
						st = st.substring(0, st.lastIndexOf("^"));
						System.out.println(st);
						String temp=null; // 상품 상세 이미지
						if(detailImage != null) {
							temp=detailImage.attr("src");
							if(temp.startsWith("//")) {
								temp = "https:" + temp;
							} else {
								temp = "https://soccerboom.co.kr" + temp;
							}
							if(temp.contains("test")) {
								temp = null;
							}
						}
						System.out.println(temp);
						System.out.println("======================");
						
//						ShoppingMallVO vo = new ShoppingMallVO();
//						vo.setImage(image.attr("src"));
//						vo.setName(info.get(0).text());
					}
				}
				
			}
			System.out.println("완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		shopDataCollector sdc = new shopDataCollector();
		
	}
}
