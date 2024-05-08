package spring.day0430.anno1;

import org.springframework.stereotype.Component;

@Component //자동으로 bean에 등록(component옆에 아무것도 안쓰면 id가 클래스명으로 자동 등록됨_첫글자만 소문자_myDao가 id가 된다)
public class MyDao implements DaoInter {

	@Override
	public void insertData(String str) {
		// TODO Auto-generated method stub
		System.out.println(str+"_데이타 db에 추가성공!");
	}

	@Override
	public void deleteData(String num) {
		// TODO Auto-generated method stub
		System.out.println(num+"_에 해당하는 데이타 삭제 성공!");
	}

}
