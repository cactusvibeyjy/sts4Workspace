<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Animal"%>
<%@ page import="dao.AnimalRepository"%>
<%
	String a_name = request.getParameter("a_name");
	if (a_name == null || a_name.trim().equals("")) {
		response.sendRedirect("cartAnimal.jsp");
		return;
	}

	session.invalidate();
	response.sendRedirect("cartAnimal.jsp");
%>
