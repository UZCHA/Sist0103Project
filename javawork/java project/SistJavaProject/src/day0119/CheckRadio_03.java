package day0119;

import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.border.LineBorder;

public class CheckRadio_03 extends JFrame implements ActionListener,ItemListener{
	Container cp;
	JCheckBox[] cbHobby=new JCheckBox[4];
	JCheckBox cbDriver;
	JButton btnHobby;
	JLabel lblResult;
	JCheckBox ggol;

	public CheckRadio_03(String title) {
		super(title);

		cp=this.getContentPane();
		this.setBounds(1200, 100, 350, 300);
		cp.setBackground(new Color(255,255,200));
		
		initDesign();

		this.setVisible(true);
	}
	public void initDesign(){
		
		this.setLayout(null);
		cbDriver=new JCheckBox("운전면허");
		cbDriver.setBounds(20,20,100,30);
		cbDriver.setOpaque(false);//투명하게
		cbDriver.addItemListener(this);//ItemListener이벤트 핸들러와 연결되는 객체임을 표시.
		this.add(cbDriver);
		
		ggol=new JCheckBox("라벨을 굵게");
		ggol.setBounds(20,50,100,30);
		ggol.setOpaque(false);
		ggol.addItemListener(this);
		this.add(ggol);
		
		lblResult=new JLabel("have a nice day",JLabel.CENTER);
		lblResult.setBounds(20,200,300,50);
		lblResult.setBorder(new LineBorder(Color.green,5));
		this.add(lblResult);
		
		//취미 체크박스
		String[] hobbys= {"독서","영화","핸드폰","산책"};
		int xpos=20;
		for(int i=0;i<cbHobby.length;i++)
		{
			cbHobby[i]=new JCheckBox(hobbys[i]);
			cbHobby[i].setBounds(xpos,80,80,30);
			cbHobby[i].setOpaque(false);
			this.add(cbHobby[i]);
			xpos+=80;
		}
		
		//버튼
		btnHobby=new JButton("나의 취미 출력");
		btnHobby.setBounds(60,140,200,30);
		this.add(btnHobby);
		btnHobby.addActionListener(this);//버튼에 이벤트 추가
		
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		
		Object ob=e.getSource();
		if(ob==btnHobby)
		{
			String s="나의 취미는";
			int select=0;
		for(int i=0;i<cbHobby.length;i++)
		{
			if(cbHobby[i].isSelected()) 
			{
				select++;
				s+="["+cbHobby[i].getText()+"]";
							
			}
			
				
		}
		if(select==0)
			s+=" 없습니다";
		else
			s+=" 입니다.";
		//라벨에 출력
			lblResult.setText(s);
		}
		
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new CheckRadio_03("체크박스 3");
	}
	
	//아이템
	@Override
	public void itemStateChanged(ItemEvent e) {
		Object ob=e.getSource();
		if(ob==cbDriver)
		{
			String s="체크상태"+cbDriver.isSelected()+" ,텍스트 "+cbDriver.getText();
			lblResult.setText(s);
		}
		else if(ob==ggol)
		{
			if(ggol.isSelected())
			lblResult.setFont(new Font("",Font.BOLD,16));
			else
			lblResult.setFont(new Font("",Font.BOLD,13));
		}
		
	}

}
