package model.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.sql.DataSource;

import config.OracleInfo;
import model.DataSourceManager;
import model.vo.AttractionVO;
import model.vo.CommentVO;
import model.vo.CourseVO;
import model.vo.FestivalVO;
import model.vo.MemberVO;
import model.vo.ReviewVO;
import query.course.CourseStringQuery;
import query.review.ReviewStringQuery;
import query.user.UserStringQuery;

public class TourDao {
	private DataSource ds;
	private static TourDao reviewDao = new TourDao();
	static {
		try {
			Class.forName(OracleInfo.DRIVER_NAME);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private TourDao() {
		try {
			ds=DataSourceManager.getInstance().getDataSource();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static TourDao getInstance() {
		return reviewDao;
	}
	
	public int writeReview(ReviewVO rvo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int num = 0;
		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.INSERT_REVIEW);

			ps.setString(1, rvo.getLocation());
			ps.setString(2, rvo.getCity());
			ps.setString(3, rvo.getTitle());
			ps.setString(4, rvo.getContent());
			ps.setString(5, rvo.getId());

			int row = ps.executeUpdate();
			ps.close();
			System.out.println(row + " row insert posting ok....");
			System.out.println("dao CURRENT_NO...before...." + rvo.getReviewNum());// x
			// 쿼리문이 하나더 들어가야 한다...시퀀스가 PK로 지정된상황에서 INSERT문이 수행될때는...
			// 현재 시퀀스를 하나 받아와서 그걸 VO에 꽂아버려야 한다.
			ps = conn.prepareStatement(ReviewStringQuery.CURRENT_NO);
			rs = ps.executeQuery();
			if (rs.next())
				rvo.setReviewNum(rs.getInt(1));
			System.out.println("dao CURRENT_NO...after...." + rvo.getReviewNum());// o
			num = rvo.getReviewNum();
		} finally {
			closeAll(rs, ps, conn);
		}
		return num;
	}

		//글 작성시 tag추출하여 tag list return
	public ArrayList<String> getTagsByContent(String content){
	      ArrayList<String> tlist = new ArrayList<String>();
	      String content1 = content.replace("<p>", " ");
	      String content2 = content1.replace("</p>", "");
	      String content3 = content2.replace("&nbsp;", " ");
	      String[] arr = content3.split(" ");
	      for(int i=0;i<arr.length;i++) {
	         if(arr[i].startsWith("#")) {
	            tlist.add(arr[i].substring(1));
	         }
	      }
	      return tlist;
	}
	
	//시,도에 있는 시,군,구를 받아옴
	public ArrayList<String> getCities(String location) throws SQLException{

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<String> cities = new ArrayList<String>();
		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.GETCITIES);
			ps.setString(1, location);
			rs = ps.executeQuery();
			while (rs.next()) {
				cities.add(rs.getString("city"));
			}
		} finally {
			closeAll(rs, ps, conn);
		}
		return cities;
	}

