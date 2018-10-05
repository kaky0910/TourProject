package controller;

public class HandlerMapping {
	private static HandlerMapping mapping = new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getInstance() {
		return mapping;
	}
	
	public Controller createController(String command) {
		Controller controller = null;
		
		switch(command) {

		case "locationpage.do":	//command
			return new GoLocationPageController();
		case "myreviews.do":	
			return new MyReviewController();
		case "scrap.do":	
			return new ScrapController();
		case "delete.do":	
			return new DeleteController();
		case "deleteScrap.do":	
			return new DeleteScrapController();
		case "getBestReviewBytag.do":
			return new GetBestReviewBytagController();
		case "login.do":	//command
			return new LoginController();
		case "register.do":
			return new RegisterController();
		case "idcheck.do":
			return new IdcheckController();
		case "registerupdate.do":
			return new RegisterUpdateController();
		case "logout.do":
			return new LogoutController();
		case "mainPage.do":
			return new MainPageController();
		case "getAttraction.do":	//command
			return new GetAttractionController();
		case "checkReview.do":	//command
		return new CheckReviewController();
		
		}
		return null;
	}
}
