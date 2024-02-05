package kiosk;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

import oracleDB.DbConnect;

public class KioskMain extends JFrame implements ActionListener{

	Container cp;
	JPanel panel1,panel2,panel3,panel4;
	JButton btnBurger,btnDrink,btnSide,btnCash,btnMinus;
	JLabel totlbl;
	
	DefaultTableModel model;
	JTable table;
	DbConnect db=new DbConnect();

	KioskBtnBurger bform=new KioskBtnBurger("햄버거 메뉴");
	KioskBtnDrink dform=new KioskBtnDrink("음료 메뉴");
	KioskBtnSide sform=new KioskBtnSide("사이드 메뉴");


	public KioskMain(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(1200, 100, 600, 600);
		cp.setBackground(new Color(255,187,0));
		
		initDesign();
		//this.setVisible(true);

	}


	public void tableWrite() {
		model.setRowCount(0);
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		ResultSet rs=null;


		String sql="select *from kiosk_menu2";

		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();

			while(rs.next())
			{
				Vector<String> data=new Vector<String>();

				data.add(rs.getString("num"));
				data.add(rs.getString("name"));
				data.add(rs.getString("price"));
				data.add(rs.getString("su"));
				data.add(rs.getString("tot"));

				model.addRow(data);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}

		

	}

	public void deleteData(String num)
	{
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		String sql="delete from kiosk_menu2 where num=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);

			int a=pstmt.executeUpdate();
			if(a==0)
				JOptionPane.showMessageDialog(this, "주문 목록에 없습니다");

			else 
				tableWrite();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}

	}
	public void deletecharge()
	{
		
		Connection conn=db.getOracle();
		Statement stmt=null;
		
		String sql="delete from kiosk_menu2";
		
		try {
			stmt=conn.createStatement();
			stmt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(stmt, conn);
		}
	}


	public void insertData(String num)
	{
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;


		String sql="INSERT INTO kiosk_menu2 (num,name,price,su,tot) "+
				"select seq_kio.nextval,name,price,su,tot from kiosk_menu where num=?";


		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,num);
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		tableWrite();
	}
	/////////////////////

	public void insertDrink(String num)
	{
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;

		String sql="insert into kiosk_menu2(num,name,price,su,tot) "
				+ "select seq_kio.nextval,name,price,su,tot from kiosk_drinkmenu where num=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}

	///////////////////////////////////////////
	
	public void insertside(String num)
	{
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;

		String sql="insert into kiosk_menu2(num,name,price,su,tot) "
				+ "select seq_kio.nextval,name,price,su,tot from kiosk_sidemenu where num=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	////////////////////////////////////////////////////
	
	
	private void updateTotLabel() {
        int rowCount = model.getRowCount();
        int totalAmount = 0;

        // 테이블 모델의 특정 열 값을 합산
        for (int i = 0; i < rowCount; i++) {
            int amount = Integer.parseInt((String) model.getValueAt(i, 4));
            totalAmount += amount;
        }

        // 합계를 JLabel에 표시
        totlbl.setText("총 금액: " + totalAmount + "원");
    }
	
	
	/////////////////////////////////
	public void initDesign() {

		panel1=new JPanel();
		panel1.setBackground(new Color(255,187,0));
		this.add(panel1,BorderLayout.NORTH);

		//panel2=new JPanel();
		//panel2.setBackground(new Color(255,200,200));
		//this.add(panel2,BorderLayout.CENTER);

		String[]title= {"번호","상품명","가격","수량","총금액"};

		model=new DefaultTableModel(title,0);

		table=new JTable(model);

		Font font=new Font("",Font.BOLD,15);
		JTableHeader header = table.getTableHeader();

		header.setFont(font);
		table.setFont(font);

		this.add("Center",new JScrollPane(table));

		tableWrite();
		
		totlbl=new JLabel("총금액:0원");
		panel3=new JPanel();
		panel3.add(totlbl);
		panel3.setBackground(new Color(255,255,200));
		

		btnBurger=new JButton("햄버거 메뉴");
		btnBurger.addActionListener(this);
		btnDrink=new JButton("음료 메뉴");
		btnDrink.addActionListener(this);
		btnSide=new JButton("사이드 메뉴");
		btnSide.addActionListener(this);
		panel1.add(btnBurger);
		panel1.add(btnDrink);
		panel1.add(btnSide);

		bform.btn1.addActionListener(this);
		dform.btn1.addActionListener(this);
		sform.btn1.addActionListener(this);
		
		btnCash=new JButton("결제");
		btnCash.addActionListener(this);
		btnMinus=new JButton("주문 취소");
		btnMinus.addActionListener(this);
		panel3.add(btnCash);
		panel3.add(btnMinus);
		this.add(panel3,BorderLayout.SOUTH);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		KioskMain main=new KioskMain("주문메인");
	}

	private void resetTableData() {
		// 테이블 모델의 행을 삭제하여 데이터 초기화
		model.setRowCount(0);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		if(ob==btnBurger)
		{
			bform.setVisible(true);

		}
		else if(ob==bform.btn1)
		{	String num=JOptionPane.showInputDialog("주문할 상품은?");
			insertData(num);
			tableWrite();
			updateTotLabel();
		}

		else if(ob==btnDrink)
		{
			dform.setVisible(true);
		}
		
		else if(ob==dform.btn1)
		{
			String num=JOptionPane.showInputDialog("주문할 상품은?");
			insertDrink(num);
			tableWrite();
			updateTotLabel();
		}
		
		else if(ob==btnSide)
		{
			sform.setVisible(true);
		}
		else if(ob==sform.btn1)
		{	
			String num=JOptionPane.showInputDialog("주문할 상품은?");
			insertside(num);
			tableWrite();
			updateTotLabel();
			
		}
		
		else if(ob==btnCash)
		{	JOptionPane.showMessageDialog(this, "결제하시겠습니까?");
		    deletecharge();
			resetTableData();
		}
		else if(ob==btnMinus)
		{
			String num= JOptionPane.showInputDialog("취소할 주문번호는?");
			deleteData(num);
			updateTotLabel();
		}


	}

}
