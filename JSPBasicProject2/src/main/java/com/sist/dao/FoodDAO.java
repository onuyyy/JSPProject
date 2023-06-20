package com.sist.dao;
/*
 * 1. 데이터베이스 연동
 * JDBC 라이브러리로 연결 ===> DBCP ===> ORM (MyBatis, Hibernate) => JPA
 * 						   ㅣ
 * 						1. 미리 연결 한다 / Connection 개수를 지정
 * 						2. 연결된 Connection을 얻어 온다
 * 						3. 반환 => 재사용한다					
 * 							===> 웹 프로그램의 일반화	  
 * 	
 * 
 * JDBC는 요청시마다 연결하고 닫기 반복
 * 				  ------ 연결에 소모되는 시간이 오래 걸림
 * 						 Connection의 개수를 관리 할 수 없다
 * 						 --------------- => 서버 다운될 가능성이 있다  
 * 
 */

import java.util.*;
import java.sql.*;


// 서버가 아니라 클라이언트 프로그램 (실제 서버 : 오라클)
public class FoodDAO {

	// 연결 객체 => Socket이 존재
	private Connection conn;
	// 송수신 (SQL => 결과값(데이터값))
	private PreparedStatement ps;
	
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	// 데이터베이스는 무조건 싱글턴으로 생성 => static 공간 1개
	private static FoodDAO dao;
	
	
	
	public FoodDAO() {
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		} catch(Exception ex) {}
	}
	
	
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL,"hr","happy");
		} catch(Exception ex) {}
	}
	
	
	public void disConnection() {
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch(Exception ex) {}
	}
	
	
	   public static FoodDAO newInstance()
	   {
		 
		   if(dao==null)
			   dao=new FoodDAO();
		   return dao;
	   }
	
	public List<FoodVO> foodListData() {
		
		List<FoodVO> list = new ArrayList<FoodVO>();
		
		try {
			getConnection();
			String sql = "SELECT fno,poster,name,rownum "
					+ "FROM food_location "
					+ "WHERE rownum<=20";
			ps=conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				FoodVO vo = new FoodVO();
				vo.setFno(rs.getInt(1));
				String poster = rs.getString(2);
				poster=poster.substring(0,poster.indexOf("^"));
				poster=poster.replace("#", "&");
				vo.setPoster(poster);
				vo.setName(rs.getString(3));
			}
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}
	
	// 상세보기
	public FoodVO foodDetailData(int fno) {
		
		FoodVO vo=new FoodVO();
		
		try {
			
			getConnection();
			String sql = "SELECT fno,poster,name,score,tel,type, "
					+ "time,parking,price,menu,time "
					+ "FROM food_location "
					+ "WHERE fno=?";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			vo.setFno(rs.getInt(1));
			vo.setPoster(rs.getString(2).replace("#", "&"));
			vo.setName(rs.getString(3));
			vo.setScore(rs.getDouble(4));
			vo.setTel(rs.getString(5));
			vo.setType(rs.getString(6));
			vo.setTitle(rs.getString(7));
			vo.setParking(rs.getString(8));
			vo.setPrice(rs.getString(9));
			vo.setMenu(rs.getString(10));
			vo.setTime(rs.getString(11));
			
			
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		
		return vo;
	}
	
	
	
}
