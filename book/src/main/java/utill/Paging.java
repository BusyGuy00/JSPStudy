package utill;

public class Paging {
	public static String pagingstr(int totalCount,int pageSize,int blockPage,
			int pageNum,String reqUrl,String idx) {
		String pagingStr = "";
		
		//전체 페이지 수
		int totalpages = (int)Math.ceil((double)totalCount/pageSize);
		//첫페이지 이전블록 바로가기
		int pageTemp = (((pageNum-1)/blockPage)*blockPage)+1;
		if(pageTemp != 1) {
			pagingStr += "<a href='"+reqUrl+"?pageNum=1&idx="+idx+"'>[첫페이지]</a>";
			pagingStr += "<a href='"+reqUrl+"?pageNum="+(pageTemp-1)+"&idx="+idx+"'>[이전블록]</a>";
		}
		//각 페이지 번호 출력
		int blockcount = 1;
		while(blockcount <= blockPage && pageTemp <= totalpages) {
			//현재 보이고있는페이지는 링크 제거
			if(pageTemp == pageNum) {
				pagingStr += ""+pageTemp+"";
			}
			else {
				pagingStr += "<a href='"+reqUrl+"?pageNum="+pageTemp+"&idx="+idx+"'>"+pageTemp+"</a>";
			}
			pageTemp++;
			blockcount++;
		}
		//마지막페이지 다음블록 바로가기
		if(pageTemp<=totalpages) {
			pagingStr += "<a href='"+reqUrl+"?pageNum="+pageTemp+"&idx='"+idx+">[다음블록]</a>";
			pagingStr += "<a href='"+reqUrl+"'?pageNum="+totalpages+"&idx="+idx+">[마지막페이지]</a>";
		}
		return pagingStr;
	}
}
