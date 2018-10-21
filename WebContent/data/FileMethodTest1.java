package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

/*
 * File class 占쏙옙 method占쏙옙 占싹놂옙占싹놂옙占쌜쇽옙
 */
public class FileMethodTest1 {
	static {
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static void main(String[] args) throws SQLException, IOException {
/*		File f = new File("C:\\yjk\\javaPro\\eclipse\\workspace\\java27_File\\src\\file\\method\\step1\\test\\FileMethodTest1.java");
	//	File f1 = new File("src\\file\\method\\step1\\test\\FileMethodTest1.java"); <-- path
		
		System.out.println(f.getName());
		System.out.println(f.getAbsolutePath());
		System.out.println(f.getPath());
		System.out.println(f.isFile());
		System.out.println(f.isDirectory());
		System.out.println("getParent : "+f.getParent());  //////////file占쏙옙 method getParent() : return String......... 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
														// 占쏙옙占쏙옙 占쏙옙占썰리 占쏙옙占쏙옙 확占쏙옙占쌀띰옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 getParentFile()占쏙옙占승울옙占쏙옙 .mkdirs() 占싹몌옙 占쏙옙占썰리 占쏙옙占쏙옙 ---> 확占쏙옙,占쏙옙占쏙옙      占쏙옙 createNewFile()
		
		String name = f.getName();
		System.out.println(name.substring(0, name.indexOf("."))); //확占쏙옙占쏙옙占쏙옙占쏙옙
		System.out.println(name.substring(name.indexOf(".")+1));//확占쏙옙占쌘몌옙
*/		Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "tour", "oracle");
		PreparedStatement ps = null;
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\강원도.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\경기도.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\경상남도.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\경상북도.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\광주광역시.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\��援ш킅�뿭�떆.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\���쟾愿묒뿭�떆.txt");

		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\遺��궛愿묒뿭�떆.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\�꽌�슱�듅蹂꾩떆.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\�슱�궛愿묒뿭�떆.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\�씤泥쒓킅�뿭�떆.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\�쟾�씪�궓�룄.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\�쟾�씪遺곷룄.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\�젣二쇰룄.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\異⑹껌�궓�룄.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\異⑹껌遺곷룄.txt");
		
		for(String f : list) {
			FileReader fr = new FileReader(f);
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(f),"UTF8"));

			String city;
			while(( city=br.readLine())!=null) {
		//		String city = br.readLine();
				ps =conn.prepareStatement("INSERT INTO location VALUES(?,?)");
				ps.setString(1, f.replace("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\", "").replace(".txt", ""));
				ps.setString(2, city);
				ps.executeQuery();
				System.out.println("�꽦怨�");
				}
		}
		/*System.out.println(f1.getPath());
		System.out.println(f1.getAbsolutePath());*/
		
		
	}

}
