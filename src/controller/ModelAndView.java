package controller;

import java.util.HashMap;

public class ModelAndView {
	String path;
	boolean isRedirect;
	HashMap<String, String> map;
	
	public ModelAndView() {}
	public ModelAndView(String path) {
		this.path = path;
	}
	public ModelAndView(String path, boolean isRedirect) {
		super();
		this.path = path;
		this.isRedirect = isRedirect;
	}
	public ModelAndView(String path,HashMap map) {
		this.path = path;
		this.map = map;
	}
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

	@Override
	public String toString() {
		return "ModelAndView [path=" + path + ", isRedirect=" + isRedirect + "]";
	}
	
	
}
