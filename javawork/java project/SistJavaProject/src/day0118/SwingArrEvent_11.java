package day0118;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.plaf.FontUIResource;

public class SwingArrEvent_11 extends JFrame implements ActionListener{
	Container cp;
	JButton[]btn=new JButton[5];
	String[]btnLabel= {"Red","Green","Blue","Magenta","Gray"};
	Color[]btnColors= {Color.red,Color.green, Color.blue,Color.magenta,Color.gray};
	JLabel la;
	
	public SwingArrEvent_11(String title) {
		super(title);

		cp=this.getContentPane();
		this.setBounds(1200, 100, 600, 300);
		cp.setBackground(new Color(255,255,200));
		
		initDesign();

		this.setVisible(true);
	}
	public void initDesign(){
			JPanel panel=new JPanel();
			panel.setBackground(Color.LIGHT_GRAY);
			this.add(panel,BorderLayout.NORTH);
			
			for(int i=0;i<btn.length;i++)
			{
				btn[i]=new JButton(btnLabel[i]);
				btn[i].setForeground(btnColors[i]);
				panel.add(btn[i]);
				btn[i].addActionListener(this);
				
			}
			la=new JLabel("안녕하세요",JLabel.CENTER);
			//la.setHorizontalTextPosition(JLabel.CENTER);
			la.setFont(new FontUIResource("", Font.BOLD,50));
			this.add(la);
			
		
	}

	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
new SwingArrEvent_11("색상에따라 글자색 변경");
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		for(int i=0;i<btn.length;i++)
		{
			if(ob==btn[i])
			{
				la.setForeground(btnColors[i]);
			}
		}
	
		
	}

}
