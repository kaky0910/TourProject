package service;

import java.util.ArrayList;

import model.PagingBean;
import model.vo.ReviewVO;

public class ListVO {
	private ArrayList<ReviewVO> list;
	private PagingBean pb;

	public ListVO(ArrayList<ReviewVO> list, PagingBean pb) {
		this.list = list;
		this.pb = pb;
	}
	public ListVO() {}
	public ArrayList<ReviewVO> getList() {
		return list;
	}
	public void setList(ArrayList<ReviewVO> list) {
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
		return "ListVO [list=" + list + ", pb=" + pb + "]";
	}

}
