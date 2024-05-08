package spring.db.carmember;

import java.util.List;

public interface CarMemberDaoInter {
	
	public int getTotalCount();
	public void insertMember(CarMemberDto dto);
	public List<CarMemberDto> getAllMembers();
	public CarMemberDto getDataMem(String num);
	public void updateMember(CarMemberDto dto);
	public void deleteMember(String num);
}
