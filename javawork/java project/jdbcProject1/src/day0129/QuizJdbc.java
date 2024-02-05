package day0129;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import oracleDB.DbConnect;

public class QuizJdbc {

	DbConnect db=new DbConnect();
	Scanner sc=new Scanner(System.in);

	public void insertMember()
	{
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;

		System.out.println("사원명은?");
		String name=sc.nextLine();
		System.out.println("부서는?");
		String buseo=sc.nextLine();
		System.out.println("직급은?");
		String position=sc.nextLine();
		System.out.println("성별은?");
		String gender=sc.nextLine();
		System.out.println("월급은?");
		int pay=Integer.parseInt(sc.nextLine());
		System.out.println("보너스는?");
		int bonus=Integer.parseInt(sc.nextLine());


		String sql="insert into sawonmember values(seq_smem.nextval,?,?,?,?,?,?, sysdate)";
		//System.out.println("사원번호\t사원명\t부서\t직급\t성별\t월급\t보너스\t입사일");
		//System.out.println("-------------------------------------------------------------");

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, name);
			pstmt.setString(2, buseo);
			pstmt.setString(3, position);
			pstmt.setString(4, gender);
			pstmt.setInt(5, pay);
			pstmt.setInt(6, bonus);

			int a=pstmt.executeUpdate();

			if(a==1)
				System.out.println("인서트 성공");
			else
				System.out.println("인서트 실패");


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

	}
	public void writeMember()
	{
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select s_no, s_name, buseo, position, gender,to_char( pay,'L999,999,999') pay,to_char(bonus,'L999,999,999') bonus ,ipsady from sawonmember order by s_no";
		System.out.println("사원번호\t사원명\t부서\t직급\t성별\t\t월급\t\t   보너스\t\t입사일");
		System.out.println("-----------------------------------------------------------------------------------------");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
			System.out.println(rs.getInt("s_no")+"\t"+rs.getString("s_name")+"\t"+rs.getString("buseo")
			+"\t"+rs.getString("position")+"\t"+rs.getString("gender")+rs.getString("pay")
			+rs.getString("bonus")+"\t"+rs.getDate("ipsady"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
	}
	public void deleteMember()
	{
		System.out.println("삭제할 사원번호 입력");
		int num=Integer.parseInt(sc.nextLine());
		
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		
		String sql="delete from sawonmember where s_no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			int a=pstmt.executeUpdate();
			
			if(a==1)
				System.out.println("삭제되었습니다.");
			else
				System.out.println("삭제할 사원번호가 없습니다.");
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public boolean updateData(String num)
	{
		boolean a=false;
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select *from sawonmember where s_no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			if(rs.next())
				a=true;
			else
				a=false;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return a;
		
	}
	
		public void updateMember()
		{
			System.out.println("수정할 사원번호를 입력하세요");
			String num=sc.nextLine();
			if(!this.updateData(num))
			{
				System.out.println("해당 사원번호는 존재하지 않습니다.");
				return;
			}
			
			System.out.println("수정할 부서");
			String buseo=sc.nextLine();
			System.out.println("수정할 직급");
			String position=sc.nextLine();
			System.out.println("수정할 급여");
			int pay=Integer.parseInt(sc.nextLine());
			System.out.println("수정할 보너스");
			int bonus=Integer.parseInt(sc.nextLine());
			
			
			String sql="update sawonmember set buseo=?,position=?,pay=?,bonus=? where s_no=?";
			Connection conn=db.getOracle();
			PreparedStatement pstmt=null;
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, buseo);
				pstmt.setString(2, position);
				pstmt.setInt(3, pay);
				pstmt.setInt(4, bonus);
				pstmt.setString(5, num);
				int a=pstmt.executeUpdate();
				if(a==1)
					System.out.println("수정되었습니다.");
				else
					System.out.println(num+"번호가 없습니다.");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
			
			
		}

		
		public void searchMember()
		{
			System.out.println("검색할 이름을 입력하세요");
			String name=sc.nextLine();
			
			String sql="select s_no,s_name,buseo,position,gender,pay,bonus,ipsady from sawonmember where s_name like ?";
			
			Connection conn=db.getOracle();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			System.out.println("사원번호\t사원명\t부서\t직급\t성별\t월급\t보너스\t입사일");
			System.out.println("-------------------------------------------------------------");
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,"%"+name+"%");
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					System.out.println(rs.getInt("s_no")+"\t"+rs.getString("s_name")+"\t"+rs.getString("buseo")
					+"\t"+rs.getString("position")+"\t"+rs.getString("gender")+"\t"+rs.getInt("pay")
					+"\t"+rs.getInt("bonus")+"\t"+rs.getDate("ipsady"));
					}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
		}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		QuizJdbc qjdbc=new QuizJdbc();
		Scanner sc=new Scanner(System.in);

		int n;
		while(true)
		{
			System.out.println("1.사원정보입력 2.전체사원출력 3.사원삭제 4.사원수정 5.이름검색 9.시스템종료");
			n=Integer.parseInt(sc.nextLine());

			if(n==1)
				qjdbc.insertMember();
			else if(n==2)
				qjdbc.writeMember();
			else if(n==3)
				qjdbc.deleteMember();
			else if(n==4)
				qjdbc.updateMember();
			else if(n==5)
				qjdbc.searchMember();
			else if(n==9)
			{
				System.out.println("시스템 종료");
				break;
			}
		}
	}

}
