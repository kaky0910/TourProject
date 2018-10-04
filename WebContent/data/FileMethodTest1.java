package file.method.step1.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
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
		
		ArrayList<File> list = new ArrayList<File>();
		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\������.txt"));
		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\��⵵.txt"));
		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\��󳲵�.txt"));
		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\���ϵ�.txt"));
		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\����.txt"));
		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\�뱸.txt"));
		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\����.txt"));

		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\�λ�.txt"));
		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\����.txt"));
		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\���.txt"));
		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\��õ.txt"));
		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\���󳲵�.txt"));
		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\����ϵ�.txt"));
		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\���ֵ�.txt"));
		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\��û����.txt"));
		list.add(new File("C:\\yjk\\webPro2\\eclipse\\workspace\\TourReview\\WebContent\\data\\��û�ϵ�.txt"));
		
		for(File f : list) {
			FileReader fr = new FileReader(f);
			BufferedReader br = new BufferedReader(fr);
			String city;
			while(( city=br.readLine())!=null) {
		//		String city = br.readLine();
				ps =conn.prepareStatement("INSERT INTO location VALUES(?,?)");
				ps.setString(1, f.getName().replace(".txt", ""));
				ps.setString(2, city);
				ps.executeQuery();
				System.out.println("����");
				}
		}
		/*System.out.println(f1.getPath());
		System.out.println(f1.getAbsolutePath());*/
		
		
	}

}
