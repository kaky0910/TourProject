package query.course;

import model.CommonConstants;

public interface CourseStringQuery {
		// course 생성
      String MAKE_COURSE = "INSERT INTO course(id,course_num,course_name) VALUES(?,course_seq.nextVal,?)";
      	// course에 attraction 추가
      String INSERT_COURSE = "INSERT INTO course_info(course_num,spot_name,course_order) VALUES(?,?,?)";
      
      	// course 세부정보 return
      String GET_COURSE = "SELECT course_num,course_info.spot_name spot_name,course_order,address,spot_image FROM course_info,"
            + "(SELECT tourspot.spot_name spot_name,address,spot_image FROM tourspot,spot_image WHERE tourspot.spot_name=spot_image.spot_name) tour"
            + " WHERE course_num = ? AND (course_info.spot_name = tour.spot_name) ORDER BY course_order";
      	
      	// 관광지 세부정보 return
      String GET_ATTRACTION_BY_SPOT_NAME = "SELECT tourspot.spot_name spot_name,spot_image,lon,lat FROM tourspot,spot_image WHERE tourspot.spot_name=? AND spot_image.spot_name=?"; 
      	
      	// user course들 return
      String GET_COURSE_BY_ID = "select * from course where course_num in (select course_num from"
               + " (SELECT course_num,course_name,CEIL(rownum/6) page FROM"
               + " (SELECT * FROM course WHERE id=? ORDER BY course_num desc)) WHERE page=?) ORDER BY course_num desc";
      	// 
      String GET_COURSE_BY_NUM = "select * from course_info where course_num = (select course_num from course where course_num=?)";
      	// 
      String GET_COURSE_BY_COURSE_NUM = "SELECT course_order,tourspot.spot_name spot_name,spot_image,lon,lat FROM "
      		+ "(SELECT course_order,course_info.spot_name spot_name,spot_image "
      		+ "FROM course_info,spot_image WHERE course_num = ? AND spot_image.spot_name = course_info.spot_name) tourinfo,tourspot\n" + 
      		" WHERE tourspot.spot_name=tourinfo.spot_name";
}