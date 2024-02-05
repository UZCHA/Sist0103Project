package day0110;

class Student{
	String student;
	int stuAge;
	static String schoolName;//모두 공유중이므로
}
public class Student_10_01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Student s1=new Student();
		s1.student="김삼순";
		s1.stuAge=23;
		Student.schoolName="쌍문고등학교";
		
		System.out.println("이름:"+s1.student);
		System.out.println("나이:"+s1.stuAge);
		System.out.println("소속학교:"+Student.schoolName);
		
	}

}
