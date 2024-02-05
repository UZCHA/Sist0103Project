package day0115;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

//Hashset: 순서를 유지하지않는 데이타 집합, 중복허용이 안됨
//구현클래스, 인덱스가 없음.
//set인터페이스를 구현하려면 HashSet이 필요
//<E> 제네릭: 타입을 명시하면 그 이외 타입을 넣으면 오류
public class HashSet_04 {

	public static void main(String[] args) {
		// 컬렉션은 가변적이므로 배열의 고정형을 보완해준다.

		Set<String> set1=new HashSet<String>();
		//set1안에 String만을 담겠다는 것. Set은 인터페이스 이므로 생성안됨. 그걸 구현한 클래스인 HashSet을 써야함
		
		set1.add("사과");
		set1.add("배");
		set1.add("오렌지");
		set1.add("포도");
		set1.add("사과");//갯수에 포함 안됨. 중복허용이 안되니까. 
		set1.add("바나나");
		
		System.out.println("데이터의 갯수:"+set1.size());
		
		System.out.println("출력_#1");
		
		for(String s:set1)
			System.out.println(s);
		
		System.out.println("출력_#2");
		Iterator<String> iter=set1.iterator();
		while(iter.hasNext())//데이타가 더이상 없으면 false 반환 할때까지 출력
		{
			String s=iter.next();
			System.out.println(s);//다음으로 이동함과 동시에 데이타 반환
					
		}
		System.out.println("출력_#3");
		Object[]ob= set1.toArray();
		for(int i=0;i<ob.length;i++)
		{
			System.out.println(ob[i]);
		}
		
		//모든 데이타 삭제
		set1.clear();
		
		//확인
		if(set1.isEmpty())
			System.out.println("set타입안에 데이타가 없다");
		else
			System.out.println("set타입안에 데이타가 있다");
		
		
	}

}
