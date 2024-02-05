package day0118;

import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;

public class SwingEvent_07 extends JFrame {
	Container cp;
	JButton btn1,btn2;
	
	public SwingEvent_07(String title) {
		super(title);

		cp=this.getContentPane();
		this.setBounds(1200, 100, 500, 300);
		cp.setBackground(new Color(255,255,200));
		initDesign();
		this.setVisible(true);
	}
	
	public void initDesign() {
		//Flow 레이아웃으로 버튼 2개 생성
		//버튼색상 그레이로 변경, 버튼 색상 그린으로 변경
		this.setLayout(new FlowLayout());
		btn1=new JButton("버튼색상 그레이로 변경");
		btn2=new JButton("버튼색상 그린으로 변경");
		
		this.add(btn1);
		this.add(btn2);
		
		//버튼1에 생성 및 이벤트 주기(익명내부클래스 형식)
		btn1.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				//getContentPane().setBackground(Color.gray);
				cp.setBackground(Color.gray);//위에 cp=this.getContentPane();해놔서 cp로 대신가능
			}
		});
		//버튼2에 생성 및 이벤트 주기
		btn2.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				cp.setBackground(Color.green);
			}
		});
		
		
	}

	public static void main(String[] args) {
		new SwingEvent_07("버튼이벤트7");
	}

}
