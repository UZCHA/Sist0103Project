package day0115;

import java.util.LinkedList;
import java.util.Queue;

class Message{
	public String command;
	public String to;
	
	public Message(String command, String to)
	{
		this.command=command;
		this.to=to;
	}
}


public class Book679_Que {

	public static void main(String[] args) {
		//Queue 컬렉션 생성
		Queue<Message> messageQueue=new LinkedList<Message>();//LinkesList<>();도 가능.
		
		//메시지넣기
		//offer: 주어진 객체를 큐에 넣는다. 
		messageQueue.offer(new Message("sendMail", "홍길동"));
		messageQueue.offer(new Message("sendSMS", "신용권"));
		messageQueue.offer(new Message("sendKakaotalk", "감자바"));
		
		//메세지는 하나씩 꺼내어 처리
		
		while(!messageQueue.isEmpty()) {
			//poll:큐에서 객체를 빼낸다. 
			Message message=messageQueue.poll();
			switch(message.command) {
			case "sendMail":
				System.out.println(message.to+"님에게 메일을 보냅니다.");
				break;
			case "sendSMS":
				System.out.println(message.to+"님에게 SMS를 보냅니다");
				break;
			case "sendKakaotalk":
				System.out.println(message.to+"님에게 카카오톡을 보냅니다");
				break;
			}
		}
	}

}
