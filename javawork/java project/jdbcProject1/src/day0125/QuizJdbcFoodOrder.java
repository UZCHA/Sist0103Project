package day0125;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class QuizJdbcFoodOrder {
	static final String URL="jdbc:oracle:thin:@localhost:1521:XE";

	public void ConnectFoodShop()
	{
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;

	String sql="select order_num ordernum ,f.fno fnum, order_name ordername,foodname ,to_char(price,'L999,999,999') price, fshopname , shoploc ,oderaddr from foodshop f, jumun j where f.fno=j.fno order by order_name";
		
		try {
			conn=DriverManager.getConnection(URL, "stu", "A1234");
			System.out.println("오라클 연결 성공");
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);

			System.out.println("주문번호\t음식번호\t주문자\t음식명\t가격\t 상호명\t 상점위치\t 주문자위치");
			System.out.println("-----------------------------------------------------------------");

			while(rs.next())
		{
			int ordernum=rs.getInt("ordernum");
			int fnum=rs.getInt("fnum");
			String ordername=rs.getString("ordername");
			String foodname=rs.getString("foodname");
			String price=rs.getString("price");
			String fshopname=rs.getString("fshopname");
			String shoploc=rs.getString("shoploc");
			String oderaddr=rs.getString("oderaddr");

			System.out.println(ordernum+"\t"+fnum+"\t"+ordername+"\t"+ foodname+"\t"+price+"\t"+fshopname+"\t"+shoploc+"\t"+oderaddr);
		//System.out.printf("%d\t%d\t%3s\t%6s\t%6d원\t%6s\t%6s\t%6s\n",ordernum,fnum,ordername,foodname,price,fshopname,shoploc,oderaddr);
		
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("오라클 연결 실패");
		}finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}


	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		QuizJdbcFoodOrder qfood=new QuizJdbcFoodOrder();
		qfood.ConnectFoodShop();
	}

}
