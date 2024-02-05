package day0119;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.Panel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class SwingLabelColorRandom_01 extends JFrame implements ActionListener {

	Container cp;
	JLabel[]lblLabel=new JLabel[9];
	String[]str= {"햄버거","치킨","곱창","부침개","요거트","샐러드","연어","부대찌개","커피"};
	JButton btn;

	public SwingLabelColorRandom_01(String title) {
		super(title);

		cp=this.getContentPane();
		this.setBounds(1200, 100, 500, 500);
		cp.setBackground(new Color(255,255,200));

		initDesign();

		this.setVisible(true);
	}
	public void initDesign(){
		
		//패널을 프레임의 센터에 추가
		Panel pCenter=new Panel(new GridLayout(3, 3));
		this.add(pCenter,BorderLayout.CENTER);
		
		//라벨을 패널에 추가
		for(int i=0;i<lblLabel.length;i++)
		{
			lblLabel[i]=new JLabel(str[i],JLabel.CENTER);
			//처음부터 랜덤색상으로 출발
			int r=(int)(Math.random()*256);
			int g=(int)(Math.random()*256);
			int b=(int)(Math.random()*256);
			lblLabel[i].setBackground(new Color(r,g,b));
			//패널에 라벨 추가
			pCenter.add(lblLabel[i]);
			lblLabel[i].setFont(new Font("궁서체", Font.BOLD,15));
			lblLabel[i].setOpaque(true);//투명도 조절
		}
		//프레임의 하단에 버튼 생성후 추가
		btn=new JButton("라벨색상 변경");
		//버튼에 이벤트 추가, 하단에 위치
		this.add(btn,BorderLayout.SOUTH);
		btn.addActionListener(this);
		

	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new SwingLabelColorRandom_01("스윙랜덤컬러 생성 1");
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		for(int i=0;i<lblLabel.length;i++)
		{	//rgb칼라는 0~255사이의 색, R,G,B값이 필요
			//lblLabel[i].setBackground(new Color(?,?,?));
			int r=(int)(Math.random()*256);
			int g=(int)(Math.random()*256);
			int b=(int)(Math.random()*256);
			lblLabel[i].setBackground(new Color(r,g,b));
		}
		
	}

}
