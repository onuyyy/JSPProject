package com.sist.temp;
/*
 *   CREATE TABLE reserve_day(
	   rno NUMBER,
	   rday NUMBER CONSTRAINT rd_rday_nn NOT NULL,
	   time VARCHAR2(200) CONSTRAINT rd_time_nn NOT NULL,
	   CONSTRAINT rd_rno_pk PRIMARY KEY(rno)
	);
 */
import java.util.*;
import java.sql.*;
public class ReserveMain {
    private Connection conn;
    private PreparedStatement ps;
    private final String URL="jdbc:oracle:thin:@211.238.142.111:1521:XE";
    public ReserveMain()
    {
    	try
    	{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    	}catch(Exception ex) {}
    }
    public void getConnection()
    {
    	try
    	{
    		conn=DriverManager.getConnection(URL,"hr","happy");
    	}catch(Exception ex) {}
    }
    public void disConnection()
    {
    	try
    	{
    		if(ps!=null) ps.close();
    		if(conn!=null) conn.close();
    	}catch(Exception ex) {}
    }
    
    
    public void reserveDayInsert(int day,String time)
    {
    	try
    	{
    		getConnection();
    		String sql="INSERT INTO football_reserve_day VALUES("
    				  +"(SELECT NVL(MAX(rno)+1,1) FROM football_reserve_day),?,?)";
    		ps=conn.prepareStatement(sql);
    		ps.setInt(1, day);
    		ps.setString(2, time);
    		ps.executeUpdate();
    				
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    }
    
    
    public List<Integer> FootballGetGnoData()
    {
    	List<Integer> list=
    			new ArrayList<Integer>();
    	try
    	{
    		getConnection();
    		String sql="SELECT gno FROM ground_detail "
    				  +"ORDER BY gno ASC";
    		ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next())
    		{
    			list.add(rs.getInt(1));
    		}
    		rs.close();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    	return list;
    }
    
    public String reserveDayData()
    {
    	String result="";
    	int[] com=new int[(int)(Math.random()*10)+10];
    	int rand=0;
    	// 중복여부 확인
    	boolean bCheck=false;
    	for(int i=0;i<com.length;i++)
    	{
    		bCheck=true;
    		while(bCheck)
    		{
    			rand=(int)(Math.random()*31)+1;
    			bCheck=false;
    			for(int j=0;j<i;j++)
    			{
    				if(com[j]==rand)
    				{
    					bCheck=true;
    					break;
    				}
    			}
    		}
    		com[i]=rand;
    	}
    	Arrays.sort(com);
    	System.out.println(Arrays.toString(com));
    	for(int i=0;i<com.length;i++)
    	{
    		result+=com[i]+",";
    	}
    	result=result.substring(0,result.lastIndexOf(","));
    	return result;
    }
    
    
    public void footballReserveDayUpdate(int gno,String rday)
    {
    	try
    	{ 
    		getConnection();
    		String sql="UPDATE ground_detail SET "
    				  +"football_reserve_day=? "
    				  +"WHERE gno=?";
    		ps=conn.prepareStatement(sql);
    		ps.setString(1, rday);
    		ps.setInt(2, gno);
    		ps.executeUpdate();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	finally
    	{
    		disConnection();
    	}
    }
    
    
    public String reserveTimeData()
    {
    	String result="";
    	int[] com=new int[(int)(Math.random()*7)+5];
    	int rand=0;
    	// 중복여부 확인
    	boolean bCheck=false;
    	for(int i=0;i<com.length;i++)
    	{
    		bCheck=true;
    		while(bCheck)
    		{
    			rand=(int)(Math.random()*22)+1;
    			bCheck=false;
    			for(int j=0;j<i;j++)
    			{
    				if(com[j]==rand)
    				{
    					bCheck=true;
    					break;
    				}
    			}
    		}
    		com[i]=rand;
    	}
    	Arrays.sort(com);
    	System.out.println(Arrays.toString(com));
    	for(int i=0;i<com.length;i++)
    	{
    		result+=com[i]+",";
    	}
    	result=result.substring(0,result.lastIndexOf(","));
    	return result;
    }
    
    
	public static void main(String[] args) {
		
		ReserveMain rm=new ReserveMain();
		rm.reserveTimeData();
		for(int i=1;i<=31;i++)
		{
			String s=rm.reserveTimeData();
			rm.reserveDayInsert(i, s);
		}
        System.out.println("저장 완료!!");
		List<Integer> list=rm.FootballGetGnoData();
		
		for(int gno:list)
		{
			String s=rm.reserveDayData();
			rm.footballReserveDayUpdate(gno, s);
		}
		
		System.out.println("저장 완료!!");
		
	}

}