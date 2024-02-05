package day0111;

class Artist{
	//변수명
	static String soName;//소속기획사 공통이므로 static
	private String guName;
	private String songName;
	static int cnt=0;
	
	
	//명시적 생성자
	public void ArtistInpo( String guname, String songname) {
		
		this.guName=guname;
		this.songName=songname;
	}
	
	
	//출력메서드 한번에 만들기
	
	public void ArtistData() {
		cnt++;
		System.out.println("**아티스트 정보_"+cnt+"**");
		System.out.println("소속기획사: "+Artist.soName);
		System.out.println("그룹명: "+this.guName);
		System.out.println("대표곡: "+this.songName);
		System.out.println("--------------------");
	}
}



public class QuizIntance_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Artist art1=new Artist();
		Artist art2=new Artist();
		
		art1.ArtistInpo("bts","버터");
		art2.ArtistInpo("뉴진스","어텐션");
		Artist.soName="하이브";
		
		art1.ArtistData();
		art2.ArtistData();
	}

}
