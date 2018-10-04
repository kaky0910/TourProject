package model.vo;
import java.util.ArrayList;

public class AttractionVO {
	String spotName;
	String address; // �� �ּ�
	String location; //�� ��
	String city; // �� �� ��
	String info;
	ArrayList<String> images;
	
	
	
	public AttractionVO() {}
	
	
	public AttractionVO(String spotName, String address, String location, String city, String info) {
		super();
		this.spotName = spotName;
		this.address = address;
		this.location = location;
		this.city = city;
		this.info = info;
	}


	public String getSpotName() {
		return spotName;
	}
	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}


	public ArrayList<String> getImages() {
		return images;
	}


	public void setImages(ArrayList<String> images) {
		this.images = images;
	}


	@Override
	public String toString() {
		return "AttractionVO [spotName=" + spotName + ", address=" + address + ", location=" + location + ", city="
				+ city + ", info=" + info + ", images=" + images + "]";
	}
	
	
	
}
