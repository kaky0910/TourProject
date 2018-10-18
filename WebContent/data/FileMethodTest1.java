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
 * File class �� method�� �ϳ��ϳ��ۼ�
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
		System.out.println("getParent : "+f.getParent());  //////////file�� method getParent() : return String......... �������� ����
														// ���� ���丮 ���� Ȯ���Ҷ� ���� ������ getParentFile()���¿��� .mkdirs() �ϸ� ���丮 ���� ---> Ȯ��,����      �� createNewFile()
		
		String name = f.getName();
		System.out.println(name.substring(0, name.indexOf("."))); //Ȯ��������
		System.out.println(name.substring(name.indexOf(".")+1));//Ȯ���ڸ�
*/		Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "tour", "oracle");
		PreparedStatement ps = null;
		
		ArrayList<String> list = new ArrayList<String>();
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\경기도.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\강원도.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\경상남도.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\경상북도.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\광주광역시.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\대구광역시.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\대전광역시.txt");

		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\부산광역시.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\서울특별시.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\울산광역시.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\인천광역시.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\전라남도.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\전라북도.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\제주도.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\충청남도.txt");
		list.add("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\충청북도.txt");
		
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
				System.out.println("성공");
				}
		}
		/*System.out.println(f1.getPath());
		System.out.println(f1.getAbsolutePath());*/
		
		
	}

}
