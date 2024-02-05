package day0117;

public class Myshop {
	private String sangpum;
	private int su;
	private int price;
	private int total;

	//디폴트생성자
	public Myshop() {
	}

	//명시적생성자
	public Myshop(String sangpum,int su,int price) {
		this.sangpum=sangpum;
		this.su=su;
		this.price=price;
	}

	public String getSangpum() {
		return sangpum;
	}
	public void setSangpum(String sangpum) {
		this.sangpum = sangpum;
	}
	public int getSu() {
		return su;
	}
	public void setSu(int su) {
		this.su = su;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}





}
