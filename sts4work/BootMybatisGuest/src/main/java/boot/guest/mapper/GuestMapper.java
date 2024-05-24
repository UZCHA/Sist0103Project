package boot.guest.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.guest.dto.GuestDto;

@Mapper
public interface GuestMapper {

	public int getTotalCount();
	public void inertGuest(GuestDto dto);
	public List<GuestDto> getAllDatas();
	public void deleteGuest(int num);
	public int passCheck(String pass, int num);
}
