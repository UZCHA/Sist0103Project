package day0119;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

public class SwingRadioCheckbox extends JFrame implements ActionListener{
	Container cp;
	JCheckBox namja;
	JCheckBox[]trNara=new JCheckBox[4];
	JRadioButton[]rb=new JRadioButton[3];
	JLabel lblResult;
	Color[]colors= {Color.red,Color.blue,Color.green};
	JButton btnHobby;

	public SwingRadioCheckbox(String title) {
		super(title);

		cp=this.getContentPane();
		this.setBounds(1200, 100, 400, 400);
		cp.setBackground(new Color(255,255,200));
		
		initDesign();

		this.setVisible(true);
	}
	public void initDesign(){
		this.setLayout(null);
		namja=new JCheckBox("남자");
		namja.setBounds(20, 20, 50, 50);
		namja.setOpaque(false);
		this.add(namja);
		
		String[] str= {"레드","블루","그린"};
		JPanel pTop=new JPanel();
		pTop.setBounds(20,60,300,50);
		pTop.setOpaque(false);
		pTop.setBorder(new TitledBorder("글자색"));
		this.add(pTop);
		
		ButtonGroup bg=new ButtonGroup();//하나를 선택하면 다른 하나를 선택 못하게 막는
		for(int i=0;i<rb.length;i++)
		{	//라디오버튼생성(텍스트, 기본체크)
			rb[i]=new JRadioButton(str[i],i==0?true:false);//첫번째 선택지인 레드로 체크가 되어있음
			rb[i].addActionListener(this);
			pTop.add(rb[i]);//탑 패널에 추가한것
			bg.add(rb[i]);}// 그룹에 추가한것
		
		String[] str2= {"미국","이탈리아","일본","스페인"};
		JPanel pTop2=new JPanel();
		pTop2.setBounds(20,150,300,50);
		pTop2.setOpaque(false);
		pTop2.setBorder(new TitledBorder("내가 가본나라"));
		this.add(pTop2);
		
		for(int i=0;i<trNara.length;i++)
		{
			trNara[i]=new JCheckBox(str2[i]);
			pTop2.add(trNara[i]);
		}
		
		btnHobby=new JButton("가본 나라 출력");
		btnHobby.setBounds(70,220,200,30);
		this.add(btnHobby);
		btnHobby.addActionListener(this);
		
		lblResult=new JLabel("결과창",JLabel.CENTER);
		lblResult.setBounds(20,270,300,50);
		lblResult.setBorder(new LineBorder(Color.gray,3));
		this.add(lblResult);
		
		
		
		

	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new SwingRadioCheckbox("주말과제");
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		for(int i=0; i<rb.length;i++)
		{
			if(ob==rb[i])
			{
				lblResult.setForeground(colors[i]);
			}
		}
		
		for(int i=0;i<trNara.length;i++){
			if(ob==trNara)
			{
				{
					String s="나의 취미는";
					int select=0;
				for(int j=0;j<trNara.length;i++)
				{
					if(trNara[j].isSelected()) 
					{
						select++;
						s+="["+trNara[j].getText()+"]";
									
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
		}
	}

}
