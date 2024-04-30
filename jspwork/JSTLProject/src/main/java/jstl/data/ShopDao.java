package jstl.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import mysql.DbConnect;

public class ShopDao {
 DbConnect db=new DbConnect();
 
 //전체출력
 public List<shopDto> getAllSangpums(){
	 List<shopDto> list=new Vector<shopDto>();
	 Connection conn=db.getConnection();
	 PreparedStatement pstmt=null;
	 ResultSet rs=null;
	 
	 String sql="select * from jshop order by num";
	 
	 try {
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			shopDto dto=new shopDto();
			dto.setNum(rs.getString("num"));
			dto.setSangpum(rs.getString("sangpum"));
			dto.setColor(rs.getString("color"));
			dto.setPrice(rs.getInt("price"));
			dto.setImagename(rs.getString("imagename"));
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
}
