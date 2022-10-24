<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>동물 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">동물 수정</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
		String a_name = request.getParameter("a_name");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "select * from Animal Where a_name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, a_name);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("P_filename")%>" alt="image" style="width:100%" />
			</div>
			<div class="col-md-7">
				<form name="newProduct" action="./processUpdateAnimal.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">이름</label>
						<div class="col-sm-3">
							<input type="text" id="a_name" name="a_name" class="form-control" value='<%=rs.getString("a_name")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">나이</label>
						<div class="col-sm-3">
							<input type="text" id="a_age" name="a_age" class="form-control" value="<%=rs.getString("a_age")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">사는 곳</label>
						<div class="col-sm-3">
							<input type="text" id="a_area" name="a_area" class="form-control" value="<%=rs.getString("a_area")%>">
						</div>
					</div>
					<%-- <div class="form-group row">
						<label class="col-sm-2">상세 설명</label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2" class="form-control"><%=rs.getString("p_description")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">제조사</label>
						<div class="col-sm-3">
							<input type="text" name="manufacturer" class="form-control" value="<%=rs.getString("p_manufacturer")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">분류</label>
						<div class="col-sm-3">
							<input type="text" name="category" class="form-control" value="<%=rs.getString("p_category")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">제고 수</label>
						<div class="col-sm-3">
							<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=rs.getLong("p_unitsInStock")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상태</label>
						<div class="col-sm-5">
							<input type="radio" name="condition" value="New "> 신규 제품
							<input type="radio" name="condition" value="Old"> 중고 제품
							<input type="radio" name="condition" value="Refurbished"> 재생 제품
						</div>
					</div> --%>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="P_fileName" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</div>
				</form>
			</div>
		</div>
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
</body>
</html>
