package day0119;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class Lotto extends JFrame implements ActionListener{
	Container cp;
	JButton btn;
	JLabel lbl;
	int[]lotto=new int[6];

	public Lotto(String title) {
		super(title);

		cp=this.getContentPane();
		this.setBounds(1200, 100, 300, 300);
		cp.setBackground(new Color(255,255,200));

		initDesign();

		this.setVisible(true);
	}
	public void initDesign(){

		lbl=new JLabel("결과나오는곳",JLabel.CENTER);
		lbl.setFont(new Font("", Font.BOLD,20));
		this.add(lbl);
		
		btn=new JButton("숫자뽑기");
		btn.setFont(new Font("", Font.BOLD, 20));
		btn.addActionListener(this);
		this.add(btn,BorderLayout.NORTH);

	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Lotto("랜덤숫자 가챠");
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		for(int i=0;i<lotto.length;i++)
		{
			lotto[i]=(int)(Math.random()*45+1);
			for(int j=0;j<i;j++)
			{
				if(lotto[i]==lotto[j]) 
				{
					i--;
					break;
				}
			}

		}
		lbl.setText(Integer.toString(lotto[0])+"  "+Integer.toString(lotto[1])+"  "+Integer.toString(lotto[2])+"  "+Integer.toString(lotto[3])+"  "+Integer.toString(lotto[4])+"  "+Integer.toString(lotto[5]));
	}

}
