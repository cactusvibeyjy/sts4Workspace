<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>동물 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">동물 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from Animal";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<%-- <img src="c:/upload/<%=rs.getString("p_fileName")%>" style="width: 100%"> --%>
				<img src="./resources/images/<%=rs.getString("P_fileName")%>" width= 180px height=180px>
				<h3>이름: <%=rs.getString("a_name")%></h3>
				<p>나이: <%=rs.getString("a_age")%>
				<p>사는 곳: <%=rs.getString("a_area")%>
				<p><a href="./Animalproduct.jsp?a_name=<%=rs.getString("a_name")%>"class="btn btn-secondary" role="button">상세 정보 &raquo;></a>
			</div>
			<%
				}
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			%>
		</div>
		<hr>
	</div>
	
</body>
<jsp:include page="footer.jsp" />
</html>
