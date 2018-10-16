package query.course;

public interface CourseStringQuery {
	String MAKE_COURSE = "INSERT INTO course(id,course_num,course_name) VALUES(?,course_seq.nextVal,?)";
	String INSERT_COURSE = "INSERT INTO course_info(course_num,spot_name,order) VALUES(?,?,?)";
}
