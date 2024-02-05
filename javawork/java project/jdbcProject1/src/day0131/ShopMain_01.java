package day0131;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class ShopMain_01 extends JFrame implements ActionListener {

	JButton btnAdd,btnDel,btnUpdate,btnList;
	ShopDbModel dbmodel=new ShopDbModel();
	
	public ShopMain_01() {
		// TODO Auto-generated constructor stub
		super("shopmain");
		this.setBounds(1300,100,400,400);
		initDesign();
		this.setVisible(true);
	}

	public void initDesign()
	{	
		this.setLayout(new GridLayout(2,2));
		btnAdd=new JButton("상품추가");
		btnDel=new JButton("상품삭제");
		btnUpdate=new JButton("상품수정");
		btnList=new JButton("상품리스트");
		
		this.add(btnAdd);
		this.add(btnDel);
		this.add(btnUpdate);
		this.add(btnList);
		
		//이벤트
		btnAdd.addActionListener(this);
		btnDel.addActionListener(this);
		btnUpdate.addActionListener(this);
		btnList.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		if(ob==btnAdd)
		{	ShopAddForm add=new ShopAddForm();
			//System.out.println("add");
		}
		else if(ob==btnDel)
		{	
			String num= JOptionPane.showInputDialog("삭제할 num을 입력해 주세요");
			dbmodel.deleteSangpum(num);
			//System.out.println("del");
		}
		else if(ob==btnUpdate)
		{
			System.out.println("update");
		}
		else if(ob==btnList)
		{	ShopListForm listform=new ShopListForm();
			//System.out.println("list");
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new ShopMain_01();
	}

	

}
