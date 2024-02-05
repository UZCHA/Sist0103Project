package day0109;

import java.util.Scanner;

public class ArrString_11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String[]str1= {"텀블러","키보드","마우스","물병","책"};
		String[]strColor= {"pink","blue","black","white"};
		
		//str1은 1번째: 텀블러
		System.out.println("str1_for");
		
		for(int i=0;i<str1.length;i++)
		{
			System.out.print((i+1)+"번째:"+str1[i]+" ");
		}
		
		System.out.println();
		System.out.println("str1_foreach");
		
		for(String a:str1)
		{
			System.out.println(a);
		}
		
		//strColor은 0번지색:pink
		System.out.println("strColor_for");
		for(int i=0;i<strColor.length;i++)
		{
			System.out.println(i+"번지색: "+strColor[i]);
		}
		
		System.out.println("strColor_foreach");
		
		for(String b:strColor)
		{
			System.out.print(b+" ");
		}
	}

}
