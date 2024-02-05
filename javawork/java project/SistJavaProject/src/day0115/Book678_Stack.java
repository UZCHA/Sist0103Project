package day0115;

import java.util.Stack;

class Coin{//교과서에 있는 대로 public을 붙이면 오류남. public은 하나만 들어갈 수 있음. 
	private int value;
	public Coin(int value) {
		this.value=value;
	}
	public int getValue() {
		return value;
	}

}

public class Book678_Stack {

	public static void main(String[] args) {
		//stack 컬렉션 생성
		Stack<Coin> coinBox=new Stack<Coin>();

		//동전 넣기
		//push: 주어진 객체를 스택에 넣는다.
		coinBox.push(new Coin(100));
		coinBox.push(new Coin(50));
		coinBox.push(new Coin(500));
		coinBox.push(new Coin(10));

		//동전을 하나씩 꺼내기
		while(!coinBox.isEmpty())//비어있지 않다면 반복
		{	
			//스택의 맨 위 객체를 빼낸다.
			Coin coin=coinBox.pop();
			System.out.println("꺼내온 동전: "+coin.getValue()+"원");
		}

	}

}
