package day0118;

import java.awt.Color;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class SwingImageIcon_06 extends JFrame implements ActionListener{
	Container cp;
	
	//이미지버튼 아이콘 가져온다
	ImageIcon icon1=new ImageIcon("C:\\image\\left.GIF");
	ImageIcon icon2=new ImageIcon("C:\\image\\leftDown.GIF");
	ImageIcon icon3=new ImageIcon("C:\\image\\45-pandadog.GIF");
	ImageIcon icon4=new ImageIcon("C:\\image\\img_msn_i10.GIF");
	ImageIcon icon5=new ImageIcon("C:\\image\\an07.GIF");
	
	JButton btn1,btn2,btn3,btn4,btn5;
	
	public SwingImageIcon_06(String title) {
		super(title);

		cp=this.getContentPane();
		this.setBounds(1200, 100, 300, 300);
		cp.setBackground(new Color(255,255,200));
		initDesign();
		this.setVisible(true);
	}
	
	public void initDesign() {
		//2행2열
		this.setLayout(new GridLayout(2, 2));
		btn1=new JButton("hello",icon1);
		btn1.setHorizontalTextPosition(JButton.CENTER);//텍스트 가로위치
		btn1.setVerticalTextPosition(JButton.BOTTOM);//텍스트 세로위치
		this.add(btn1);
		
		btn1.setRolloverIcon(icon2);//마우스 올려두었을때 아이콘
		btn1.setPressedIcon(icon3);//버튼 눌렀을때 아이콘

		btn2=new JButton(icon4);
		this.add(btn2);
		
		btn3=new JButton("스윙버튼");
		this.add(btn3);

		btn4=new JButton("안녕",icon5);
		this.add(btn4);
		
		btn1.addActionListener(this);
		btn2.addActionListener(this);
		btn3.addActionListener(this);
		btn4.addActionListener(this);
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new SwingImageIcon_06("이미지버튼6");
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
		Object ob=e.getSource();
		if(ob==btn1)
			JOptionPane.showMessageDialog(this,"화살표를 눌렀어요");
		else if(ob==btn2)
			JOptionPane.showMessageDialog(this, "강아지를 눌렀어요");
		else if(ob==btn3)
			JOptionPane.showMessageDialog(this, "스윙버튼 눌었어요");
		else if(ob==btn4)
			JOptionPane.showMessageDialog(this, "새를 눌렀어요");
		
	}

}
