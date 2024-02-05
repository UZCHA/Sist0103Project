package day0112;

interface InterA{
	public void singasong();
	public void draw();
}
/////////////////////////////
interface InterB extends InterA{
	public void playgame();
	public void write();
}
///////////////////////////
class Imple implements InterB{ //implements InterB,InterA {}; 로 작성해도 괜춘

	@Override
	public void singasong() {
		// TODO Auto-generated method stub
		System.out.println("노래합니다");
	}

	@Override
	public void draw() {
		// TODO Auto-generated method stub
		System.out.println("그림그립니다");
	}

	@Override
	public void playgame() {
		// TODO Auto-generated method stub
		System.out.println("게임합니다");
	}

	@Override
	public void write() {
		// TODO Auto-generated method stub
		System.out.println("글씁니다");
	}



}
/////////////////////////////////
public class InterImpl_14 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//하위클래스 생성
		Imple im=new Imple();
		im.singasong();
		im.draw();
		im.write();
		im.playgame();
		
		System.out.println();
		
		//다양성 생성
		InterB inb=new Imple();
		inb.singasong();
		inb.draw();
		inb.write();
		inb.playgame();
		

	}

}
