package quiz.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import oracle.db.DbConnect;

public class QuizDao {
	
	DbConnect db=new DbConnect();
	
	public void insertDatas(QuizDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into quizinfo values(seq_1.nextval,?,?,?,?,sysdate)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getHp());
			pstmt.setString(3, dto.getAge());
			pstmt.setString(4, dto.getDriver());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	public Vector<QuizDto> getAllDatas(){
		
		Vector<QuizDto> list=new Vector<QuizDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select *from quizinfo order by no";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				QuizDto dto=new QuizDto();
				dto.setNo(rs.getString("no"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getString("age"));
				dto.setHp(rs.getString("hp"));
				dto.setDriver(rs.getString("driver"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
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
	
	
	public void deleteData(String no) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from quizinfo where no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, no);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public QuizDto getDatas(String no) {
		
		QuizDto dto=new QuizDto();
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select *from quizinfo where no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNo(rs.getString("no"));
				dto.setName(rs.getString("name"));
				dto.setHp(rs.getString("hp"));
				dto.setAge(rs.getString("age"));
				dto.setDriver(rs.getString("driver"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
			
		return dto;
	}
	
	public void updateDatas(QuizDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update quizinfo set name=?, hp=?,age=?,driver=? where no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getHp());
			pstmt.setString(3, dto.getAge());
			pstmt.setString(4, dto.getDriver());
			pstmt.setString(5, dto.getNo());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
}
