package day0126;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import oracleDB.DbConnect;

public class HelloCrud {

	DbConnect db=new DbConnect();

	public void insert()
	{
		Scanner sc=new Scanner(System.in);

		String name,addr;
		String sql="";

		System.out.println("이름을 입력하세요");
		name=sc.nextLine();

		System.out.println("주소를 입력하세요");
		addr=sc.nextLine();

		sql="insert into hello values(seq1.nextval,'"+name+"','"+addr+"',sysdate)";
		System.out.println(sql);

		//1.db연결
		Connection conn=null;

		//2.statement
		Statement stmt=null;//sql문 객체 전송에 필요한 api

		conn=db.getOracle();

		try {
			stmt=conn.createStatement();

			//3.sql문 실행
			stmt.execute(sql);
			System.out.println("데이타 추가됨");


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);

		}

	}

	public void select()
	{
		System.out.println("시퀀스\t이름\t주소\t가입날짜\t");
		System.out.println("---------------------------------------");

		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;

		conn=db.getOracle();

		//String sql="select num,name,addr,sdate from hello";
		String sql="select *from hello order by num";

		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);

			//2개 이상일때 while
			while(rs.next())
			{
				int num=rs.getInt("num");
				String name=rs.getString("name");
				String addr=rs.getString("addr");
				String sdate=rs.getString("sdate");

				//위에 생략하고 아래처럼 한번에 입력하기도 가능
				/*System.out.println(rs.getInt("num")+"\t"+rs.getString("name")+"\t"
						+rs.getString("addr")+"\t"+rs.getDate("sdate"));*/

				System.out.println(num+"\t"+name+"\t"+addr+"\t"+sdate);
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
		//삭제할 번호 입력후 삭제
		Scanner sc=new Scanner(System.in);
		String num;//형변환 해야하니까 그냥 string으로
		String sql="";

		System.out.println("삭제할 번호를 입력하세요");
		num=sc.nextLine();

		sql="delete from hello where num="+num;
		System.out.println(sql);

		Connection conn=null;
		Statement stmt=null;

		conn=db.getOracle();
		try {
			stmt=conn.createStatement();
			int a= stmt.executeUpdate(sql);//성공한 레코드의 갯수
			//없는 번호 입력시 실제 삭제가 안되므로 0이 반환됨
			if(a==0)
				System.out.println("없는 데이타 번호입니다");
			else
				System.out.println("삭제되었습니다.");


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}

	}
	//수정하려는 데이타를 먼저 조회할 것,파라메타,인자값
	public boolean getOneData(String num)
	{
		boolean flag=false;//시퀀스에 해당하는 데이타가 있으면 true를 반환하고 없으면 false를 반환하기 위해

		String sql="select * from hello where num="+num;
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;

		conn=db.getOracle();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);

			//한개만 조회할 경우는 if문
			if(rs.next())//데이타가 있는 경우
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


	//수정
	public void update()
	{
		//수정할 시퀀스를 입력후 이름,주소 입력
		Scanner sc=new Scanner(System.in);
		String num,name,addr;

		System.out.println("수정할 번호를 입력하세요");
		num=sc.nextLine();
		
		//번호를 입력한 순간에 판단해야하므로 위치는 여기에!
		if(!getOneData(num))//->내가 번호를 입력했는데 존재하지 않을 경우
		//if(!this.getOneData(num)) 둘다 가능
		{
			System.out.println("해당번호는 존재하지 않습니다.");
			return;//메서드 종료
		}

		System.out.println("수정할 이름으로 변경해주세요");
		name=sc.nextLine();

		System.out.println("수정할 주소로 변경해주세요");
		addr=sc.nextLine();

		String sql="update hello set name='"+name+"',addr='"+addr+"' where num="+num;
		System.out.println(sql);

		Connection conn=null;
		Statement stmt=null;

		conn=db.getOracle();
		try {
			stmt=conn.createStatement();
			int a=stmt.executeUpdate(sql);

			if(a==0)
				System.out.println("수정할 데이타가 존재하지 않습니다.");
			else
				System.out.println("수정완료");



		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
	}



	public static void main(String[] args) {
		// TODO Auto-generated method stub

		HelloCrud hello=new HelloCrud();

		Scanner sc=new Scanner(System.in);
		int n;
		while(true)
		{
			System.out.println("**hello db 연습**");
			System.out.println("1.insert  2.select  3.delete  4.update  9.exit");
			n=Integer.parseInt(sc.nextLine());

			if(n==1)
				hello.insert();

			else if(n==2)
				hello.select();

			else if(n==3)
				hello.delete();

			else if(n==4)
				hello.update();

			else if(n==9)
			{
				System.out.println("종료하겠습니다");
				break;
			}
		}

	}

}
