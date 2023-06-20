package com.sist.dao;

import java.util.*;
import java.sql.*;

public class FoodDAO {

	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:xe";
	private static FoodDAO dao;
	
	public FoodDAO() {

		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception ex) {}
	}
	
	public void getConnection() {
	
		try {
			conn = DriverManager.getConnection(URL,"hr","happy");
		} catch(Exception ex) {}
	
	}
	
	public void disConnecction () {
		
		try {
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch(Exception ex) {}
		
	}
	
	
	public static FoodDAO newInstance() {
		
		if(dao==null) 
			dao = new FoodDAO();
			return dao;

	}
	
	
	// 카테고리 추가
	public void foodCategoryInsert(CategoryVO vo) {
		
		try {
			
			getConnection();
			String sql = "INSET INTO foodCategory VALUES("
					+ "pc_cno_seq.nextval, ?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getPoster());
			ps.setString(4, vo.getLink());
			
			ps.executeUpdate();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnecction();
		}
		
		
	}
	
	
	public List<CategoryVO> food_category_data() {
		
		List<CategoryVO> list = new ArrayList<CategoryVO>();
		
		try {
			
			getConnection();
			// order by 말고 index 사용해라
			String sql = "SELECT /*+INDEX_ASC(foodCategory pc_cno_pk)*/cno,title,subject,poster,link"
					+ "FROM foodCategory";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				CategoryVO vo = new CategoryVO();
				vo.setCno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setSubject(rs.getString(3));
				
				String p = rs.getString(4);
				p = p.replace("#", "&");
				vo.setPoster(p);
				list.add(vo);
				
			}
			rs.close();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnecction();
		}
		return list;
	
	}
	
	
}