package day0104;

import java.util.Scanner;

public class Scanner_01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
Scanner scanner= new Scanner(System.in);
int num1;
int num2;
System.out.print("첫번째 정수: ");
num1=scanner.nextInt();
System.out.print("두번째 정수: ");
num2=scanner.nextInt();

System.out.println("첫번째 정수: "+num1);
System.out.println("두번째 정수: "+num2);

	}

}
