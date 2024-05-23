package myshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import myshop.dto.MyShopDto;
import myshop.mapper.MyShopMapper;

@Service
@AllArgsConstructor
public class MyShopService {

	private final MyShopMapper shopMapper;
	
	public int getTotalCount() {
		return shopMapper.getTotalCount();
	}
	public void insertShop(MyShopDto dto) {
		shopMapper.insertShop(dto);
	}
	public List<MyShopDto> getAllSangpums(){
		
		return shopMapper.getAllSangpums();
	}
	public MyShopDto getData(int num) {
		return shopMapper.getData(num);
	}
	public void deleteshop(int num) {
		shopMapper.deleteShop(num);
	}
}
