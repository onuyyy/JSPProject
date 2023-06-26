package data_dao;

import java.sql.*;
import java.util.*;

import com.sist.dbconn.CreateDatabase;

import data_vo.futsalVO;

public class futsalDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDatabase db=new CreateDatabase();
	private static futsalDAO dao;
	
	public static futsalDAO newInstance() {
		if(dao == null)
			dao = new futsalDAO();
		
		return dao;
	}
	
	public void InsertfutsalData(List<futsalVO> list) {
		
		try {
			conn = db.getConnection();
			for(int i=0;i<list.size();i++) {
				String sql = "INSERT INTO ground_detail(fno,pname,gaddr,gnotice,gimage) "
							+ "VALUES(gd_no_seq.nextval,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setString(1, list.get(i).getName());
				ps.setString(2, list.get(i).getAddress());
				ps.setString(3, list.get(i).getInfo());
				ps.setString(4, list.get(i).getPoster());
				
				ps.executeUpdate();
				ps.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		System.out.println("저장 완료");
	}
}
