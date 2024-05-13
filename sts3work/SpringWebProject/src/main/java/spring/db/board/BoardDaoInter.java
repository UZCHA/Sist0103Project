package spring.db.board;

import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;

public interface BoardDaoInter {
	
	public int getTotalCount();
	public int getMaxNum();
	public void insertBoard(BoardDto dto);
	public List<BoardDto> getAlllist();
	public BoardDto getData(int num);
	public void updateReadcount(int num);
	public List<BoardDto> getList(int start, int perpage);
	public void updateBoard(BoardDto dto);
	public void deleteBoard(int num);
	public List<BoardDto> getPhotoLists();
}
