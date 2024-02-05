package day0116;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.StringTokenizer;

public class QuizFileException_15 {
	public static void fruitShop(){

	String fName="C:\\file\\fruitshop.txt";
	FileReader fr=null;
	BufferedReader br=null;
	int cnt=0;
	int total=0;
	
	
		try {
			fr=new FileReader(fName);
			br=new BufferedReader(fr);
			System.out.println("**과일입고목록**");
			System.out.println("번호\t과일명\t수량\t단가\t총금액");
			System.out.println("-------------------------------------");
			
			while(true)
			{
				String s=br.readLine();
				
				if(s==null)
					break;
				cnt++;
				
				//split로 하는 방법
				//String[] data=s.split(",");
				//total=Integer.parseInt(data[1])*Integer.parseInt(data[2]);
				//System.out.println(cnt+"\t"+data[0]+"\t"+data[1]+"\t"+data[2]+"\t"+total+"원");
				
				
				//StringTokenizer로 하는 방법
				StringTokenizer str=new StringTokenizer(s, ",");
				String a=str.nextToken();
				String b=str.nextToken();
				String c=str.nextToken();
				
				total=Integer.parseInt(b)*Integer.parseInt(c);
				
				System.out.println(cnt+"\t"+a+"\t"+b+"\t"+c+"\t"+total+"원");
			}
			
		}catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (IOException e) {
			// TODO: handle exception
		}finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	
	}

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

			fruitShop();
	}

}
