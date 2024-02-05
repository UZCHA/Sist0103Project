package kiosk;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class KioskHome extends JFrame implements ActionListener{

	Container cp;
	JButton btnHome,btnPick;
	JPanel jpl1,jpl2,jpl3;

	
	ImageIcon icon1=new ImageIcon("C:\\image\\home2.png");
	
	KioskMain mainform=new KioskMain("주문");

	public KioskHome(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(1200, 100, 600, 600);
		cp.setBackground(new Color(255,255,200));

		initDesign();
		this.setVisible(true);


	}
	public void initDesign()
	{
		jpl1=new JPanel();
		JLabel lbl=new JLabel(icon1);
		jpl1.add(lbl);
		this.add(jpl1,BorderLayout.CENTER);

		jpl2=new JPanel();
		jpl2.setBackground(new Color(255,187,0));
		this.add(jpl2,BorderLayout.SOUTH);
		btnHome=new JButton("매장");
		btnHome.addActionListener(this);
		btnPick=new JButton("포장");
		btnPick.addActionListener(this);
		jpl2.add(btnHome);
		jpl2.add(btnPick);

		jpl3=new JPanel();
		jpl3.setBackground(new Color(255,187,0));
		this.add(jpl3,BorderLayout.NORTH);

		JLabel label = new JLabel("MOM'S TOUCH");
		jpl3.add(label);
		Font font = new Font("", Font.BOLD, 30);
        label.setFont(font);

		//setSize(300, 200);
		//setLocationRelativeTo(null); 중앙에 창이 오게 하는거 어쩐지 위치가 안옮겨지더라
		//setVisible(true);



	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		KioskHome kiosk=new KioskHome("키오스크 주문");
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		if(ob==btnHome)
		{
			mainform.setVisible(true);
			dispose();
		}
		else if(ob==btnPick)
		{
			mainform.setVisible(true);
			dispose();
		}
	}

}
