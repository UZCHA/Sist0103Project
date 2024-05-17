package board.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {

	@Autowired
	BoardDaoInter daoInter;
	
	//insert
	public void insertBoard(BoardDto dto) {
		daoInter.save(dto);
	}
	
	//list
	public List<BoardDto> getAllDatas(){
		
		//최신글 위로 올라오기
		return daoInter.findAll(Sort.by(Sort.Direction.DESC,"num"));
	}
	
	//datail 상세보기
	public BoardDto getData(Long num) {
		return daoInter.getReferenceById(num);
	}
	
	//update
	public void updateBoard(BoardDto dto) {
		daoInter.save(dto);
	}
	
	//delete
	public void deleteBoard(Long num) {
		daoInter.deleteById(num);
	}
	
}
