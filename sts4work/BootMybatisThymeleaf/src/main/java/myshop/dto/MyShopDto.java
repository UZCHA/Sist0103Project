package myshop.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Alias("MyShopDto")
public class MyShopDto {

	private int num;
	private String sangpum;
	private String photo;
	private String color;
	private int price;
	private Timestamp writeday;
}
