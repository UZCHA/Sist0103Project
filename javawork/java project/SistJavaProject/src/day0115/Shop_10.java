package day0115;

public class Shop_10 {
private String sangName;
private int su;
private int dan;

public Shop_10(String sangname, int su,int dan)
{
	this.sangName=sangname;
	this.su=su;
	this.dan=dan;
}
//setter & getter
public String getSangName() {
	return sangName;
}
public void setSangName(String sangName) {
	this.sangName = sangName;
}
public int getSu() {
	return su;
}
public void setSu(int su) {
	this.su = su;
}
public int getDan() {
	return dan;
}
public void setDan(int dan) {
	this.dan = dan;
}
//총액
public int getTot() {
	int s=su*dan;
	return s;
}
	
	
	
}
