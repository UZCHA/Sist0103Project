package data.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.message.ReusableMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ch.qos.logback.core.model.Model;
import data.dto.MarketDto;
import data.mapper.MarketMapperInter;
import jakarta.servlet.http.HttpSession;

@Controller
public class MarketController {

	@Autowired
	MarketMapperInter mapper;
	
	@GetMapping("/")
	public String start() {
		return "redirect:market/list";
	}
	
	@GetMapping("/market/list")
	public ModelAndView list() {
		ModelAndView mview=new ModelAndView();
		int totalCount=mapper.getTotalCount();
		mview.addObject("totalCount", totalCount);
		
		List<MarketDto> list=mapper.getAllDatas();
		mview.addObject("list", list);
		
		mview.setViewName("market/marketlist");
		return mview;
	}
	
	@GetMapping("/market/addform")
	public String add() {
		
		return "market/addform";
	}
	
	@PostMapping("/market/insert")
	public String insert(@ModelAttribute MarketDto dto,
			HttpSession session,
			@RequestParam MultipartFile photo) {
		
		String realPath=session.getServletContext().getRealPath("/photo");
		System.out.println(realPath);
		
		//.equals("") 대신에 isempty() 도 됨
		if(photo.getOriginalFilename().equals(""))
			dto.setPhotoname(null);
		else {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmm");
			String photoname=sdf.format(new Date())+photo.getOriginalFilename();
			dto.setPhotoname(photoname);
			try {
				photo.transferTo(new File(realPath+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		mapper.inserMarket(dto);
		return "redirect:list";
		
	}
	
	@GetMapping("/market/updateform")
	public ModelAndView uform(@RequestParam String num) {
		
		ModelAndView mview=new ModelAndView();
		MarketDto dto=mapper.getData(num);
		mview.addObject("dto", dto);
		mview.setViewName("market/updateform");
		
		return mview;
	}
	
	@PostMapping("/market/update")
	public String update(@ModelAttribute MarketDto dto,
			HttpSession session,
			@RequestParam MultipartFile photo) {
		
		String realPath=session.getServletContext().getRealPath("/photo");
		System.out.println(realPath);
		
		
		if(photo.getOriginalFilename().equals(""))
			dto.setPhotoname(null);
		else {
			//수정전 이전 사진 지우기
			String pre_photo=mapper.getData(dto.getNum()).getPhotoname();
			File file=new File(realPath+"\\"+pre_photo);
			
			if(file.exists())
				file.delete();
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmm");
			String photoname=sdf.format(new Date())+photo.getOriginalFilename();
			dto.setPhotoname(photoname);
			try {
				photo.transferTo(new File(realPath+"\\"+photoname));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mapper.updateMarket(dto);
		return "redirect:list";
		
	}
	@GetMapping("/market/delete")
	public String delete(@RequestParam String num,HttpSession session) {
		String photo=mapper.getData(num).getPhotoname();
		if(!photo.equals(null)) {
			String path=session.getServletContext().getRealPath("/photo");
			File file=new File(path+"\\"+photo);
			if(file.exists())
				file.delete();
		}
		mapper.deleteMarket(num);
		return "redirect:list";
	}
}
