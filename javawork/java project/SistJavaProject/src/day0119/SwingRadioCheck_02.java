package day0119;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

public class SwingRadioCheck_02 extends JFrame implements ActionListener{
	Container cp;
	JRadioButton[]rb=new JRadioButton[4]; //하나만 선택하고 싶을때
	JCheckBox[]cb=new JCheckBox[4];
	Color[]colors= {Color.red,Color.green,Color.blue,Color.yellow};
	JLabel lblmessage;

	public SwingRadioCheck_02(String title) {
		super(title);

		cp=this.getContentPane();
		this.setBounds(1200, 100, 500, 400);
		cp.setBackground(new Color(255,255,200));

		initDesign();

		this.setVisible(true);
	}
	public void initDesign(){
		//상단패널 보더로 감싼 4개의 라디오 버튼 만들기
		String[]str= {"레드","그린","블루","옐로우"};
		JPanel pTop=new JPanel();
		pTop.setBorder(new TitledBorder("글자색"));
		this.add(pTop,BorderLayout.NORTH);
		
		//라디오버튼 하나만 선택되도록 하려면 그룹을 지어줘야함
		ButtonGroup bg=new ButtonGroup();//하나를 선택하면 다른 하나를 선택 못하게 막는
		for(int i=0;i<rb.length;i++)
		{	//라디오버튼생성(텍스트, 기본체크)
			rb[i]=new JRadioButton(str[i],i==0?true:false);//첫번째 선택지인 레드로 체크가 되어있음
			rb[i].addActionListener(this);
			pTop.add(rb[i]);//탑 패널에 추가한것
			bg.add(rb[i]);// 그룹에 추가한것
			
			
		}
		
		//가운데 라벨
		lblmessage=new JLabel("안녕하세요 즐거운 금요일",JLabel.CENTER);
		lblmessage.setFont(new Font("궁서체", Font.BOLD,20));
		this.add(lblmessage);
		lblmessage.setBorder(new LineBorder(Color.red, 2));//라인굵기
		//하단패널에 보더로감싼 4개의 체크박스 만들기
		JPanel pBottom=new JPanel();
		pBottom.setBorder(new TitledBorder("가능언어"));
		this.add("South",pBottom);
		
		String[]str2= {"자바","오라클","html","jsp"};
		for(int i=0;i<cb.length;i++)
		{
			cb[i]=new JCheckBox(str2[i]);
			cb[i].addActionListener(this);//액션추가
			pBottom.add(cb[i]);
		}

	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new SwingRadioCheck_02("스윙 라디오 체크박스 2");
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		Object ob=e.getSource();
		//라디오버튼의 호출처리, 메세지 출력이 컬러별로 출력되도록
		for(int i=0;i<rb.length;i++)
		{
			if(ob==rb[i]) 
			{
				lblmessage.setForeground(colors[i]);
				lblmessage.setFont(new Font("",Font.BOLD,40));
			}
				
		}
		String msg="";
		for(int i=0;i<cb.length;i++)
		{
			if(cb[i].isSelected()==true)
			{msg+=cb[i].getText()+" ";
				
			}
		}
		lblmessage.setText(msg);
		
	}

}
