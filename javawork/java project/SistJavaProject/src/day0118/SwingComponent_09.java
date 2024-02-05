package day0118;

import java.awt.Color;
import java.awt.Container;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;
//jframe에서 상속받은 것을 사용하기 때문에 this사용
//아놔 왜 계속 this가 무슨 기준으로 여기저기 쓰이나 했네..이제 이해했네 ㅠㅠ
public class SwingComponent_09 extends JFrame {
	Container cp;
	JTextField text1,text2;
	JLabel lbl1,lbl2,lbl3,lbl4;
	Icon icon1=new ImageIcon("C:\\work\\image\\chick.GIF");
	Icon icon2=new ImageIcon("C:\\work\\image\\ahiru_a001.GIF");
	
	
	public SwingComponent_09(String title) {
		super(title);//부모한테서 온 타이틀

		cp=this.getContentPane();
		this.setBounds(1200, 100, 300, 300);
		cp.setBackground(new Color(255,255,200));
		
		initDesign();

		this.setVisible(true);
	}
	public void initDesign(){
		this.setLayout(null);//레이아웃이없다=하나부터 열까지 내가 지정해줌
		
		text1=new JTextField();
		text1.setBounds(10, 20, 80, 30);
		this.add(text1);
		
		text2=new JTextField("Have a Nice Day");
		text2.setBounds(10, 60, 150, 30);
		this.add(text2);
		
		lbl1=new JLabel("안녕하세요",JLabel.CENTER);
		lbl1.setBounds(10,100,200,30);
		lbl1.setBackground(Color.orange);
		lbl1.setOpaque(true);//불투명모드
		this.add(lbl1);
		
		lbl2=new JLabel("happy day", icon1,JLabel.RIGHT);
		lbl2.setBounds(10,150,200,30);
		lbl2.setBorder(new LineBorder(Color.red));
		this.add(lbl2);
		
		lbl3=new JLabel("스윙공부", icon2, JLabel.CENTER);
		lbl3.setBounds(10,180,200,30);
		lbl3.setBorder(new TitledBorder("쌍용교육"));
		this.add(lbl3);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
		lbl4=new JLabel(sdf.format(new Date()),icon2,JLabel.LEFT);
		lbl4.setBounds(10,210,250,30);
		lbl4.setBorder(new LineBorder(Color.pink,5));
		this.add(lbl4);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new SwingComponent_09("스윙컴포넌트9");
	}

}
