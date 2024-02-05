package day0117;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

public class FileWriter_03 {
	
	public static void fileWrite() {
		FileWriter fw=null;
		String fileName="C:\\file\\test1.txt";
		try {
			fw=new FileWriter(fileName);//파일 새로 생성:같은 이름이 있어도 새로 생성
			//파일에 내용추가
			fw.write("Have a Nice Day\n");//메모장에 줄 넘김
			fw.write("오늘은 수요일\n");
			fw.write(new Date().toString()+"\n");//문자열을 쓰라했는데 날짜열을 쓰면 toString으로 변환
					
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public static void fileWrite2() {
		
		FileWriter fw=null;
		String fileName="C:\\file\\test1.txt";
		
		try {
			fw=new FileWriter(fileName,true);//추가모드
			fw.write("차유지\n");
			fw.write("------------------\n");
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		fileWrite();
		fileWrite2();
	}

}
