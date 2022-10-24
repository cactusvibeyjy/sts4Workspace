<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>동물 편집</title>
<script type="text/javascript">
	function deleteConfirm(a_name) {
		if (confirm("해당 상품을 삭제합니다!!") == true)
			location.href = "./deleteAnimal.jsp?a_name=" + a_name;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
</head>
<body>
<%@ include file="dbconn.jsp"%>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">동물 수정</h1>
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
				<img src="./resources/images/<%=rs.getString("P_fileName")%>" width= 200px height=200px>
				<h3><%=rs.getString("a_name")%></h3>
				<p><%=rs.getString("a_age")%>
				<p><%=rs.getString("a_area")%>
				<p><%
						if (edit.equals("update")) {
					%>
					<a href="./updateAnimal.jsp?a_name=<%=rs.getString("a_name")%>" class="btn btn-success" role="button"> 수정 &raquo;></a>
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("a_name")%>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
					<%
						}
					%>				
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
	<jsp:include page="footer.jsp" />
</body>
</html>