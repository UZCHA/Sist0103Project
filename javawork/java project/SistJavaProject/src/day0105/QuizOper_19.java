package day0105;

import java.util.Scanner;

public class QuizOper_19 {

	public static void main(String[] args) {
		/*(90이상:참 잘함 80이상:좀더 노력하세요 80점 미만:불합격)
		 * 이름을 입력하세요
		 * 손흥민
		 * 국,영,수 점수를 입력하세요
		 * 88
		 * 99
		 * 77
		 *
		 *========================
		 *[손흥민 님의 기말고사 성적]
		 *총점: 00점
		 *평균: 00.0점
		 *평가: 좀더 노력하세요~
		 */

		Scanner sc=new Scanner(System.in);
		String name, result;
		int gu,young,su;
		double tot,sttot;

		System.out.println("이름을 입력하세요");
		name=sc.nextLine();
		System.out.println("국,영,수 점수를 입력하세요");
		gu=sc.nextInt();
		young=sc.nextInt();
		su=sc.nextInt();

		tot=gu+young+su;
		sttot=tot/3;

		System.out.println("["+name+"님의 기말고사 성적]");
		System.out.println("총점: "+tot+"점\n");
		System.out.printf("평균: %.1f\n",sttot);

		if(sttot>=90)
			result="참잘함";
		else if(sttot>=80)
			result="좀더노력하세요";
		else
			result="불합격";

		System.out.println("평가:"+result);
	}

}
