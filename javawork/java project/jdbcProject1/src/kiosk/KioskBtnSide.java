package kiosk;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

import oracleDB.DbConnect;

public class KioskBtnSide extends JFrame implements ActionListener{
	Container cp;
	JButton btn1, btn2;
	JPanel jpl1,jpl2,jpl3;
	DefaultTableModel model;
	JTable table;
	DbConnect db=new DbConnect();
	
	
	public KioskBtnSide(String title) {
		super(title);
		cp=this.getContentPane();
		this.setBounds(700,100,500,500);
		cp.setBackground(new Color(255,187,0));
		
		initDesign();
		//this.setVisible(true);
		
	}
	public void tableWrite() {
		model.setRowCount(0);
		Connection conn=db.getOracle();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select *from kiosk_sidemenu";
		
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
	
	
	public void initDesign() {
		
		jpl1=new JPanel();
		
		this.add(jpl1,BorderLayout.SOUTH);
		btn1=new JButton("추가");
		btn1.addActionListener(this);
		jpl1.add(btn1);
		
		btn2=new JButton("취소");
		btn2.addActionListener(this);
		jpl1.add(btn2);
		
		String[]title= {"번호","상품명","가격","수량","총금액"};
		model=new DefaultTableModel(title,0);
		table=new JTable(model);
		
		this.add("Center",new JScrollPane(table));
		
		tableWrite();
		
		
		
		
	}
	
	
	
	
	
	/*public static void main(String[] args) {
		// TODO Auto-generated method stub
		KioskBtnSide side=new KioskBtnSide("음료 메뉴");
	}*/
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		
		 if(ob==btn2)
		{
			dispose();
		}
	}

}
