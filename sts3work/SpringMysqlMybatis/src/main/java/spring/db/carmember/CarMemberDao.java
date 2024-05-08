package spring.db.carmember;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarMemberDao implements CarMemberDaoInter {
	@Autowired
	private SqlSession session;

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("TotalCountOfMember");
	}

	@Override
	public void insertMember(CarMemberDto dto) {
		// TODO Auto-generated method stub
		session.insert("insertOfMember", dto);
		
	}

	@Override
	public List<CarMemberDto> getAllMembers() {
		// TODO Auto-generated method stub
		return session.selectList("getAllOfMember");
	}

	@Override
	public CarMemberDto getDataMem(String num) {
		// TODO Auto-generated method stub
		return session.selectOne("selectOfOneMember", num);
	}

	@Override
	public void updateMember(CarMemberDto dto) {
		// TODO Auto-generated method stub
		session.update("updateOfMember", dto);
		
	}

	@Override
	public void deleteMember(String num) {
		// TODO Auto-generated method stub
		session.delete("deleteOfMember", num);
	}
}
