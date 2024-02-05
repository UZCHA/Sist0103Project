package day0118;

import java.awt.Color;
import java.awt.Container;
import java.awt.Event;
import java.awt.Font;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;
import javax.swing.plaf.FontUIResource;

//2개의 텍스트필드에 숫자를 넣고 버튼을 만든 후 클릭하면 라벨에 2+3=5 <==를 출력해보자

public class SwingTextF_10 extends JFrame {
	Container cp;
	JTextField tfNum1,tfNum2;
	JButton btnAdd,btnbbagi,btnna,btngob;
	JLabel lblNum1,lblNum2,lblResult;


	public SwingTextF_10(String title) {
		super();

		cp=this.getContentPane();
		this.setBounds(1200, 100, 320, 300);
		cp.setBackground(new Color(255,255,200));

		setDesign();

		this.setVisible(true);
	}
	public void setDesign(){

		this.setLayout(null);
		lblNum1=new JLabel("숫자1");
		lblNum2=new JLabel("숫자2");
		lblNum1.setBounds(20, 20, 50, 30);
		this.add(lblNum1);
		lblNum2.setBounds(20, 60, 50, 30);
		this.add(lblNum2);

		tfNum1=new JTextField();
		tfNum1.setBounds(80, 20, 60, 30);
		this.add(tfNum1);
		tfNum2=new JTextField();
		tfNum2.setBounds(80, 60, 60, 30);
		this.add(tfNum2);

		btnAdd=new JButton("+");
		btnAdd.setBounds(20,110,50,40);
		this.add(btnAdd);

		btnbbagi=new JButton("-");
		btnbbagi.setBounds(90,110,50,40);
		this.add(btnbbagi);

		btngob=new JButton("*");
		btngob.setBounds(160,110,50,40);
		this.add(btngob);

		btnna=new JButton("/");
		btnna.setBounds(230,110,50,40);
		this.add(btnna);

		lblResult=new JLabel("결과나오는곳");
		lblResult.setBounds(20,170,250,60);
		lblResult.setBorder(new TitledBorder("결과확인"));
		lblResult.setFont(new FontUIResource("", Font.BOLD,25));//글꼴변경
		this.add(lblResult);
		
		
		//익명내부클래스, 생성과 동시에 이벤트 생성,생성과 동시에 사라짐
		btnAdd.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				int num1=Integer.parseInt(tfNum1.getText().trim());//앞뒤공백제거후 변환
				int num2=Integer.parseInt(tfNum2.getText().trim());

				int sum=num1+num2;
				String s=num1+"+"+num2;
				lblResult.setText(Integer.toString(num1)+"+"+Integer.toString(num2)+"="+Integer.toString(sum));
			}
		});

		btnbbagi.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				int num1=Integer.parseInt(tfNum1.getText().trim());
				int num2=Integer.parseInt(tfNum2.getText().trim());
				int bbagi=num1-num2;
				String s=num1+"-"+num2;
				lblResult.setText(Integer.toString(num1)+"-"+Integer.toString(num2)+"="+Integer.toString(bbagi));
			}
		});
		btngob.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				int num1=Integer.parseInt(tfNum1.getText().trim());
				int num2=Integer.parseInt(tfNum2.getText().trim());
				int gob=num1*num2;
				//String s=num1+"*"+num2;
				lblResult.setText(Integer.toString(num1)+"*"+Integer.toString(num2)+"="+Integer.toString(gob));
			}
		});
		btnna.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				int num1=Integer.parseInt(tfNum1.getText().trim());
				int num2=Integer.parseInt(tfNum2.getText().trim());
				double na=num1/num2;
				//String s=num1+"*"+num2;
				lblResult.setText(Integer.toString(num1)+"/"+Integer.toString(num2)+"="+Double.toString(na));
			}
		});
	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new SwingTextF_10("텍스트필드문제");
	}

}
