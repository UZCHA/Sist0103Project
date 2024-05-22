package boot.data;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookMapperInter {

	public int getBookTotalCount();
	public void insertBook(BookDto dto);
	public List<BookDto> getAllBookDatas();
}
