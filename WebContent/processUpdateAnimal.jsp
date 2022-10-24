<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
	String filename = "";
	String realFolder = "C:\\JSP_Workspace1\\WebMarket\\WebContent\\resources\\images"; //웹 어플리케이션상의 절대 경로
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 10 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	String a_name = multi.getParameter("a_name");
	String a_age = multi.getParameter("a_age");
	String a_area = multi.getParameter("a_area");
	/* String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
 */
/* 	Integer price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock); */

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String P_fileName = multi.getFilesystemName(fname);	

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from Animal where a_name=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, a_name); 
	rs = pstmt.executeQuery();	
	
	if (rs.next()) {		
		if (P_fileName != null) {
			sql = "UPDATE Animal SET  a_age=?, a_area=?, P_fileName=? WHERE a_name=? ";	
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, a_age);
			pstmt.setString(2, a_area);
			pstmt.setString(3, P_fileName);
			pstmt.setString(4, a_name);
			pstmt.executeUpdate();
		} else {
			sql = "UPDATE Animal SET  a_age=?, a_area=? WHERE a_name=?";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a_age);
			pstmt.setString(2, a_area);
			pstmt.setString(3, a_name);
			
			pstmt.executeUpdate();			
		}		
	}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("editAnimal.jsp?edit=update");
%>


