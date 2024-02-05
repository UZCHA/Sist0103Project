package day0116;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

//BufferReader: 버퍼를 사용해서 파일읽기
//FileReader: 경로에있는 파일을 로드해준다. 반드시 exception발생
public class FileException_11 {

	public static void read() {
		String filename="C:\\file\\memo.txt";
		BufferedReader br=null;
		FileReader fr=null;//reader가 붙으면 1바이트 이상. 문자단위

		//읽기위해서 파일열기
		try {
			fr=new FileReader(filename);
			System.out.println("파일을 열었어요.");
			br=new BufferedReader(fr);

			//여러줄을 읽어야 하므로 while문으로 읽는다. 
			while(true) {
				String s= br.readLine();
				//마지막줄일 경우 null값을 읽는다. null값일 경우 while 빠져나간다.
				if(s==null)
					break;
				System.out.println(s);
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("파일이 없습니다.");
		}catch (IOException e) {
			// TODO: handle exception
		}
		finally {
			try {
				br.close();//생성한 반대순서로 닫아준다. br을 나중에 생성했으므로 먼저 닫아줌. 
				fr.close();
				System.out.println("파일에 대한 자원을 모두 닫았습니다.");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		read();
		System.out.println("**정상종료**");
	}

}
