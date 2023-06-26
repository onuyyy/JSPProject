package manager;

import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import data_dao.futsalDAO;
import data_vo.*;

import java.net.*;
import java.io.*;

//JSON
//https://www.plabfootball.com/api/v2/matches/?sch=2023-05-30&region=me&page_size=500&ordering=schedule
//사이트(id값만 다름)
//https://www.plabfootball.com/match/{id}/
//구장 특이사항
//https://www.plabfootball.com/api/v2/matches/{id}/

/*
 	Jsoup 
 	
	poster : div.content__header div.contentHero img
	name : div.content__body h1.txtH
	address : div.content__body span.stadium-info__address
 */
public class dataCollector {
//	private final String jsonURL = "https://www.plabfootball.com/api/v2/matches/?sch=2023-05-30&region=me&page_size=500&ordering=schedule";
	private static List<String> urlList = new ArrayList<String>();
	private static List<String> jsonList = new ArrayList<String>();
	private static List<futsalVO> list = new ArrayList<futsalVO>();
	
	
	public dataCollector() {
		Map<String, Boolean> dCheck = new HashMap<String, Boolean>();
		Map<Integer, Integer> map = new HashMap<Integer,Integer>();
		try {
			int count=0;
			int k;
			//i : 일
			for(int i=1;i<=30;i++) {
				String jsonURL = "https://www.plabfootball.com/api/v2/matches/?sch=2023-06-"+i+"&region=me&page_size=500&ordering=schedule";
				// URL 설정
	            URL url = new URL(jsonURL);

	            // JSON 데이터 가져오기
	            BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
	            StringBuilder jsonContent = new StringBuilder();
	            String line;
	            while ((line = reader.readLine()) != null) {
	                jsonContent.append(line);
	            }
	            reader.close();
	            
	            // JSON 데이터 파싱
	            JsonParser parser = new JsonParser();
	            JsonObject jsonObject = parser.parse(jsonContent.toString()).getAsJsonObject();
	            JsonArray resultsArray = jsonObject.getAsJsonArray("results");

	            // resultsArray에 포함된 개별 JSON 객체 가져오기
	            for (k = 0; k < resultsArray.size(); k++) {
	                JsonObject resultObject = resultsArray.get(k).getAsJsonObject();
	                String id = resultObject.get("id").getAsString();
	                
	                //JSON에 있는 id값 url에 매칭
	                urlList.add("https://www.plabfootball.com/match/" + id + "/");
	                jsonList.add("https://www.plabfootball.com/api/v2/matches/"+id+"/");
	            }
	            
	            for(k=0;k<urlList.size();k++) {
	            	Document doc = Jsoup.connect(urlList.get(k)).get();
	            	Elements poster = doc.select("div.content__header div.contentHero img");
	            	boolean check=false;
	            	if(poster.isEmpty()) {
	            		check=true;
	            		poster = doc.select("div.content__header div.contentHero div.stadGal div");
	            	}
	            	Element name = doc.selectFirst("div.content__body h1.txtH");
	            	if(dCheck.get(name.text())!=null) {
	            		continue;
	            	}
	            	dCheck.put(name.text(), true);
	            	Element address = doc.selectFirst("div.content__body span.stadium-info__address");
	            	String info = stadium_info(jsonList.get(k));
	            	
	            	futsalVO vo = new futsalVO();
	            	vo.setFno(count);
	            	vo.setName(name.text());
	            	vo.setAddress(address.text());
	            	vo.setInfo(info);
	            	
	            	String posters="";
	            	if(check) {
	            		for(int j=0;j<poster.size();j++) {
	            			String temp=poster.get(j).attr("style");
	                		posters += temp.substring(temp.indexOf("(")+1, temp.indexOf(")")) + "^";
	                	}
	            	} else {
	            		for(int j=0;j<poster.size();j++) {
	                		posters += poster.get(j).attr("src") + "^";
	                	}
	            	}
	            	posters = posters.substring(0, posters.lastIndexOf("^"));
	            	posters = posters.replace("&", "#"); // 없어도 될듯
	            	vo.setPoster(posters);
	            	
	            	System.out.println(i);
	            	System.out.println(vo.getFno());
	            	System.out.println(vo.getName());
	            	System.out.println(vo.getAddress());
	            	System.out.println(posters);
	            	System.out.println("=======================");
	            	
	            	list.add(vo);
	            	count++;
	            }
	            map.put(i, k);
	            urlList.clear();
	            jsonList.clear();
			}
			
            for(Map.Entry<Integer, Integer> entry:map.entrySet()) {
                System.out.println(entry.getKey() + " : " + entry.getValue());
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        }
		
	}
	
	public void insertFutsalData() {
		futsalDAO dao = futsalDAO.newInstance();
        dao.InsertfutsalData(list);
	}
	
	public String stadium_info(String jsonUrl) {
		StringBuffer buffer = new StringBuffer();
		
		try {
			// URL 설정
            URL url = new URL(jsonUrl);
			// JSON 데이터 가져오기
            BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
            StringBuilder jsonContent = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                jsonContent.append(line);
            }
            reader.close();
            String jsonString = jsonContent.toString();
            JsonParser parser = new JsonParser();
            JsonObject jsonObject = parser.parse(jsonString).getAsJsonObject();
            String result=jsonObject.get("stadium_intro").getAsString();
            
            for(String s:result.split("\n")) {
            	buffer.append(s.trim()+"\n");
            }
            
//	            System.out.println(buffer);
            
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return buffer.toString();
	}
	
	
	public static void main(String[] args) {
		dataCollector dc = new dataCollector();
		dc.insertFutsalData();
	}
	
	
}
