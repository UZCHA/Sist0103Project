package product.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import product.dto.ProductDto;
import product.mapper.ProductMapper;

@Service
@AllArgsConstructor
public class ProductService {

	private final ProductMapper proMapper;
	
	public int getTotalProduct() {
		return proMapper.getTotalProduct();
	}
	public void insertProduct(ProductDto dto) {
		proMapper.insertProduct(dto);
	}
	public List<ProductDto> getAllProduct(){
		return proMapper.getAllProduct();
	}
	
	public ProductDto getData(int pro_num) {
		return proMapper.getData(pro_num);
	}
}