		//index review list (최근 리뷰 리턴   ::  10개/1page)
	public ArrayList<ReviewVO> getRecentReviews(int pn) throws SQLException{		//
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<ReviewVO> rlist = new ArrayList<ReviewVO>();
		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.GET_RECENT_REVIEWS);
			ps.setInt(1, pn);
			rs = ps.executeQuery();
			while (rs.next()) {
				rlist.add(new ReviewVO(rs.getInt("review_num"), rs.getString("location"), rs.getString("city"),
						rs.getString("title"), rs.getString("id")));
			}
		} finally {
			closeAll(rs, ps, conn);
		}
		return rlist;
	}

		// review에 like를 증가시킴
	public void addLike(int reviewNum) throws SQLException {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// + review_num
		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.LIKE_ADD);
			ps.setInt(1, reviewNum);
			rs = ps.executeQuery();
		
		} finally {
			closeAll(rs, ps, conn);
		}
	}
		
		// review에 like를 감소시킴
	public void downLike(int reviewNum) throws SQLException {
	
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// + review_num
		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.LIKE_REMOVE);
			ps.setInt(1, reviewNum);
			rs = ps.executeQuery();
		
		} finally {
			closeAll(rs, ps, conn);
		}
	}//

	
		//user가 like를 누를 때 db에 등록
	public void insertLike(String id,int reviewNum) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn= getConnect();
			ps =conn.prepareStatement(ReviewStringQuery.INSERT_CHECK);
			ps.setString(1, id);
			ps.setInt(2, reviewNum);
			ps.executeUpdate();
			
			int row = ps.executeUpdate();
			System.out.println(row + " row insertCheck ok..");
		}finally {
			closeAll(ps, conn);
		}
		
		
	}
		//user가 like를 해제할 때 db에서 삭제
	public void deleteLike(String id,int reviewNum) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn= getConnect();
			ps =conn.prepareStatement(ReviewStringQuery.DELETE_CHECK);
			ps.setString(1, id);
			ps.setInt(2, reviewNum);
			ps.executeUpdate();
			
			int row = ps.executeUpdate();
			System.out.println(row + " row deleteCheck ok..");
		}finally {
			closeAll(ps, conn);
		}
		
	}
	
		//user가 현재 review에 like를 눌렀는지 안눌렀는지 확인 (like button)
	public boolean checkLike(String id,int reviewNum) throws SQLException{
		boolean flag = false;
		Connection conn=null;
		PreparedStatement ps = null;
		ResultSet rs= null;
		try {
		conn=getConnect();
		ps=conn.prepareStatement(ReviewStringQuery.CHECK_SELECT);
		ps.setString(1, id);
		ps.setInt(2, reviewNum);
		rs= ps.executeQuery();
		if(rs.next())
			flag=true;
		}finally {
			closeAll(rs, ps, conn);
		}
		System.out.println(flag+"확인");
		return flag;
	}

		//user가 스크랩했을때 db에 추가
	public void addScrap(String id, int review_num) throws Exception {					//scrap
		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.INSERT_SCRAP);
			ps.setString(1, id);
			ps.setInt(2, review_num);
			ps.executeUpdate();

		} finally {
			closeAll(ps, conn);
		}
	} 
		
		//user가 스크랩 해제했을때 db에서 삭제
	public void delScrap(String id, int review_num) throws Exception {					//scrap
		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.DELETE_SCRAP);
			ps.setString(1, id);
			ps.setInt(2, review_num);
			ps.executeUpdate();

		} finally {
			closeAll(ps, conn);
		}
	} 
		
		//user가 현재 review를 스크랩했는지 확인 (scrap button)
	public boolean checkScrap(String id,int reviewNum) throws SQLException{
		boolean flag = false;
		Connection conn=null;
		PreparedStatement ps = null;
		ResultSet rs= null;
		try {
		conn=getConnect();
		ps=conn.prepareStatement(ReviewStringQuery.CHECK_SCRAP);
		ps.setString(1, id);
		ps.setInt(2, reviewNum);
		rs= ps.executeQuery();
		if(rs.next())
			flag=true;
		}finally {
			closeAll(rs, ps, conn);
		}
		System.out.println(flag+"확인");
		return flag;
	}
	
		//댓글다는 로직
	public void addComment(int reviewNum, String id, String content) throws SQLException{
		Connection conn= null;
		PreparedStatement ps =null;
		try {
			conn=getConnect();
			ps=conn.prepareStatement(ReviewStringQuery.ADD_COMMENT);
			ps.setInt(1, reviewNum);
			ps.setString(2, id);
			ps.setString(3, content);
			int row=ps.executeUpdate();
			System.out.println(row + " row addComment ok..");
		}finally {
			closeAll(ps, conn);
		}
	}
	
		//댓글 삭제
	public void delComment(int reviewNum, String id, String content) throws SQLException{
		Connection conn= null;
		PreparedStatement ps =null;
		try {
			conn=getConnect();
			ps=conn.prepareStatement(ReviewStringQuery.DEL_COMMENT);
			ps.setInt(1, reviewNum);
			ps.setString(2, id);
			ps.setString(3, content);
			int row=ps.executeUpdate();
			System.out.println(row + " row delComment ok..");
		}finally {
			closeAll(ps, conn);
		}
	}
	
		//review를 불러올 때 댓글 불러오는 로직
	public ArrayList<CommentVO> getComments(int review_num, Connection conn) throws SQLException { // get review
		// comments
		ArrayList<CommentVO> clist = new ArrayList<CommentVO>();
		PreparedStatement ps = conn.prepareStatement(ReviewStringQuery.GET_REVIEW_COMMENTS);
		ps.setInt(1, review_num);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
		clist.add(new CommentVO(rs.getString("id"), rs.getString("content")));
		}
		if (rs != null)
		rs.close();
		if (ps != null)
		ps.close();
		return clist;
	}

		//v1 페이지에서 태그, 지역별로 best review를 가져옴
	public ArrayList<ReviewVO> getBestReviewByTag(String location, String tag, int pageNO) throws SQLException { 
																													
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();

		ReviewVO vo = null;
		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.GET_BESTREVIEW_BY_TAG_LOCA);//

			ps.setString(1, tag);
			ps.setString(2, location);
			ps.setInt(3, pageNO);

			rs = ps.executeQuery();
			while (rs.next()) {
				vo = new ReviewVO();
				vo.setReviewNum(rs.getInt("review_num"));
				vo.setTitle(rs.getString("title"));
				vo.setCity(rs.getString("city"));
				list.add(vo);
			}
			for (int i = 0; i < list.size(); i++) {
				ArrayList<String> tags = getTags(list.get(i).getReviewNum());
				list.get(i).setTags(tags);
				ArrayList<String> img = getImages(list.get(i).getReviewNum());
				list.get(i).setImages(img);
				if (img.size() != 0)
					list.get(i).setMainImage(img.get(0));
			} // for
		} finally {
			closeAll(rs, ps, conn);
		}
		return list;
	}// getBestReview

		//
	public ArrayList<ReviewVO> getBestReviewByTagCity(String location, String city, String tag, int pageNO) throws SQLException { // v1
		// review
		// list
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();

		ReviewVO vo = null;
		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.GET_BESTREVIEW_BY_TAG_CITY);//

			ps.setString(1, tag);
			ps.setString(2, city);
			ps.setString(3, location);
			ps.setInt(4, pageNO);

			rs = ps.executeQuery();
			while (rs.next()) {
				vo = new ReviewVO();
				vo.setReviewNum(rs.getInt("review_num"));
				vo.setTitle(rs.getString("title"));
				list.add(vo);
			}
			for (int i = 0; i < list.size(); i++) {
				ArrayList<String> tags = getTags(list.get(i).getReviewNum());
				list.get(i).setTags(tags);
				ArrayList<String> img = getImages(list.get(i).getReviewNum());
				list.get(i).setImages(img);
				if(img.size()!=0)
					list.get(i).setMainImage(img.get(0));
			} // for
		} finally {
			closeAll(rs, ps, conn);
		}
		return list;
	}// getBestReview

		//v1 로딩될때 조건 만족하는 festival list return
	public ArrayList<FestivalVO> getFestivalInfo(String location) throws SQLException { /// v1 festival list
		ArrayList<FestivalVO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.GET_FESTIVAL_INFO);
			ps.setString(1, location+"%");
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new FestivalVO(rs.getString("festival_Name"), rs.getString("festival_Location"),
						rs.getString("location"), rs.getString("city"), rs.getString("start_Date"),
						rs.getString("END_DATE"), rs.getString("agency"), rs.getString("img")));
			}
		} finally {
			closeAll(rs, ps, conn);
		}
		return list;
	}// getFestivalInfo 

		//v2(attraction.jsp)에서 해당 지역의 관광지 정보 return
	public ArrayList<AttractionVO> getAttraction(String city,String location) throws SQLException { // v2 tourspot list

		ArrayList<AttractionVO> list = new ArrayList<>();
		ArrayList<AttractionVO> aList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.GET_ATTRACTION);
			ps.setString(1, city);
			ps.setString(2, city.substring(0,city.length()-1));
			ps.setString(3, location+"%");
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new AttractionVO(rs.getString("spot_name"), rs.getString("address"), rs.getString("location"),
						rs.getString("city"), rs.getString("description")));
			}
			ps.close();
			for (AttractionVO vo : list) {
				ps = conn.prepareStatement("SELECT spot_image FROM spot_image WHERE spot_name=?");
				ps.setString(1, vo.getSpotName());
				rs = ps.executeQuery();
				if (rs.next()) {
					vo.setMainImage(rs.getString("spot_image"));
					aList.add(vo);
				}
			}

	      } finally {
	         closeAll(rs, ps, conn);
	      }

		return aList;
	}

