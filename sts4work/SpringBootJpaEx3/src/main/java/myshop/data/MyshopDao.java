package myshop.data;

import java.util.List;

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
	
	//전체출력
	public List<MyshopDto> getAllSangpums(){
		return daoInter.findAll();
	}
	
	//num에 대한 dto반환
	public MyshopDto getData(Long num) {
		
		return daoInter.getReferenceById(num);
	}
	
	//update
	public void updateShop(MyshopDto dto) {
		daoInter.save(dto); //num이 포함되어있으므로 수정이 됨
	}
	
	//delete
	public void deleteShop(Long num) {
		daoInter.deleteById(num);
	}
}
