package day0129;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import oracleDB.DbConnect;

public class JdbcScore_02 {

	DbConnect db=new DbConnect();
	Scanner sc=new Scanner(System.in);

	public void insertSungjuk()
	{
		System.out.println("학생명");
		String name=sc.nextLine();
		System.out.println("자바점수");
		int java=Integer.parseInt(sc.nextLine());
		System.out.println("오라클점수");
		int oracle=Integer.parseInt(sc.nextLine());

		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;

		String sql="insert into sungjuk(num, name, java, oracle) values (seq_score.nextval,?,?,?)";

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, name);
			pstmt.setInt(2, java);
			pstmt.setInt(3, oracle);
			//갯수만큼 모두 바인딩후 실행
			pstmt.execute();
			System.out.println("추가되었습니다.");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}		

	}
	//전체출력 
	public void writeAll()
	{
		//총점평균 먼저 계산후 출력
		this.calcTotalAverage();

		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select *from sungjuk order by num";
		System.out.println("***[학생성적 출력]***");
		System.out.println();
		System.out.println("번호\t이름\t자바\t오라클\t총점\t평균");
		System.out.println("--------------------------------------------");

		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();

			while(rs.next())
			{
				System.out.println(rs.getInt("num")+"\t"
						+rs.getString("name")+"\t"
						+rs.getInt("java")+"\t"
						+rs.getInt("oracle")+"\t"
						+rs.getInt("total")+"\t"
						+rs.getDouble("average"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}


	}
	//총점, 평균 구하는 메서드
	public void calcTotalAverage() 
	{
		Connection conn=db.getOracle();
		Statement stmt=null;

		String sql="update sungjuk set total=java+oracle, average=(java+oracle)/2";

		try {
			stmt=conn.createStatement();
			stmt.execute(sql);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}

	}
	public void deleteSungjuk()
	{
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;

		String sql="delete from sungjuk where num=?";
		System.out.println("삭제할 번호를 입력하세요");
		int num=Integer.parseInt(sc.nextLine());

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			int a=pstmt.executeUpdate();
			if(a==1)
				System.out.println("삭제되었습니다.");
			else
				System.out.println(num+"번 학생은 존재하지 않습니다.");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

	}

	public boolean updateData(String num)
	{
		boolean flag=false;
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select *from sungjuk where num=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();

			if(rs.next()) 
				flag=true;
			else
				flag=false;



		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return flag;
	}

	public void sungjukUpdate()
	{
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		System.out.println("수정할 번호를 입력하세요");
		String num=sc.nextLine();
		if(!updateData(num))
		{
			System.out.println("없는 번호입니다.");
			return;
		}
		System.out.println("수정할 자바점수");
		int java=Integer.parseInt(sc.nextLine());
		System.out.println("수정할 오라클점수");
		int oracle=Integer.parseInt(sc.nextLine());

		String sql="update sungjuk set java=?, oracle=? where num=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, java);
			pstmt.setInt(2, oracle);
			pstmt.setString(3, num);

			pstmt.execute();
			/*if(n==1)
				System.out.println("수정됨");
			else
				System.out.println(num+"번 학생이 존재하지 않습니다.");*/
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}

	public void process()
	{
		while(true)
		{
			System.out.println("1.학생성적추가 2.학생정보전체출력 3.학생정보삭제 4.학생정보수정 9.종료");
			int num=Integer.parseInt(sc.nextLine());

			switch(num)
			{
			case 1:
				this.insertSungjuk();
				break;
			case 2:
				this.writeAll();
				break;
			case 3:
				this.deleteSungjuk();
				break;
			case 4:
				this.sungjukUpdate();
			case 9:
				System.out.println("성적프로그램 종료");
				System.exit(0);//강제종료
			}

		}

	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		JdbcScore_02 score=new JdbcScore_02();
		score.process();
	}

}
