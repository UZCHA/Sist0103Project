package day0130;

import java.awt.Color;
import java.awt.Container;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class UpdateStuinfo2 extends JFrame{
	Container cp;
	JTextField tfName, tfJava, tfJsp, tfSpring;
	JComboBox<String> cbBan;
	JButton btnMod;
	String num;
	
	public UpdateStuinfo2(String title)
	{
		super(title);
		cp=this.getContentPane();
		this.setBounds(1100, 100, 200, 250);
		cp.setBackground(new Color(255,204,204));
		
		initDesign();
		
		//this.setVisible(true);
	}
	
	public void initDesign()
	{
		this.setLayout(null);
		JLabel lblTile1=new JLabel("이름");
		JLabel lblTile2=new JLabel("반");
		JLabel lblTile3=new JLabel("java");
		JLabel lblTile4=new JLabel("jsp");
		JLabel lblTile5=new JLabel("spring");
		
		tfName=new JTextField(4);
		tfJava=new JTextField(3);
		tfJsp=new JTextField(3);
		tfSpring=new JTextField(3);
		
		String[]ban= {"aws반","front반","backend반","design반"};
		cbBan=new JComboBox<String>(ban);
		btnMod=new JButton("수정");
		//라벨5개 
		lblTile1.setBounds(30, 10, 60, 30);
		this.add(lblTile1);
		lblTile2.setBounds(30, 40, 60, 30);
		this.add(lblTile2);
		lblTile3.setBounds(30, 70, 60, 30);
		this.add(lblTile3);
		lblTile4.setBounds(30, 100, 60, 30);
		this.add(lblTile4);
		lblTile5.setBounds(30, 130, 60, 30);
		this.add(lblTile5);
		
		//이름,반,자바,jsp,spring 순서대로 넣어준다
		tfName.setBounds(80,15,70,20);
		this.add(tfName);
		cbBan.setBounds(80,45,70,20);
		this.add(cbBan);
		tfJava.setBounds(80,75,70,20);
		this.add(tfJava);
		tfJsp.setBounds(80,105,70,20);
		this.add(tfJsp);
		tfSpring.setBounds(80,135,70,20);
		this.add(tfSpring);
		
		//추가버튼 
		btnMod.setBounds(60,170,70,30);
		this.add(btnMod);
		
	}
	
//	public static void main(String[] args) {
//		new UpdateStuinfo2("학생정보 수정");
	//}
}
