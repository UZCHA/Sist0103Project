package spring.di.ex2;

public class MyInfo {
	
	String name;
	int age;
	String addr;
	
	//������ ������
	public MyInfo(String name, int age, String addr) {
		// TODO Auto-generated method stub
		this.name=name;
		this.age=age;
		this.addr=addr;
	
	}
	@Override
	public String toString() {
		return "myinfo [name="+name+",age="+age+",addr="+addr+"]";
	}
}