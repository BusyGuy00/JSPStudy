package utils;

public class BoardPaging {
	public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
		//totalCount 전체 페이지 pageSize 한페이지당 얼만큼 보여질건지 blockPage  다음페이지  pageNum현재페이지 
		
		String pagingStr = "";
		//전체페이지 수 
		// 전체 레코드수(55)에 한 페이지당 레코드 수(5)를 나누고 더블 타입으로 받아(5.5) ->6 올림을 한후 int타입으로 케스팅 한다.
		int totalpages = (int) Math.ceil((double) totalCount/ pageSize);
		//이전페이지 블록 바로 가기
		//현재 1일때 1-1/5*5+1 = 1이 된다  (1~5까지는 1 6~10까지는6 11~15까지는 11이다.)
		//  5-1/5*5+1 = 1 5까지도 답은 1이며 6부터 6이 된다. 그렇게 됨으로써 다음 블럭6부터 10까지 출력되는 계산식이다.
		int pageTemp = ((pageNum-1)/ blockPage)*blockPage + 1;
		//pageTemp가 1이 아니라면 실행 하겠다.
		if(pageTemp != 1) { 
			pagingStr += "<a href='" +reqUrl+ "?pageNum=1'>[첫페이지]</a>";
			pagingStr  += "<a href='"+reqUrl+"?pageNum="+(pageTemp-1)+"'>[이전블록]</a>";
		}
		//각 페이지 번호 출력 
		// blockcount를 이용해 1~5까지 while문을 돌리 겠다 
		//pageTemp는 1~5까지 1인데 1씩 더해줘서 1,2,3,4,5가 넣어지고 같은 값을 가지고 있지 않을때는 링크가 걸린다.
		//blockPage는 5
		int blockcount = 1;
		//
		while(blockcount <= blockPage && pageTemp <= totalpages) {
			//pageTemp를 1씩 증가 시키면서 자동으로 페이지를 넘길거다
			//pageTemp가 현재 페이지와 같다면 a태그 링크가 나타나지 않는다.
			if(pageTemp == pageNum) {
				pagingStr += " "+pageTemp+" ";
			}else {
				pagingStr += "<a href='"+reqUrl+"?pageNum="
						+pageTemp+"'>"+pageTemp+"</a>";
			}
			pageTemp++;
			blockcount++;
		}
		//마지막페이지, 다음블럭 출력
		//pageTemp가 전체페이지수 이하일때 다음불록과 마지막 페이지 링크 출력
		if(pageTemp<=totalpages) {
			pagingStr += "<a href='"+reqUrl+"?pageNum="+pageTemp
					+"'>[다음블록]</a>";
			pagingStr += "<a href='"+reqUrl+"?pageNum="+totalpages
					+"'>[마지막페이지]</a>";
		}
		return pagingStr;
	}
}











