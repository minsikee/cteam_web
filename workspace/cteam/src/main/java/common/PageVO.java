package common;

public class PageVO{
	private int pageList = 10;	//페이지당 보여질 목록수
	private int blockPage = 10; //블럭당 보여질 페이지수
	
	private int totalList; 	//총목록수
	
	private int totalPage;		//총페이지수
	
	private int totalBlock;	//총블럭수
	
	private int curPage; //현재페이지
	private int curBlock;//현재블럭
	private int beginList, endList; //현재페이지에 보여질 목록시작,
	private int beginPage, endPage; 
	
	private String search, keyword; //검색조건, 검색어

	public int getPageList() {
		return pageList;
	}

	public void setPageList(int pageList) {
		this.pageList = pageList;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public int getTotalList() {
		return totalList;
	}

	public void setTotalList(int totalList) {
		this.totalList = totalList;
		//DB조회 결과에 따라 총페이지수가 달라짐
		totalPage = totalList / pageList;
		if(totalList % pageList > 0) ++totalPage;
		
		//총페이지 수에 따라 총 블럭수가 결정
		
		totalBlock = totalPage  / blockPage;
		if( totalPage % blockPage > 0) ++totalBlock;
		
	
		//현재페이지에 따라 보여질 목록의 번호가 결정
		//624건 : 1페이지 615-624
		//2페이지 603-6140
		endList= totalList - (curPage -1 )* pageList;
		beginList = endList - (pageList -1);
		
		
		
		//현재블럭에 따라 보여질 페이지 번호가 결정
		curBlock= curPage / blockPage; 	 		
		if(curPage % blockPage > 0) ++curBlock;
		//1블럭 1-10페이지
		//2블럭 11-20페이지
		
		endPage = blockPage * curBlock;		
		beginPage = endPage - (blockPage -1 );			
		
		
		if(endPage>totalPage) endPage = totalPage;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getBeginList() {
		return beginList;
	}

	public void setBeginList(int beginList) {
		this.beginList = beginList;
	}

	public int getEndList() {
		return endList;
	}

	public void setEndList(int endList) {
		this.endList = endList;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	
	
	
	
}



