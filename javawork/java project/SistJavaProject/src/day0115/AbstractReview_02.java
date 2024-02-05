package day0115;

abstract class Game{

	abstract public void play();
	abstract public void stop();
}
/////////////////////////////////////
class kim extends Game{

	@Override
	public void play() {
		// TODO Auto-generated method stub
		System.out.println("kim 게임시작");

	}

	@Override
	public void stop() {
		// TODO Auto-generated method stub
		System.out.println("kim 게임중단");

	}

}
/////////////////////////////////////
class lee extends Game{

	@Override
	public void play() {
		// TODO Auto-generated method stub
		System.out.println("lee 게임시작");
	}

	@Override
	public void stop() {
		// TODO Auto-generated method stub
		System.out.println("lee 게임중단");
	}

}
////////////////////////////////////
class choi extends Game{

	@Override
	public void play() {
		// TODO Auto-generated method stub
		System.out.println("choi 게임시작");
	}

	@Override
	public void stop() {
		// TODO Auto-generated method stub
		System.out.println("choi 게임중단");
	}

}
public class AbstractReview_02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		/*Game game=null;
		game=new kim();
		game.play();
		game.stop();

		game=new lee();
		game.play();
		game.stop();

		game=new choi();
		game.play();
		game.stop();*/

		Game[] game=new Game[3];//선언
		game[0]=new kim();//생성
		game[1]=new lee();
		game[2]=new choi();

		for(int i =0;i<game.length;i++)
		{
			game[i].play();
		}
		
		System.out.println("****역순으로 배열****");
		for(int i=game.length-1;i>=0;i--)
		{
			game[i].stop();
		}

	}

}