/*		
	public void scrap(String id, int review_num) throws Exception { // scrap
		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.SCRAP);					addScrap
			ps.setString(1, id);
			ps.setInt(2, review_num);
			ps.executeUpdate();

		} finally {
			closeAll(ps, conn);
		}
	} // scrap 泥좎쭊�벐
*/
	
		//review 상세정보 return
	public ReviewVO checkReview(int reviewNum) throws SQLException { // review detail info

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ReviewVO rvo = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.CHECK_REVIEW);
			ps.setInt(1, reviewNum);
			rs = ps.executeQuery();
			if (rs.next()) {
				rvo = new ReviewVO(rs.getInt("review_num"), rs.getString("title"), rs.getString("id"),
						rs.getString("location"), rs.getString("city"), rs.getString("content"),
						rs.getString("date_writing"), rs.getInt("likes"));
			}
			rvo.setImages(getImages(rvo.getReviewNum()));			//image list
			rvo.setTags(getTags(rvo.getReviewNum()));
			rvo.setComments(getComments(rvo.getReviewNum(), conn));		//comment list
		} finally {
			closeAll(rs, ps, conn);
		}
		return rvo;
	} // checkReview

		//user가 scrap한 게시물 수 return (paging) 
	public int totalScrapNumber(String id) throws SQLException {

		int count = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.TOTAL_SCRAP_COUNT);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
		} finally {
			closeAll(rs, ps, conn);
		}
		return count;
	}

		//
	public int totalReviewNumber() throws SQLException {

		int count = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.TOTAL_REVIEW_COUNT);
			rs = ps.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
		} finally {
			closeAll(rs, ps, conn);
		}
		return count;
	}
		
		//내가 쓴 review 갯수 return
	public int totalMyReviewNumber(String id) throws SQLException {
		int count = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.TOTAL_MY_REVIEW_COUNT);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
		} finally {
			closeAll(rs, ps, conn);
		}
		return count;
	}

		//related review count
	public int totalRelatedReviewNumber(String tag) throws SQLException {

		int count = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.TOTAL_RELATED_REVIEW_COUNT);
			ps.setString(1, tag);
			rs = ps.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
		} finally {
			closeAll(rs, ps, conn);
		}
		return count;
	}

	/*
	 * public ArrayList<ReviewVO> searchByTag(String tag) throws SQLException {
	 * //�샇異쒗븯�뒗怨녹뿉�꽌 �뼱�뼡寃� �븘�슂�븷源� Connection conn = null; PreparedStatement ps =
	 * null; ResultSet rs = null; ArrayList<ReviewVO> list = new
	 * ArrayList<ReviewVO>();
	 * 
	 * try { conn=getConnect(); ps=
	 * conn.prepareStatement(ReviewStringQuery.SEARCH_BY_TAG); ps.setString(1, tag);
	 * rs= ps.executeQuery(); while(rs.next()) { list.add(new
	 * ReviewVO(rs.getInt("review_num"), rs.getString("title"), rs.getString("id"),
	 * rs.getString("location"), rs.getString("city"), rs.getString("content"),
	 * rs.getString("date_writing"), rs.getInt("likes")));
	 * 
	 * } }finally { closeAll(rs, ps, conn); } return list;
	 * 
	 * }
	 */
		//user scrap list return
	public ArrayList<ReviewVO> getScrapList(String id, int pageNo) throws SQLException { // scrap list

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.GET_SCRAP_LIST);
			ps.setString(1, id);
			ps.setInt(2, pageNo);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				list.add(new ReviewVO(rs.getInt("review_num"), rs.getString("title"), rs.getString("id"),
						rs.getString("location"), rs.getString("city"), rs.getString("content"),
						rs.getString("date_writing"), rs.getInt("likes")));
			} // while
			ps.close();
			for (ReviewVO vo : list) {
				if (vo != null) {
					ps = conn.prepareStatement(ReviewStringQuery.REVIEW_IMG);
					ps.setInt(1, vo.getReviewNum());
					rs = ps.executeQuery();
					if (rs.next()) {
						vo.setMainImage(rs.getString("review_image"));
					}
				}
			} // for
		} finally {
			closeAll(ps, conn);
		}

		return list;
	}

		//내가 쓴 review list return
	public ArrayList<ReviewVO> getMyReview(String id, int pageNo) throws SQLException { // my review list

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.GET_MY_REVIEW);
			ps.setString(1, id);
			ps.setInt(2, pageNo);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				list.add(new ReviewVO(rs.getInt("review_num"), rs.getString("title"), rs.getString("id"),
						rs.getString("date_writing")));
			} // while
			ps.close();
			for (ReviewVO vo : list) {
				if (vo != null) {

					ps = conn.prepareStatement(ReviewStringQuery.REVIEW_IMG);
					ps.setInt(1, vo.getReviewNum());
					rs = ps.executeQuery();
					if (rs.next()) {
						vo.setMainImage(rs.getString("review_image"));
					}
				}
			} // for
		} finally {
			closeAll(rs, ps, conn);
		}
		return list;
	}

		//delete review 
	public void deleteReview(int reviewNum) throws SQLException { // delete review

		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.DELETE_REVIEW);
			ps.setInt(1, reviewNum);
			ps.executeUpdate();

			int row = ps.executeUpdate();
			System.out.println(row + " row delete posting ok..");

		} finally {
			closeAll(ps, conn);
		}
	}

		// review update 
	public void updateReview(ReviewVO rvo) throws SQLException { // update

		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.UPDATE_REVIEW);
			ps.setString(1, rvo.getLocation());
			ps.setString(2, rvo.getCity());
			ps.setString(3, rvo.getTitle());
			ps.setString(4, rvo.getContent());
			ps.setInt(5, rvo.getReviewNum());
			int row = ps.executeUpdate();
			System.out.println(row + " row update posting ok..");
			ps.close();

			ps = conn.prepareStatement(ReviewStringQuery.DELETE_TAG);
			ps.setInt(1, rvo.getReviewNum());
			ps.executeUpdate();

		} finally {
			closeAll(ps, conn);
		}
	}

		//getDAta:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public ArrayList<AttractionVO> getData(String tag) throws SQLException {
		ArrayList<AttractionVO> list = new ArrayList<AttractionVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.GET_DATA);
			ps.setString(1, tag);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new AttractionVO(rs.getString("spot_name"), rs.getString("address"), rs.getString("location"),
						rs.getString("city"), rs.getString("img"),rs.getString("lon"),rs.getString("lat"),rs.getString("description")));
				System.out.println(rs.getString("lon")+" ::::::::::::: "+rs.getString("lat"));
			}

		} finally {
			closeAll(rs, ps, conn);
		}
		return list;
	}
	
		//related review list return 
	public ArrayList<ReviewVO> relatedReviews(String tag, int pageNo) throws SQLException {
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.RELATED_REVIEWS);
			ps.setString(1, tag);
			ps.setInt(2, pageNo);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				list.add(new ReviewVO(rs.getInt("review_num"), rs.getString("title"), rs.getString("date_writing")));
			}
			ps.close();
			for (ReviewVO vo : list) {
				if (vo != null) {

					ps = conn.prepareStatement(ReviewStringQuery.REVIEW_IMG);
					ps.setInt(1, vo.getReviewNum());
					rs = ps.executeQuery();
					if (rs.next()) {
						vo.setMainImage(rs.getString("review_image"));
					}
				}
			} // for

		} finally {
			closeAll(rs, ps, conn);
		}

		return list;
	}

		//tag 가 location, city 인지 확인
	public String checkTag(String tag) throws SQLException {
		String flag = " ";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.CHECK_TAG_BY_LOCATION);
			ps.setString(1, tag+"%");
			rs = ps.executeQuery();
			if (rs.next())
				flag = "location";
			else {
				ps.close();
				ps = conn.prepareStatement(ReviewStringQuery.CHECK_TAG_BY_CITY);
				ps.setString(1, tag+"%");
				rs = ps.executeQuery();

				if (rs.next())
					flag = "city";

			}

		} finally {
			closeAll(rs, ps, conn);
		}
		return flag;
	}

		//tag가 tag table에 있는지 확인
	public boolean tagExist(String tag) throws SQLException {
		boolean flag = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.TAG_EXIST);
			ps.setString(1, tag);
			rs = ps.executeQuery();

			if (rs.next())
				flag = true;

		} finally {
			closeAll(rs, ps, conn);
		}

		return flag;
	}

		//tag가 관광지인지 확인
	public ArrayList<AttractionVO> checkSpot(String tag) throws SQLException {
		ArrayList<AttractionVO> list = new ArrayList<AttractionVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.CHECK_SPOT);
			ps.setString(1, "%"+tag+"%");
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new AttractionVO(rs.getString("spot_name"), rs.getString("address"), rs.getString("location"),
						rs.getString("city"), rs.getString("spot_image"),rs.getString("lon"),rs.getString("lat"),rs.getString("description")));
			}
		} finally {
			closeAll(rs, ps, conn);
		}
		return list;
	}
	
		//city로 location검색 :::::::::::::::: ex) 중구 (인천,대구......)
	public ArrayList<String> checkLocationByCity(String city) throws SQLException{
		ArrayList<String> list = new ArrayList<String>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.CHECK_TAG_BY_CITY);
			ps.setString(1, city+"%");
			rs = ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("location"));
				list.add(rs.getString("city"));
			}
		}finally {
			closeAll(rs, ps, conn);
		}
		return list;
	}
	
		//tag를 가지고있는 review list return
	public ArrayList<ReviewVO> getReviewBySearch(String tag, int pageNo) throws SQLException {
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.GET_REVIEW_BY_SEARCH);
			ps.setString(1, tag);
			ps.setInt(2, pageNo);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new ReviewVO(rs.getInt("review_num"), rs.getString("title"), rs.getString("date_writing")));
			}
			ps.close();

			for (ReviewVO vo : list) {
				if (vo != null) {

					ps = conn.prepareStatement(ReviewStringQuery.REVIEW_IMG);
					ps.setInt(1, vo.getReviewNum());
					rs = ps.executeQuery();
					if (rs.next()) {
						vo.setMainImage(rs.getString("review_image"));
					}
				}
			} // for

		} finally {
			closeAll(rs, ps, conn);
		}

		return list;
	}
	
		//get review images
	public ArrayList<String> getImages(int reviewNum) throws SQLException{			
		Connection conn = getConnect();
		ArrayList<String> ilist = new ArrayList<String>();
		PreparedStatement ps = conn.prepareStatement(ReviewStringQuery.GET_REVIEW_IMAGES);
		ps.setInt(1, reviewNum);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ilist.add(rs.getString("review_image"));
		}
		closeAll(rs, ps, conn);
		return ilist;
	}
	
		//get review images
	public ArrayList<String> getTags(int reviewNum) throws SQLException{			
		Connection conn = getConnect();

		ArrayList<String> ilist = new ArrayList<String>();
		PreparedStatement ps = conn.prepareStatement(ReviewStringQuery.GET_REVIEW_TAGS);
		ps.setInt(1, reviewNum);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ilist.add(rs.getString("word"));
		}
		closeAll(rs, ps, conn);

		return ilist;
	}
	
		//review 작성시 image insert
	public void writeReviewImage(int reviewNum, ArrayList<String> imgList) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.INSERT_REVIEWIMAGE);
			for (String img : imgList) {
				ps.setInt(1, reviewNum);
				ps.setString(2, img);
				int row = ps.executeUpdate();
				System.out.println(row + " row insert review_image posting ok....");
			}
		} finally {
			closeAll(ps, conn);
		}
	}

		//review 작성 시 tag insert
	public void writeTag(int reviewNum, ArrayList<String> tagList) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.INSERT_TAG);
			for (String tag : tagList) {
				ps.setInt(1, reviewNum);
				ps.setString(2, tag);
				int row = ps.executeUpdate();
				System.out.println(row + " row insert tag posting ok....");
			}
		} finally {
			closeAll(ps, conn);
		}
	}

	public Connection getConnect() throws SQLException {
		return ds.getConnection();
	}// getConnect

	private void closeAll(PreparedStatement ps, Connection conn) throws SQLException {
		if (ps != null)
			ps.close();
		if (conn != null)
			conn.close();
	}// closeAll

	private void closeAll(ResultSet rs, PreparedStatement ps, Connection conn) throws SQLException {
		if (rs != null)
			rs.close();
		closeAll(ps, conn);
	}// closeAll

		//회원가입
	public void register(MemberVO vo) throws SQLException { // member regist
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = getConnect();
			ps = conn.prepareStatement(UserStringQuery.REGISTER_USER);
			ps.setString(1, vo.getUserName());
			ps.setInt(2, vo.getSsn());
			ps.setString(3, vo.getId());
			ps.setString(4, vo.getPassword());
			ps.setString(5, vo.getTel());
			ps.setString(6, vo.getMail());
			ps.executeUpdate();
		} finally {
			closeAll(ps, conn);
		}
	}

		//회원정보 수정
	public void updateInfo(MemberVO vo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(UserStringQuery.UPDATE_USER);
			ps.setString(1, vo.getPassword());
			ps.setString(2, vo.getMail());
			ps.setString(3, vo.getTel());
			ps.setString(4, vo.getId());
			ps.executeUpdate();
		} finally {
			closeAll(ps, conn);
		}
	}

		//id 중복체크
	public boolean idCheck(String id) throws SQLException {
		boolean result = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = getConnect();
			ps = conn.prepareStatement(UserStringQuery.IDCHECK_USER);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) > 0)
					result = true;
			}
		} finally {
			closeAll(rs, ps, conn);
		}
		return result;
	}

		//login
	public MemberVO login(String id, String password) throws SQLException {
		MemberVO vo = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(UserStringQuery.LOGIN_USER);
			ps.setString(1, id);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next()) {
				vo = new MemberVO(rs.getString("member_name"), rs.getInt("ssn"),rs.getString("id"),rs.getString("password"),rs.getString("tel"),rs.getString("mail"));

			}

		} finally {
			closeAll(ps, conn);
		}
		return vo;
	}
	
		/*// findIdPass :::::::::::::::::::::
	public MemberVO findIdPass(String userName, int ssn, String tel) throws SQLException{
		MemberVO vo = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnect();
			ps = conn.prepareStatement(UserStringQuery.FINDIDPASS_USER);
			ps.setString(1, userName);
			ps.setInt(2, ssn);
			ps.setString(3, tel);
			rs = ps.executeQuery();
				if(rs.next()) {
				vo = new MemberVO(rs.getString(1),rs.getString(2));
				}
		}finally {
			closeAll(ps,conn);
		}
		return vo;
	}*/
	
	public void deleteImage(int reviewNum, String img) throws SQLException {
		System.out.println("img url : " + img);
		File file = new File(
				"C:\\yjk\\webPro2\\eclipse\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps"
						+ img);
		System.out.println(file.delete());

		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(ReviewStringQuery.DELETE_REVIEW_IMG);
			ps.setInt(1, reviewNum);
			ps.setString(2, img);
			ps.executeUpdate();
			
		} finally {
			closeAll(ps, conn);
		}	
	}
	
		//delete image
	public void deleteImage(int reviewNum)throws SQLException {
	      Connection conn = null;
	      PreparedStatement ps = null;
	      try {
	         conn = getConnect();
	         ps = conn.prepareStatement(ReviewStringQuery.DELETE_REVIEW_IMG1);
	         ps.setInt(1, reviewNum);
	         ps.executeUpdate();
	      } finally {
	         closeAll(ps, conn);
	      }   
	   }
	
		//관련 review return
	public ArrayList<ReviewVO> getRelateReview(ArrayList<String> list) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<ReviewVO> rlist = new ArrayList<ReviewVO>();
		try {
			conn = getConnect();
			ps = conn.prepareStatement(getRelateQuery(list));
			rs = ps.executeQuery();
			while(rs.next()) {
				rlist.add(new ReviewVO(rs.getInt("review_num"), rs.getString("location"), rs.getString("city"),rs.getString("title"), rs.getString("id")));
			}
			for (int i = 0; i < rlist.size(); i++) {
				ArrayList<String> tags = getTags(rlist.get(i).getReviewNum());
				rlist.get(i).setTags(tags);
				ArrayList<String> img = getImages(rlist.get(i).getReviewNum());
				rlist.get(i).setImages(img);
				if (img.size() != 0)
					rlist.get(i).setMainImage(img.get(0));
			} // for
			
		} finally {
			closeAll(rs, ps, conn);
		}
		return rlist;
	}
	
		//getRelateReview에서 사용할 query 만들기
	public String getRelateQuery(ArrayList<String> list) {
		String sum="";
		for(String str : list) {
			if(!str.equals(""))
				sum += "'"+str+"',";
		}
		sum = sum.substring(0, sum.length()-1);
		return ReviewStringQuery.RELATED_REVIEW_IN_CHECKREVIEW+sum+")))";
	}
	
		//course에 attraction 추가
	public void insertCourse(CourseVO cvo) throws SQLException {
	      Connection conn = null;
	      PreparedStatement ps = null;
	      Iterator<Integer> iter = cvo.getMap().keySet().iterator();
	      try {
	         conn = getConnect();
	         ps = conn.prepareStatement(CourseStringQuery.INSERT_COURSE);
	         while (iter.hasNext()) {
	            int order = iter.next();
	            ps.setInt(1, cvo.getCourseNum());
	            ps.setString(2, cvo.getMap().get(order).getSpotName());
	            ps.setInt(3, order);
	            ps.executeUpdate();
	         }
	      } finally {
	         closeAll(ps, conn);
	      }
	   }

		//course 생성
	public CourseVO makeCourse(String id, String course_name) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int courseNum = 0;
		CourseVO cvo = null;

		try {
			conn = getConnect();
			ps = conn.prepareStatement(CourseStringQuery.MAKE_COURSE);
			ps.setString(1, id);
			ps.setString(2, course_name);
			ps.executeUpdate();
			ps.close();

			ps = conn.prepareStatement("select course_seq.currVal course_num from dual");
			rs = ps.executeQuery();
			if (rs.next())
				courseNum = rs.getInt(1);
			System.out.println(courseNum + " course exist...");
			cvo = new CourseVO(courseNum, course_name);

		} finally {
			closeAll(ps, conn);
		}

		return cvo;
	}
	
		//user course list return
	public ArrayList<CourseVO> getCourses(String id,int num) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ArrayList<CourseVO> cList = new ArrayList<CourseVO>();
