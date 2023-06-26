package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import data_vo.futsalVO;
import vo.*;
public class FutsalDAO {

    // 연결 객체 
	private Connection conn;
	// 송수신 
	private PreparedStatement ps;
	// 오라클 URL주소 설정 
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	// 싱글턴 
	private static FutsalDAO dao;
	// 1. 드라이버 등록 => 한번 수행 => 시작과 동시에 한번 수행 , 멤버변수 초기화 : 생성자 
	public FutsalDAO()
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");

		}catch(Exception ex) {}
	}
	
	// 2. 오라클 연결 
	public void getConnection()
	{
		try
		{
			conn=DriverManager.getConnection(URL,"hr","happy");
			// conn hr/happy => 명령어를 오라클 전송 
		}catch(Exception ex) {}
	}
	
	// 3. 오리클 해제
	public void disConnection()
	{
		try
		{
			if(ps!=null) ps.close(); // 통신이 열려있으면 닫는다
			if(conn!=null) conn.close();
			// exit => 오라클 닫기 
		}catch(Exception ex) {}
	}
	
	
	// 4. 싱글턴 설정 => static은 메모리 공간이 1개만 가지고 있다 
	public static FutsalDAO newInstance() {
		
		if(dao==null)
			dao = new FutsalDAO();
		return dao;
		
	}
	
	public List<FutsalVO> futsalListData() {
		
		List<FutsalVO> list=new ArrayList<FutsalVO>();
		/*
		 * 	private int gno;
		 *	private String gname,gaddr,gimage,gnotice,gprice;
		 *
		 */
		try {
			
			getConnection();
			String sql="SELECT gname,gaddr,gimage,gnotice,gprice "
					+ "FROM ground_detail";
			
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				FutsalVO vo=new FutsalVO();
				vo.setGname(rs.getString(1));
				vo.setGaddr(rs.getString(2));
				// 이미지 & 있으면 #으로 바꾸기
				vo.setGimage(rs.getString(3));
				vo.setGnotice(rs.getString(4));
				vo.setGprice(rs.getString(5));
				list.add(vo);
				System.out.println(vo.getGname());
				
			}
			rs.close();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		
		return list;
	}
	
	
	public FutsalVO futsalDetailData(int gno) {
		
		FutsalVO vo=new FutsalVO();
		
		try {
			
			getConnection();
			String sql="SELECT * FROM ground_detail "
					+ "WHERE fno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gno);
			
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setGname(rs.getString(1));
			vo.setGaddr(rs.getString(2));
			vo.setGimage(rs.getString(3));
			vo.setGnotice(rs.getString(4));
			vo.setGprice(rs.getString(5));
			rs.close();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		
		return vo;
	}
	
	

}
