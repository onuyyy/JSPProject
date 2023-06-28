package com.sist.dao;
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class ReplyBoardDAO {

	private Connection conn;
	private PreparedStatement ps;
	
	private static ReplyBoardDAO dao;
	
	public static ReplyBoardDAO newInstance() {
		if(dao==null)
			dao=new ReplyBoardDAO();
		return dao;
	}
	
	// 주소 값 얻기
	public void getConnection() {
		
		try {
			
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp/env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
			
			
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	// 반환
	public void disConnection() {
		
		try {
			
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
			
		} catch(Exception ex) {}
		
	}
	
	// 목록 출력
	public List<ReplyBoardVO> boardListData(int page) {
		List<ReplyBoardVO> list=new ArrayList<ReplyBoardVO>();
		
		try {
			
			getConnection();
			String sql="SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD'),hit,group_tab,num "
					+ "FROM (SELECT no,subject,name,regdate,hit,group_tab,rownum as num "
					+ "FROM (SELECT no,subject,name,regdate,hit,group_tab "
					+ "FROM replyBoard ORDER BY group_id DESC, group_step ASC)) "
					+ "WHERE num BETWEEN ? AND ?";
			
			ps=conn.prepareStatement(sql);
			
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				ReplyBoardVO vo=new ReplyBoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setGroup_tab(rs.getInt(6));
				list.add(vo);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		
		return list;
	}
	
	// 총페이지
	public int boardRowCount() {
		int count=0;
		
		try {
			
			getConnection();
			String sql="SELECT COUNT(*) FROM replyBoard";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		
		return count;
	}
	
	// 상세 보기
	
	
	// insert 추가
	
	
	// 수정
	
	
	// 삭제
	
	
	// 답변하기
	
	
	// 검색
	
}
