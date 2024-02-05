package day0112;



class School{

	public static final String SCHOOLNAME="쌍용고등학교";
	private String schoolAddr;
	private int countStu;
	private int countTeacher;
	
	//명시적생성자 호출
	public School() {
		this("강남구 역삼동",120,10);

	}
	public School(String saddr,int cntstu,int cnttea) {
		this.schoolAddr=saddr;
		this.countStu=cntstu;
		this.countTeacher=cnttea;

	}
	//setter getter
	public String getSchoolAddr() {
		return schoolAddr;
	}
	public void setSchoolAddr(String schoolAddr) {
		this.schoolAddr = schoolAddr;
	}
	public int getCountStu() {
		return countStu;
	}
	public void setCountStu(int countStu) {
		this.countStu = countStu;
	}
	public int getCountTeacher() {
		return countTeacher;
	}
	public void setCountTeacher(int countTeacher) {
		this.countTeacher = countTeacher;
	}
	public static String getSchoolname() {
		return SCHOOLNAME;
	}
	//메서드
	public void writeData() {
		System.out.println("학교주소: "+this.schoolAddr);
		System.out.println("학생수: "+this.countStu+"\t선생님수: "+this.countTeacher);
	}
	
}
	class Student extends School{
		private String stuName;
		private int grade;
		
		public Student() {
			
		}
		public Student(String sAddr,int cntStu, int cntTea,String stuname,int grade) {
			super(sAddr, cntStu, cntTea);
			this.stuName=stuname;
			this.grade=grade;
		}
		//각각의 setter & getter
		public String getStuName() {
			return stuName;
		}
		public void setStuName(String stuName) {
			this.stuName = stuName;
		}
		public int getGrade() {
			return grade;
		}
		public void setGrade(int grade) {
			this.grade = grade;
		}
		
		//재정의한 메서드, 완성시켜야 한다.
		@Override
		public void writeData() {
			// TODO Auto-generated method stub
			System.out.println("학교명: "+SCHOOLNAME);//원래는 클래스명도 같이 써야하지만, 상속받았으므로 생략가능.
			//부모로부터 상속받은건 다 내거
			super.writeData();
			System.out.println("학생명: "+this.stuName);
			System.out.println("학년: "+this.grade+"년");
		}
	}

//////////////////////


public class Inheri_07 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Student s1=new Student();
		s1.writeData();
		
		Student s2=new Student("강남구",300, 35, "이영희", 3);
				s2.writeData();
				
		System.out.println("1번째 학생 학생명과 학년 변경후 출력");
		s1.setStuName("이영자");
		s1.setGrade(1);
		s1.writeData();
		
	}

}
