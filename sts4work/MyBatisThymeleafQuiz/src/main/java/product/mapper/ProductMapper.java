package product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import product.dto.ProductDto;

@Mapper
public interface ProductMapper {

	public int getTotalProduct();
	public void insertProduct(ProductDto dto);
	public List<ProductDto> getAllProduct();
	public ProductDto getData(int pro_num);
}
