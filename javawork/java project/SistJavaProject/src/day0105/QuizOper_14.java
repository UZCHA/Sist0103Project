package day0105;

import java.util.Scanner;

public class QuizOper_14 {

	public static void main(String[] args) {
		/*(점수에대한 조건: 90점 이상:매우잘함, 80점이상:잘함,70점이상:좀더노력할것,70점미만:다음기회에)
		 * 이름을 입력해주세요
		 * 차유지
		 * 자바 시험점수를 입력해주세요.
		 * 88
		 * ========================
		 * 차유지님의 시험결과는 잘함 입니다. 
		 * ========================
		 */
		Scanner sc=new Scanner(System.in);
		String name, result;
		int grade;

		System.out.println("이름을 입력해주세요");
		name=sc.nextLine();
		System.out.println("자바 시험점수를 입력해주세요");
		grade=sc.nextInt();

		if(grade>=90)
			result="매우잘함";
		else if(grade>=80)
			result="잘함";
		else if(grade>=70)
			result="좀더노력할것";
		else
			result="다음기회에";
		System.out.println("=========================");
		System.out.printf("%s님의 시험결과는 %s입니다\n",name,result);
		System.out.print("=========================\n");

		result=grade>=90?"매우잘함":grade>=80?"잘함":grade>=70?"좀더노력할것":"다음기회에";
		System.out.printf("%s님의 시험결과는 %s입니다\n",name,result);
	}

}
