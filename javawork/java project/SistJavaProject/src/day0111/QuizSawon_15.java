package day0111;

import java.util.Scanner;

class Sawon{
	/*
	 * 회사이름
	 * 쌍용
	 * 총사원수 입력:2명
	 * 월급여:2500000
	 * 월수당:일괄 500000원
	 * [쌍용_1월 급여내역]
	 * 사원명 기본급 수당 실수령액 
	 * ===========================
	 * 손흥민 2500000 500000 2700000
	 * 황희찬 1500000 500000 1800000
	 */
	private String sName;
	private int su;//사원수
	private int mPay;//월급여
	private int iPay;//일괄수당
	private static String name="쌍용";
	
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public int getSu() {
		return su;
	}
	public void setSu(int su) {
		this.su = su;
	}
	public int getmPay() {
		return mPay;
	}
	public void setmPay(int mPay) {
		this.mPay = mPay;
	}
	public int getiPay() {
		return iPay;
	}
	public void setiPay(int iPay) {
		this.iPay = iPay;
	}
	public static String getName() {
		return name;
	}
	public static void setName(String name) {
		Sawon.name = name;
	}
	
	//총급여구하자
	public double getTotalPay() {
		double a=(mPay+iPay)*0.9;
		return a;
	}
	//제목
	public static void showTitle() {
		System.out.println("[쌍용_1월 급여내역]");
		System.out.println();
		System.out.println("사원명\t기본급\t수당\t실수령액");
		System.out.println("===================================");
	}
	
}


public class QuizSawon_15 {
	
	public static void writeSawon(Sawon[] sawon) {
		Sawon.showTitle();
		for(Sawon s:sawon)
		System.out.println(s.getsName()+"\t"+s.getmPay()+"\t"+s.getiPay()+"\t"+s.getTotalPay());
	}
	
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("회사이름");
		System.out.println(Sawon.getName());
		System.out.println();

		
		Scanner sc=new Scanner(System.in);
		int inwon;
		Sawon[]sawon;
		System.out.println("총사원?");
		inwon=Integer.parseInt(sc.nextLine());
		
		sawon=new Sawon[inwon];
		
		for(int i=0;i<inwon;i++) 
		{
		sawon[i]=new Sawon();
		System.out.println("이름?");
		String name=sc.nextLine();
		System.out.println("월급여?");
		int pay=Integer.parseInt(sc.nextLine());
		System.out.println("월수당?");
		int su=Integer.parseInt(sc.nextLine());
		
		sawon[i].setsName(name);
		sawon[i].setmPay(pay);
		sawon[i].setiPay(su);
		
		System.out.println();
		}
		writeSawon(sawon);
	}

}
