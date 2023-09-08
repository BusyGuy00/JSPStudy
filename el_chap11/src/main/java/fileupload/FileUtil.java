package fileupload;
//여러가지 값을 보내주는 클래스

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

//정적메소드로 클래스명 파일명을 통해서 사용 해야 한다.
//FieleUtill.uploadFile()로 접근 가능 하다 .
//saveDirectory은 저장경로 
//파일 업로드시  MultipartRequest를 통해서 업로드를 한다. 
public class FileUtil {
	public static MultipartRequest uploadFile(HttpServletRequest req, String saveDirectory, int maxPostSize) {
		try {
			return new MultipartRequest(req, saveDirectory, maxPostSize, "UTF-8" );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
