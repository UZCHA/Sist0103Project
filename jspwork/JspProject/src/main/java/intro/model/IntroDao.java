package intro.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mysql.DbConnect;

public class IntroDao {
	
	DbConnect db=new DbConnect();
	
	//insert
	public void insertIntro(IntroDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		//insert into intro values(null,?,?,?,?,?,?); 전체정보 입력시 요렇게 해도 괜춘
		String sql="insert into intro(name,age,birthday,hometown,hobby,memo) values(?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAge());
			pstmt.setString(3, dto.getBirthday());
			pstmt.setString(4, dto.getHometown());
			pstmt.setString(5, dto.getHobby());
			pstmt.setString(6, dto.getMemo());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//introList 폼에 사용할 데이타 전체조회
	public ArrayList<IntroDto> getAllIntro(){
		ArrayList<IntroDto> list=new ArrayList<IntroDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select *from intro order by num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
			IntroDto dto=new IntroDto();
			dto.setNum(rs.getString("num"));
			dto.setName(rs.getString("name"));
			dto.setAge(rs.getString("age"));
			dto.setBirthday(rs.getString("birthday"));
			dto.setHometown(rs.getString("hometown"));
			dto.setHobby(rs.getString("hobby"));
			dto.setMemo(rs.getString("memo"));
			list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//detailView에서 num에 해당하는 하나의 데이타만 볼 수 있게	
	public IntroDto getOneData(String num) {
		IntroDto dto=new IntroDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select *from intro where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getString("age"));
				dto.setBirthday(rs.getString("birthday"));
				dto.setHometown(rs.getString("hometown"));
				dto.setHobby(rs.getString("hobby"));
				dto.setMemo(rs.getString("memo"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	//수정(나이, 생년월일, 거주지역, 취미, 메모 수정
	public void updateIntro(IntroDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update intro set name=?,age=?,birthday=?,hometown=?,hobby=?,memo=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAge());
			pstmt.setString(3, dto.getBirthday());
			pstmt.setString(4, dto.getHometown());
			pstmt.setString(5, dto.getHobby());
			pstmt.setString(6, dto.getMemo());
			pstmt.setString(7, dto.getNum());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	
	
	//삭제(선택한 시퀀스(num)에 해당하는 db 삭제)
	
	public void deleteIntro(String num) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		String sql="delete from intro where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
}
