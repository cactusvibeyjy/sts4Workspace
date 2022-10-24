<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String) request.getAttribute("name");
	
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Board</title>
</head>
<script type="text/javascript">
	function checkForm() {
		if (!document.newWrite.aniid.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (!document.newWrite.aniname.value) {
			alert("이름을 입력하세요.");
			return false;
		}
		if (!document.newWrite.aniage.value) {
			alert("나이를 입력하세요.");
			return false;
		}		
	}
</script>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">동물 게시판 글쓰기 form</h1>
		</div>
	</div>

	<div class="container">

		<form name="newWrite" action="./BoardWriteAction.do"
			class="form-horizontal" method="post" onsubmit="return checkForm()">
			<input name="id" type="hidden" class="form-control"
				value="${sessionId}">
			<div class="form-group row">
				<label class="col-sm-2 control-label" >아이디</label>
				<div class="col-sm-3">
					<input name="aniid" type="text" class="form-control" value=""
						placeholder="aniid">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >이름</label>
				<div class="col-sm-5">

					<input name="aniname" type="text" class="form-control"
						placeholder="aniname">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >나이</label>
				<div class="col-sm-8">
					<input name="aniage" type="text" class="form-control"
						placeholder="aniage">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
				 <input type="submit" class="btn btn-primary " value="등록 ">				
					 <input type="reset" class="btn btn-primary " value="취소 ">
				</div>
			</div>
		</form>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>



