package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.MemberDto;
import mysql.DbConnect;

public class MemberDao {
 DbConnect db=new DbConnect();
 
 //아이디 체크
 
 public int isIdCheck(String id) {
	 int isid=0;
	 
	 Connection conn=db.getConnection();
	 PreparedStatement pstmt=null;
	 ResultSet rs=null;
	 
	 String sql="select count(*) from member where id=?";
	 
	 try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		if(rs.next())
		{
			if(rs.getInt(1)==1)
				isid=1;
			//isid=rs.getInt(1);
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	 return isid;
 }
 
 public void insertMember(MemberDto dto) {
	 Connection conn=db.getConnection();
	 PreparedStatement pstmt=null;
	 
	 String sql="insert into member values(null,?,?,?,?,?,?,now())";
	 try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getId());
		pstmt.setString(3, dto.getPass());
		pstmt.setString(4, dto.getHp());
		pstmt.setString(5, dto.getAddr());
		pstmt.setString(6, dto.getEmail());
		pstmt.execute();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.dbClose(pstmt, conn);
	}
 }
 
 public String getName(String id) {
	 String name="";
	 Connection conn=db.getConnection();
	 PreparedStatement pstmt=null;
	 ResultSet rs=null;
	 
	 String sql="select name from member where id=?";
	 
	 try {
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			name=rs.getString("name");
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.dbClose(rs, pstmt, conn);
	}
	 
	 return name;
	 
 }
}
