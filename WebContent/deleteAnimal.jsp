<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	String a_name = request.getParameter("a_name");

	PreparedStatement pstmt = null;	
	ResultSet rs = null;

	String sql = "select * from Animal";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		sql = "delete from Animal where a_name=?"; 
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, a_name); 
		pstmt.executeUpdate();
	} else
		out.println("일치하는 상품이 없습니다");
	
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("editAnimal.jsp?edit=delete");
%>
