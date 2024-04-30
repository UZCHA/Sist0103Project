package test1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mysql.DbConnect;

public class TestDao {
	DbConnect db=new DbConnect();
	
	//회원가입
	public void insertTest(TestDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into test1 values(null,?,?,?,?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getNick());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getPass());
			pstmt.setString(5, dto.getHp1());
			pstmt.setString(6, dto.getHp2());
			pstmt.setString(7, dto.getBirth());
			pstmt.setString(8, dto.getEmail());
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//id중복확인
	public int idcount(String id) {
		int isid=0;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from test1 where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				isid=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return isid;
	}
	
	//nick중복방지하기 위한것
	public int nickcount(String nick) {
		int isnick=0;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from test1 where nick=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, nick);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				isnick=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return isnick;
	}
	
	//로그인시 사용할 메서드(id와 pass가 일치 하는 가)
	public boolean isIdPassTest(String id, String pass) {
		boolean idpass=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from test1 where id=? and pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				idpass=true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return idpass;
	}
	
	//아이디 찾기 #1(이름과 번호를 이용해서)
	public String idsearch(String name, String hp2) {
		String b="";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select id from test1 where name=? and hp2=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, hp2);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				b=rs.getString("id");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return b;
	}
//아이디 찾기 #2(이름과 이메일을이용해서)
	public String idsearchtwo(String name, String email) {
		String b="";
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select id from test1 where name=? and email=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				b=rs.getString("id");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return b;
	}
	
	//이름, 전화번호, 아이디를 통해서 비밀번호 찾기
	public String passSearch(String name, String hp2,String id) {
		String p="";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select pass from test1 where name=? and hp2=? and id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, hp2);
			pstmt.setString(3, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				p=rs.getString("pass");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return p;
	}

}
