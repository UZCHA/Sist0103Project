package spring.di.ex5;

public class Emp {
	SawonInfo info;
	String empname;
	String emploc;
	
	public Emp(String empname) {
		this.empname=empname;

	}

	public SawonInfo getInfo() {
		return info;
	}

	public void setInfo(SawonInfo info) {
		this.info = info;
	}

	public String getEmploc() {
		return emploc;
	}

	public void setEmploc(String emploc) {
		this.emploc = emploc;
	}
	
	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public void writeEmp() {
		System.out.println("ȸ���: "+empname);
		System.out.println("ȸ����ġ: "+emploc);
		System.out.println("�����: "+info.getSawonname());
		System.out.println("�޿�: "+info.getPay());
		System.out.println("����: "+info.getPosition());
		System.out.println("�μ���");
		for(String b:info.getBuseo())
			System.out.println("\t"+b);
	}
}
