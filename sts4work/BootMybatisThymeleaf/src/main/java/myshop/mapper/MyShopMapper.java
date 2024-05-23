package myshop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import myshop.dto.MyShopDto;
@Mapper
public interface MyShopMapper {
	
	public int getTotalCount();
	public void insertShop(MyShopDto dto);
	@Select("select * from myshop order by num asc")
	public List<MyShopDto> getAllSangpums();
	public MyShopDto getData(int num);
	@Delete("delete from myshop where num=#{num}")
	public void deleteShop(int num);
}
