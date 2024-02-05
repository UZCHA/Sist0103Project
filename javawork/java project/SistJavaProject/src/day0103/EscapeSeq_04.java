package day0103;

public class EscapeSeq_04 {

	public static void main(String[] args) {
		// 문자열내에서 (쌍따옴표 안에서 사용) 특별한 의미로 해석되는 문자들을 가르켜 이스케이프 시퀀스라고 한다. 
		// 이스케이프 시퀀스는 모두\로 시작함
		// \t: 다음 탭 위치로 이동
		// \n: 다음 줄로 이동
		// \': 따옴표 
		// \": 쌍따옴표
		// \\: 백슬래시

		System.out.println("Apple\tOrange\tBanana");
		System.out.println("Apple\'");
		System.out.println("Apple\"");
		System.out.println("C:\\");
		// \하나만 쓰면 안됨 \자체로 시퀀스에 해당하기 때문에
		System.out.println("\"Hello\"");
		System.out.println("\"pizza\",\"spagetti\",\"hamburger\"");
		System.out.println("\"pizza\"\n\"spagetti\"\n\"hamburger\"");
	}

}
