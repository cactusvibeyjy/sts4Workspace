<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%@ page errorPage="exceptionNoProductId.jsp"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
	//웹 브라우저에서 URI 뒤에 주소 ? 뒤에 ID 속성 값을 가져왔음
	//예를 들면, 상품 목록에서, 상품의 개체를 하나 선택 시, 해당 상품의 아이디입니다
	//ex) p1234
	String a_name = request.getParameter("a_name");
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select * from Animal where a_name=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, a_name); 
	rs = pstmt.executeQuery();	
	while (rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5" style="text-align : center;">
				<img src="./resources/images/<%=rs.getString("P_fileName")%>" width= 200px height=200px>
					
			</div>
			<div class="col-md-6">
				<h3><%=rs.getString("a_name")%></h3>
				<p>
					<b>상품 이름 : </b><span class="badge badge-danger"> <%=rs.getString("a_name")%></span>
				<p>
					<b>사는 곳</b> :
					<%=rs.getString("a_area")%>
				<p>
					<b>나이</b> :
					<%=rs.getString("a_age")%>
				
				<form name="addForm"
					action="./addCartAnimal.jsp?a_name=<%=rs.getString("a_name")%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> 상품 주문
						&raquo;</a> <a href="./cartAnimal.jsp" class="btn btn-warning"> 장바구니
						&raquo;</a> <a href="./Animalproducts.jsp" class="btn btn-secondary"> 상품
						목록 &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<%} %>
	<jsp:include page="footer.jsp" />
</body>
</html>
