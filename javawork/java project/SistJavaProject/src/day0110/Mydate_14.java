package day0110;

class MyDate{
	private int year;
	private int month;
	private int day;
	
	//만들지는 않았지만 디폴트생성자가 존재
	public MyDate() {
		// TODO Auto-generated constructor stub
	}
	
	//명시적 생성자_생성과 동시에 초기화 가능(수정이 가능함)
	//명시적 생성자를 만들면 디폴트생성자는 생성되지않음 굳이 생성해야겠으면 위에처럼 작성할것.
	public MyDate(int y,int m,int d) {
		// TODO Auto-generated constructor stub
		year=y;
		month=m;
		day=d;
	}
	//setter
	public void setYear(int y) {
		year=y;
	}
	public void setMonth(int m) {
		month=m;
	}
	public void setDay(int d) {
		day=d;
	}
	
	//gettet
	public int getYear()
	{
		return year;
	}
	public int getMonth() {
		return month;
	}
	public int getDay() {
		return day;
	}
	
}


public class Mydate_14 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyDate m1=new MyDate(2024,01,10);
		
		int year=m1.getYear();
		int month=m1.getMonth();
		int day=m1.getDay();
		
		System.out.println(year+"-"+month+"-"+day);
		
		/////////////////////////////////////////////////
		
		MyDate m2=new MyDate();
		m2.setYear(2022);
		m2.setMonth(9);
		m2.setDay(11);
		
		int y=m2.getYear();
		int m=m2.getMonth();
		int d=m2.getDay();
		
		System.out.println(y+"년 "+m+"월 "+d+"일");
	}

}
