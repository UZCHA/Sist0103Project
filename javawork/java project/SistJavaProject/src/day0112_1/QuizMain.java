package day0112_1;

import java.util.Scanner;

class Quiz{
	private static String schoolName="쌍용교육센터";
	private String stuName;
	private int javaScore;
	private int oracleScore;
	private int htmlScore;
	
	public static String getSchoolName() {
		return schoolName;
	}
	public static void setSchoolName(String schoolName) {
		Quiz.schoolName = schoolName;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public int getJavaScore() {
		return javaScore;
	}
	public void setJavaScore(int javaScore) {
		this.javaScore = javaScore;
	}
	public int getOracleScore() {
		return oracleScore;
	}
	public void setOracleScore(int oracleScore) {
		this.oracleScore = oracleScore;
	}
	public int getHtmlScore() {
		return htmlScore;
	}
	public void setHtmlScore(int htmlScore) {
		this.htmlScore = htmlScore;
	}
	 public int getTotal() {
		 int n=javaScore+oracleScore+htmlScore;
		 return n;
	 }
	 public double getAverage()
	 {double n=(javaScore+oracleScore+htmlScore)/3;
	 return Math.round(n);
	 }
	 public String getpyungga() {
	 int b=javaScore+oracleScore+htmlScore;
	 if(b>=270)
		 return "장학생";
	 else if(b>=240)
		 return "합격";
	 else
		 return "불합격";
	 }
	 
	 
	 //제목
	 public static void showTitle() {
		 System.out.println("이름\tJAVA\tORACLE\tHTML\t총점\t평균\t평가");
		 System.out.println("======================================================");
	 }
}



/////////////////////////


public class QuizMain {
	
	public static void writeData(Quiz[] quiz) {
		Quiz.showTitle();
		for(Quiz q: quiz)
		{
			System.out.println(q.getStuName()+"\t"+q.getJavaScore()+"\t"+q.getOracleScore()+"\t"+q.getHtmlScore()+"\t"+q.getTotal()+"\t"+q.getAverage()+"\t"+q.getpyungga());
			
		}
		
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc=new Scanner(System.in);
		int inwon;
		
		Quiz[] quiz;
		
		System.out.println("입력할 인원수는?");
		inwon=Integer.parseInt(sc.nextLine());
		
		quiz=new Quiz[inwon];
		for(int i=0;i<inwon;i++)
		{
			quiz[i]=new Quiz();
			
			System.out.println("이름?");
			String name=sc.nextLine();
			System.out.println("자바 점수는?");
			int javascore=Integer.parseInt(sc.nextLine());
			System.out.println("오라클 점수는?");
			int orclescore=Integer.parseInt(sc.nextLine());
			System.out.println("html점수는?");
			int htmlscore=Integer.parseInt(sc.nextLine());
			
			quiz[i].setStuName(name);
			quiz[i].setJavaScore(javascore);
			quiz[i].setOracleScore(orclescore);
			quiz[i].setHtmlScore(htmlscore);
		}
		System.out.println(Quiz.getSchoolName());
		writeData(quiz);
		
	}

}
