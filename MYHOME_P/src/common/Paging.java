package common;

public class Paging {

	
	public static String getPaging(String path, int page, int recordPerPage, int totalRecord) {
		StringBuffer sb = new StringBuffer();
		
		int totalPage = 0;
		int pagePerBlock = 3;
		int beginPage = 0;
		int endPage = 0;
		
		
		totalPage = (int)(totalRecord / recordPerPage);
		if (totalRecord % recordPerPage != 0) {
			totalPage++;
		}
		
		if (page>totalPage) {
			totalPage = page;
		}
		
		beginPage = (int)(((page-1) / pagePerBlock) * pagePerBlock) +1;
		endPage = beginPage + pagePerBlock - 1;
		
		if (endPage>totalPage) {
			endPage=totalPage;
		}
		
		
		
		// previous button "◀"
		if ( beginPage < pagePerBlock ) {
			sb.append("<span style='color: lightgray;'>◀</span>&nbsp;&nbsp;");
		} else {
			if (path.indexOf("?") > 0) {
				sb.append("<a href='" + path + "&page=" + (beginPage - 1) + "'>◀</a>&nbsp;&nbsp;");
			} else  {
				sb.append("<a href='" + path + "?page=" + (beginPage - 1) + "'>◀</a>&nbsp;&nbsp;");
			}
		}
		
		// page numbering 
		for ( int p = beginPage; p <= endPage; p++ ) {
			if ( p == page ) {
				sb.append("<span style='color: limegreen;'>" + p + "</span>&nbsp;&nbsp;");
			} else {
				if (path.indexOf("?") > 0) {
					sb.append("<a href='" + path + "&page=" + p + "'>" + p + "</a>&nbsp;&nbsp;");
				} else  {
					sb.append("<a href='" + path + "?page=" + p + "'>" + p + "</a>&nbsp;&nbsp;");
				}
			}
		}
		
		// next button "▶"
		if ( endPage == totalPage ) {
			sb.append("<span style='color: lightgray;'>▶</span>");
		} else {
			if (path.indexOf("?") > 0) {
				sb.append("<a href='" + path + "&page=" + (endPage + 1) + "'>▶</a>&nbsp;&nbsp;");
			} else  {
				sb.append("<a href='" + path + "?page=" + (endPage + 1) + "'>▶</a>&nbsp;&nbsp;");
			}
		}
		
		return sb.toString();
		
	}
}
