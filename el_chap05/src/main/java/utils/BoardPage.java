package utils;

public class BoardPage {
	//정적 메소드 생성 
	//totalCount " 전체 게시글 수 
	//totalPages : 전체 페이지 수
	//pageSize : 1페이지당 게스굴 10개 
	//blockPage : 1블럭당 페이지수 5개
	//pageNum : 현재 페이지 번호
	//reqUrl : 파라미터로 요청하는 페이지 주소
	public static String pagingStr(int totalCount, int totalPages, 
			int pageSize, int blockPage, int pageNum, String reqUrl, String searchField, String searchWord ) {
		String pageStr = "";
		
		//블럭에 필요한 번호의 변수 선언 
		//1~5 페이지 1
		//6~10 페이지 6 11~15
		//pageNum은 현재 보고 있는 페이지이다.
		//ex ((6-1))//5*5)+1
		int pageTemp = ((pageNum-1) / blockPage*blockPage) + 1;
		//블럭번호 pageTemp가 1이 아닐때만 이전불록 첫페이지가기가 나타나게 한다
		if (pageTemp != 1) {
			if(searchWord != null && !searchWord.equals("")) {
			pageStr += "<a href='"+reqUrl+
				"?searchField="+searchField+
				"&searchWord="+searchWord+
				"&pageNum=1'>[첫페이지]</a>";
			pageStr += "<a href='"+reqUrl+
				"?searchField="+searchField+
				"&searchWord="+searchWord+
				"&pageNum="
				+(pageTemp-1)+"'>[이전블럭]</a>";
	}else {
		pageStr += "<a href='"+reqUrl+"?pageNum=1'>[첫페이지]</a>";
		pageStr += "<a href='"+reqUrl+"?pageNum="+(pageTemp-1)+"'>[이전블럭]</a>";
	}
		}
	
			//http://localhost:8090/el_chap05/board/boardlist.jsp?pageNum=1
////			이 되게 해보자
//			pageStr += "<a href='"+reqUrl+"?pageNum=1'>[첫페이지]</a>";
//			pageStr += "<a href='"+reqUrl+"?pageNum="+(pageTemp-1)+"'>[이전블럭]</a>";
//		}
		//각 페이지 번호 출력 (1,2,3,4,5 또는 6,7,8,9,10)
		int blockCount =1;
		//blockCount 1 ~ 5까지 반복
		//시작은 pageTemp값으로 1씩 증가
		while(blockCount <= blockPage && pageTemp <= totalPages) {
			//현재 페이지일때는 링크를 걸지 않는다.
			//&nbsp; 빈킨을 나타낸다 html 문자첨부기호
			if(pageTemp == pageNum) {
				pageStr += "&nbsp;"+ pageTemp + "&nbsp;";
			}else {
				if(searchWord != null && !searchWord.equals("")) {
					pageStr +="&nbsp;<a href='"+reqUrl+
							"?searchField="+searchField+
							"&searchWord="+searchWord+
							"&pageNum="
							+pageTemp+"'>"+pageTemp+"</a>&nbsp";
				}
				else {
					pageStr += "&nbsp;<a href='"+reqUrl+"?pageNum="
							+pageTemp+"'>"+pageTemp+"</a>&nbsp;";
				}
			}
			pageTemp++;
			blockCount++;
		}
		//다음 페이지 블럭 바로가기 
		if(pageTemp <= totalPages) {
			if(searchWord != null && !searchWord.equals("")) {
				pageStr +="<a href='"+reqUrl+
				"?searchField="+searchField+
				"&searchWord="+searchWord+
				"&pageNum="
				+pageTemp+"'>[다음블럭]</a>";
			pageStr += "<a href='"+reqUrl+
					"?searchField="+searchField+
					"&searchWord="+searchWord+
					"&pageNum="
					+pageTemp+"'>[마지막페이지]</a>";
		}
			else {
				pageStr += "<a href='"+reqUrl+"?pageNum="+pageTemp+"'>[다음블럭]</a>";
				pageStr += "<a href='"+reqUrl+"?pageNum="+totalPages+"'>[마지막페이지]</a>";}
			}
		return pageStr;
	}
}
