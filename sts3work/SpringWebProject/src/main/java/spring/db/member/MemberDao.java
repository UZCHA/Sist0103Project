package spring.db.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao implements MemberDaoInter {

	@Autowired
	private SqlSession session;
	
	@Override
	public int getIdCheck(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("idCheckOfMember", id);
	}

	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		session.insert("insertOfMember", dto);
		
	}

	@Override
	public List<MemberDto> getAllGaipMembers() {
		// TODO Auto-generated method stub
		return session.selectList("getAllOfGaipMember");
	}

	@Override
	public int getTotalGaipSu() {
		// TODO Auto-generated method stub
		return session.selectOne("totalGaipSu");
	}

}