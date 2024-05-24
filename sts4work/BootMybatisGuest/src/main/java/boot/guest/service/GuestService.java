package boot.guest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.guest.dto.GuestDto;
import boot.guest.mapper.GuestMapper;

@Service
public class GuestService {

	@Autowired
	GuestMapper mapper;
	
	public int getTotalCount() {
	
		return mapper.getTotalCount();
	}
	
	public void inertGuest(GuestDto dto) {
		mapper.inertGuest(dto);
	}
	public List<GuestDto> getAllDatas(){
		return mapper.getAllDatas();
	}
	public void deleteGuest(int num) {
		mapper.deleteGuest(num);
	}
	public int passCheck(String pass,int num) {
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("pass", pass);
		map.put("num", num);
		
		int n=mapper.passCheck(pass, num);
		
		return n==1?1:0;
	}
}
