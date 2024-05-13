package spring.mvc.data;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao implements BoardDaoInter {
	@Autowired
	private SqlSession session;
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("TotalCountBoard");
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return session.selectOne("MaxNumOfBoard");
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		session.update("UpdateStepOfBoard", map);		
	}

	@Override
	public void insertBoard(BoardDto dto) {
		// TODO Auto-generated method stub
		int num=dto.getNum(); //0이면 새 글, 1보다 클때는 답글
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(num==0) {
			regroup= getMaxNum()+1;
			restep=0;
			relevel=0;
		}else {//답글
			//같은 그룹중 전달받은 restep보다 큰 글들은 +1
			this.updateRestep(regroup, restep);
			//전달받은 step이랑 level은 +1
			restep++;
			relevel++;
		}
		//바뀐값들을 다시 dto에 담기
		dto.setRestep(restep);
		dto.setRegroup(regroup);
		dto.setRelevel(relevel);
		
		session.insert("InsertOfBoard", dto);
	}

	@Override
	public List<BoardDto> getList(int start, int perpage) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		return session.selectList("SelectPagingListOfBoard", map);
	}

	@Override
	public void updateReadCount(int num) {
		// TODO Auto-generated method stub
		session.update("UpdateReadCountOfBoard", num);
		
	}

	@Override
	public BoardDto getOneData(int num) {
		// TODO Auto-generated method stub
		return session.selectOne("getDataOfBoard", num);
	}

}
