package mycar.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import mycar.data.MyCarDto;

@Repository
@AllArgsConstructor
public class MyCarDao {
	
	
	//@AllArgsConstructor가 있으므로 @Autowired는 안써도 됨.
	MyCarDaoInter daoInter;
	
	//db저장
	public void insertMyCar(MyCarDto dto) {
		daoInter.save(dto);
	}
	
	//전체출력
	public List<MyCarDto> getAllCars(){
		//전체데이타 출력
		return daoInter.findAll();
		//가격 비싼거대로 출력
		//return daoInter.findAll(Sort.by(Sort.Direction.DESC,"carprice"));
	}
	public MyCarDto getData(Long num) {
		return daoInter.getReferenceById(num);
	}
	
	public void deleteMyCar(Long num) {
		daoInter.deleteById(num);
	}
	public void updateMyCar(MyCarDto dto) {
		daoInter.save(dto); //num이 포함이므로 수정
	}
	
	public void updateMycarNoPhoto(MyCarDto dto) {
		Long num=dto.getNum();
		String carname=dto.getCarname();
		String carprice=dto.getCarprice();
		String carcolor=dto.getCarcolor();
		
		daoInter.updateMycarNoPhoto(num, carname, carprice, carcolor);
	}
}
