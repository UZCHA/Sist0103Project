package day0115;

interface InterAA{
	
	public void play();
	
}
///////////////////////////////////////////////
interface InterBB{
	public void draw();
}
///////////////////////////////////////////////
class InterImple implements InterBB,InterAA{

	@Override
	public void play() {
		// TODO Auto-generated method stub
		System.out.println("나는 게임을 한다");
	}

	@Override
	public void draw() {
		// TODO Auto-generated method stub
		System.out.println("나는 그림을 그린다");
	}
	
}

///////////////////////////////////////////////
public class InheritReivew_01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		InterImple imp1=new InterImple();
		imp1.play();
		imp1.draw();
		
		System.out.println("**다형성으로 출력**");
		
		InterAA aa=new InterImple();
		aa.play();
		InterBB bb=new InterImple();
		bb.draw();
	
		
		
	}

}
