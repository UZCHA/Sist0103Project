package day0126;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import oracleDB.DbConnect;

public class QuizStuInfo {

	DbConnect db=new DbConnect();

	public void insert()
	{	
		Scanner sc=new Scanner(System.in);


		String name,gender,hp;
		int age;

		System.out.println("이름을 입력하세요");
		name=sc.nextLine();
		System.out.println("성별을 입력하세요");
		gender=sc.nextLine();
		System.out.println("나이를 입력하세요");
		age=Integer.parseInt(sc.nextLine());
		System.out.println("연락처를 입력하세요");
		hp=sc.nextLine();

		String sql="insert into stuinfo values(seq_info.nextval,'"+name+"','"+gender+"'," +age+",'"+hp+"',sysdate)";
		System.out.println(sql);
		Connection conn=null;
		Statement stmt=null;

		conn=db.getOracle();
		try {
			stmt=conn.createStatement();
			stmt.execute(sql);
			System.out.println("데이타 추가되었습니다.");


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
	}

	public void select()
	{
		System.out.println("시퀀스\t이름\t성별\t나이\t연락처\t가입날짜");
		System.out.println("-------------------------------------------");

		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;

		conn=db.getOracle();

		String sql="select *from stuinfo order by num";
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);

			while(rs.next())
			{
				int num=rs.getInt("num");
				String name=rs.getString("s_name");
				String gender=rs.getString("s_gender");
				int age=rs.getInt("s_age");
				String hp=rs.getString("s_hp");
				String gaip=rs.getString("gaipday");

				System.out.println(num+"\t"+name+"\t"+gender+"\t"+age+"\t"+hp+"\t"+gaip);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}

	}

	public void delete()
	{
		Scanner sc=new Scanner(System.in);
		String num;

		System.out.println("삭제할 번호를 입력하세요");
		num=sc.nextLine();

		String sql="delete from stuinfo where num="+num;
		System.out.println(sql);

		Connection conn=null;
		Statement stmt=null;

		conn=db.getOracle();
		try {
			stmt=conn.createStatement();
			int a=stmt.executeUpdate(sql);

			if(a==0)
				System.out.println("없는 번호 입니다.");
			else
				System.out.println("삭제합니다.");


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}

	}

	public boolean getData(String num)
	{
		boolean flag=false;
		String sql="select *from stuinfo where num="+num;
		System.out.println(sql);

		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;

		conn=db.getOracle();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			if(rs.next())
				flag=true;
			else
				flag=false;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}

		return flag;

	}



	public void update()
	{
		Scanner sc=new Scanner(System.in);
		String num,name,gender,hp;
		int age;

		System.out.println("수정할 번호를 입력하세요");
		num=sc.nextLine();
		
		if(!getData(num))
		{System.out.println("해당번호는 존재하지 않습니다");
			return;
		}
		
		System.out.println("수정할 이름을 입력하세요");
		name=sc.nextLine();
		System.out.println("수정할 성별을 입력하세요");
		gender=sc.nextLine();
		System.out.println("수정할 나이를 입력하세요");
		age=Integer.parseInt(sc.nextLine());
		System.out.println("수정할 연락처를 입력하세요");
		hp=sc.nextLine();

		String sql="update stuinfo set s_name='"+name+"',s_gender='"+gender+"',s_age="+age+",s_hp='"+hp+"' where num="+num;
		System.out.println(sql);

		Connection conn=null;
		Statement stmt=null;

		conn=db.getOracle();
		try {
			stmt=conn.createStatement();
			int a=stmt.executeUpdate(sql);
			if(a==0)
				System.out.println("수정할 데이타가 없습니다.");
			else
				System.out.println("수정완료");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}


	}
	public void search() 
	{	
		String name;
		Scanner sc=new Scanner(System.in);
		System.out.println("검색어 입력");
		name=sc.nextLine();
		
		
		String sql="select *from stuinfo where s_name like '%"+name+"%'";
		System.out.println(sql);
		
		System.out.println("시퀀스\t이름\t성별\t나이\t연락처\t가입날짜");
		System.out.println("----------------------------------------------------");
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		
		conn=db.getOracle();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next())
			{
				int num=rs.getInt("num");
				String na=rs.getString("s_name");
				String gender=rs.getString("s_gender");
				int age=rs.getInt("s_age");
				String hp=rs.getString("s_hp");
				String gaip=rs.getString("gaipday");

				System.out.println(num+"\t"+na+"\t"+gender+"\t"+age+"\t"+hp+"\t"+gaip);
			}

	
					
				} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, stmt, conn);
		}
	}
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		QuizStuInfo stuinfo=new QuizStuInfo();
		Scanner sc=new Scanner(System.in);

		int n;
		while(true)
		{
			System.out.println("1.학생정보입력 2.정보출력 3.정보삭제 4.학생정보수정 5.학생검색 9.종료");
			n=Integer.parseInt(sc.nextLine());

			if(n==1)
				stuinfo.insert();
			else if(n==2)
				stuinfo.select();
			else if(n==3)
				stuinfo.delete();
			else if(n==4)
				stuinfo.update();
			else if(n==5)
				stuinfo.search();

			else if(n==9)
			{
				System.out.println("종료합니다");
				break;
			}
		}




	}

}
