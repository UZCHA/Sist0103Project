package day0118;

import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class SwingButtonEvent_05 extends JFrame implements ActionListener {
	Container cp;
	JButton btn1,btn2;
	
	public SwingButtonEvent_05(String title) {
		super(title);

		cp=this.getContentPane();
		this.setBounds(1200, 100, 300, 300);
		cp.setBackground(new Color(255,255,200));
		
		initDesign();
		
		this.setVisible(true);
	}
	public void initDesign() {
		this.setLayout(new FlowLayout());
		btn1=new JButton("◀");
		btn2=new JButton("▶");
		//버튼색상
		btn1.setBackground(Color.LIGHT_GRAY);
		btn2.setBackground(Color.ORANGE);
		//글자색상
		btn1.setForeground(Color.red);
		btn2.setForeground(Color.red);
		//버튼추가
		this.add(btn1);
		this.add(btn2);
		
		btn1.addActionListener(this);
		btn2.addActionListener(this);
	}

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new SwingButtonEvent_05("버튼이벤트5");
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob=e.getSource();
		if(ob==btn1)
			JOptionPane.showMessageDialog(this, "왼쪽으로 이동");
		else if(ob==btn2)
			JOptionPane.showMessageDialog(this,"오른으로 이동");
		
	}

}