//		ArrayList<Integer> nList = new ArrayList<>();
		try {
			conn = getConnect();

			ps = conn.prepareStatement(CourseStringQuery.GET_COURSE_BY_ID);
			ps.setString(1, id);
			ps.setInt(2, num);
			rs = ps.executeQuery();

			while(rs.next()) {
				CourseVO cvo = null; 
//				nList.add(rs.getInt(1));
				HashMap<Integer,AttractionVO> cmap = new HashMap<Integer, AttractionVO>();
				ps2 = conn.prepareStatement(CourseStringQuery.GET_COURSE_BY_COURSE_NUM);
				ps2.setInt(1, rs.getInt("course_num"));		//nList.get(i) ::: courseNum
				rs2 = ps2.executeQuery();
				while(rs2.next()) {
					cmap.put(rs2.getInt("course_order"), 
							new AttractionVO(rs2.getString("spot_name"),
									rs2.getString("spot_image"),
									rs2.getString("lon"),
									rs2.getString("lat")));
				}
				ps2.close();
				cvo = new CourseVO(rs.getString("course_name"));
				cvo.setCourseNum(rs.getInt("course_num"));
				cvo.setMap(cmap);
				cList.add(cvo);
			}
		}finally {
			closeAll(rs, ps, conn);
		}
		return cList;
	}
	
	/*public ArrayList<CourseVO> getCourses(String id) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		ArrayList<CourseVO> cList = new ArrayList<CourseVO>();
//		ArrayList<Integer> nList = new ArrayList<>();
		try {
			conn = getConnect();
			ps = conn.prepareStatement(CourseStringQuery.GET_COURSE_BY_ID);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				CourseVO cvo = null; 
//				nList.add(rs.getInt(1));
				HashMap<Integer,AttractionVO> cmap = new HashMap<Integer, AttractionVO>();
				ps2 = conn.prepareStatement(CourseStringQuery.GET_COURSE);
				ps2.setInt(1, rs.getInt("course_num"));		//nList.get(i) ::: courseNum
				rs2 = ps2.executeQuery();
				while(rs2.next()) {
					cmap.put(rs2.getInt("course_order"), new AttractionVO(rs2.getString("spot_name"),rs2.getString("address"),rs2.getString("spot_image")));
				}
				cvo = new CourseVO(rs.getString("course_name"));
				cvo.setCourseNum(rs.getInt("course_num"));
				cvo.setMap(cmap);
				cList.add(cvo);
			}
		}finally {
			ps2.close();
			closeAll(rs, ps, conn);
		}
		return cList;
	}*/
	
		//courseNum 로 course 정보 return
	public CourseVO getCoursesByNum(int courseNum,String courseName) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        HashMap<Integer, AttractionVO> cmap = new HashMap<Integer, AttractionVO>();
        CourseVO course = new CourseVO(courseNum,courseName,cmap);

        // ArrayList<Integer> nList = new ArrayList<>();
        try {
           conn = getConnect();
           ps = conn.prepareStatement(CourseStringQuery.GET_COURSE_BY_NUM);
           ps.setInt(1, courseNum);
           rs = ps.executeQuery();
           while (rs.next()) {
              ps2 = conn.prepareStatement(CourseStringQuery.GET_ATTRACTION_BY_SPOT_NAME);
              ps2.setString(1, rs.getString("spot_name"));
              ps2.setString(2, rs.getString("spot_name"));
              rs2 = ps2.executeQuery();
              if(rs2.next()) {
                  cmap.put(rs.getInt("course_order"),new AttractionVO(rs2.getString("spot_name"),rs2.getString("spot_image"),rs2.getString("lon"),rs2.getString("lat")));
              }
              ps2.close();
           }
        } finally {
           closeAll(rs, ps, conn);
        }
        return course; 
     }
	
		//user course 갯수 return
	public int getCourseNumber(String id) throws SQLException{
	      Connection conn = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;
	      int num = -1;
	      try {
	         conn = getConnect();
	         ps = conn.prepareStatement("SELECT count(-1) FROM course WHERE id=?");
	         ps.setString(1, id);
	         rs = ps.executeQuery();
	         if(rs.next()) num = rs.getInt(1);
	      } finally {
	         closeAll(rs, ps, conn);
	      }
	      return num;
	   }
		//
	public String getChangeContent(String content) {
		   String updateContent1 = content.replaceFirst("<p>", "b");
		   String updateContent2 = content.replace("</p>","");
		   String updateContent3 = content.replace("<p>","");
		   return updateContent3;
	   }
	
	public static void main(String[] args) throws SQLException { // 단위테스트
	}
}