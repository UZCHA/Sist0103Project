package day0116;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class FileException_12 {

	//점수의 총개수,합계,평균
	public static void scoreRead() throws FileNotFoundException,IOException
	{
		String fileName="C:\\file\\score.txt";
		FileReader fr=null;
		BufferedReader br =null;

		int cnt=0;
		int total=0;
		double avg=0;

		//파일 읽기
		fr=new FileReader(fileName);
		System.out.println("파일 정상적으로 읽음!");
		br=new BufferedReader(fr);
		
		while(true) {
			String s=br.readLine();
			if(s==null)
				break;
			//문자열점수를 int로 변환해서 합계랑 갯수를 구해준다. 
			cnt++;
			total+=Integer.parseInt(s);//합계
		}
		//평균구하기
		avg=(double)total/cnt;

		System.out.println("총갯수: "+cnt);
		System.out.println("총점: "+total);
		System.out.printf("평균: %.2f\n",avg);

		//자원닫기. 안닫아도 오류는 안나지만 가급적 필수적으로 닫아준다.
		br.close();
		fr.close();

	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			scoreRead();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("정상종료");
	}

}
