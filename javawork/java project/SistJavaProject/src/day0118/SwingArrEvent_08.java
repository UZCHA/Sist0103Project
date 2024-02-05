package day0118;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class SwingArrEvent_08 extends JFrame implements ActionListener {
	Container cp;
	JButton[]btn=new JButton[6];
	String[]btnLabel= {"Red","Green","Blue","Magenta","Gray","Yellow"};
	Color[]btnColors= {Color.red,Color.green, Color.blue,Color.magenta,Color.gray,Color.yellow};
	
	
	public SwingArrEvent_08(String title) {
		super(title);

		cp=this.getContentPane();
		this.setBounds(1200, 100, 600, 300);
		cp.setBackground(new Color(255,255,200));
		
		initDesign();

		this.setVisible(true);
		}
		
		public void initDesign() {
			//Panel은 기본이 flowlayout이다.
			JPanel panel=new JPanel();
			panel.setBackground(Color.ORANGE);
			//프레임의 상단에 패널 배치,여기서 실행하면 좁지만 위에 버튼이 올라가면 넓어짐
			this.add(panel, BorderLayout.NORTH);
			
			//버튼생성
			for(int i=0;i<btn.length;i++)
			{
				//버튼 6개 생성
				btn[i]=new JButton(btnLabel[i]);
				//버튼 6개에 각각의 버튼색상 변경
				btn[i].setBackground(btnColors[i]);
				//panel에 버튼 6개 추가
				panel.add(btn[i]);
				//6개의 버튼에 이벤트 추가
				btn[i].addActionListener(this);
			}
			
		}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
new SwingArrEvent_08("배열 버튼이벤트 8");
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		
		Object ob=e.getSource();
		//각각의 버튼을 누르면 프레임에 배경색이 변경되도록 바꿔보자
		for(int i=0;i<btn.length;i++) {
			if(ob==btn[i])
			{
				cp.setBackground(btnColors[i]);
			this.setTitle("color: "+btnLabel[i]);
			}
		}
	}

}
