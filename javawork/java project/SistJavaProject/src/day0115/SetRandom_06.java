package day0115;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;
import java.util.Set;

public class SetRandom_06 {

	public static void main(String[] args) {
		//set,random 이용해서 1~45의 서로 다른 난수 6개
		
		Random r=new Random();
		Set<Integer> set=new HashSet<Integer>();
		
		while(true) {
			int n=r.nextInt(45)+1;
			set.add(n);
			
			if(set.size()==6)
				break;
		}
		//출력
		System.out.println("출력_#1");
		for(int n:set)
			System.out.printf("%5d",n);
		
		System.out.println("\n출력_#2");
		Iterator<Integer> iter=set.iterator();
		while(iter.hasNext())
			System.out.printf("%5d",iter.next());
		
		System.out.println("\n출력_#3");
		Object[]ob=set.toArray();
		Arrays.sort(ob);
		for(int i=0;i<ob.length;i++)
		{
			int s= (int)ob[i];
			System.out.print(s+" ");
		}
			
		
	}

}
