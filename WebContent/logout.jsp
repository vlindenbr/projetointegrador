<%
	session.removeAttribute("name");
	session.invalidate();
	response.sendRedirect("http://localhost:8080/Carangos/login.jsp");
%>