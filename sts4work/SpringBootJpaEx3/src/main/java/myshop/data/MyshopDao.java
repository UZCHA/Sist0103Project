package myshop.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyshopDao {
	@Autowired
	myshopDaoInter daoInter;
	
	//insert
	public void insertShop(MyshopDto dto) {
		daoInter.save(dto);//id타입 유무에 따라 자동으로 insert,update를 구별
		
	}
	
}
