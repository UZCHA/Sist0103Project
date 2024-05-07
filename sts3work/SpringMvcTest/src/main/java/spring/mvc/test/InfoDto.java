package spring.mvc.test;

import java.util.ArrayList;

public class InfoDto {
	
	//infoform에 입력한 name과 동일하게 해야한다. 
	private String name;
	private String color;
	private ArrayList<String> hobby;
	private String lang;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public ArrayList<String> getHobby() {
		return hobby;
	}
	public void setHobby(ArrayList<String> hobby) {
		this.hobby = hobby;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	
}
