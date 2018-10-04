package query.review;

public interface ReviewStringQuery {

	
	String SEARCH_BY_TAG="SELECT * FROM review WHERE review_num in (SELECT review_num FROM tag WHERE word =?)";
	//�±װ˻��ؼ� ���� ��������
	String GET_WORD="SELECT * FROM TAG WHERE review_num  in (SELECT review_num FROM tag WHERE word =?)";
	//�±׿��� word ��������
	String GET_COMMENTS="SELECT * FROM comments WHERE review_num in (SELECT review_num FROM tag WHERE word =?)";
	//review_num�� �´� comments���̺� ��������
	String GET_REVIEW_IMAGE="SELECT * FROM review_image WHERE review_num in (SELECT review_num FROM tag WHERE word = ?)";
	//review_num�� �´� review_image���̺� ��������
	String SCRAP="insert into scrap values(?,?)";
	String GET_ATTRACTION = "select spot_name,address,location,city,info,img from tourspot where city=?";
	String GET_ATTRACTION_IMG= "select spot_image from spot_image where spot_name=?";
	String GET_FESTIVAL_INFO = "select festival_Name,festival_Location,location,city,start_Date,end_Date,agency from festival where city='��õ��' \n" + 
			" AND start_Date <=(SELECT SYSDATE + 7 FROM DUAL)";
	String BEST_REVIEW_LOCATION_TAG = "select review_num, title, likes from (select * from review order by likes desc) where rownum<4"
			+ " AND review_num IN (SELECT review_num FROM tag WHERE tag=?) AND location=?";
	String GET_TAG_LIST = "select word from tag where review_num=?";
	String GET_IMAGE_LIST = "select img from tourspot where city=?";
	String GET_SPOT_IMAGELIST ="select spot_image from spot_image where spot_name=?";
	String CHECK_REVIEW = "select * from review where review_num = ?";
	
	String GET_REVIEW_IMAGES = "SELECT review_image FROM review_image WHERE review_num = ?";
	String GET_REVIEW_COMMENTS = "SELECT id,comment FROM comment WHERE review_num = ?";
}
