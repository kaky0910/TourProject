package service;

import java.util.ArrayList;

import model.PagingBean;
import model.vo.CourseVO;
import model.vo.ReviewVO;

public class CListVO {
	private ArrayList<CourseVO> list;
	private PagingBean pb;

	public CListVO(ArrayList<CourseVO> list, PagingBean pb) {
		this.list = list;
		this.pb = pb;
	}
	public CListVO() {}
	public ArrayList<CourseVO> getList() {
		return list;
	}
	public void setList(ArrayList<CourseVO> list) {
		this.list = list;
	}
	public PagingBean getPb() {
		return pb;
	}
	public void setPb(PagingBean pb) {
		this.pb = pb;
	}
	@Override
	public String toString() {
		return "CListVO [list=" + list + ", pb=" + pb + "]";
	}

}
