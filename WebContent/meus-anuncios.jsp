<%@page import="java.util.ArrayList"%>

<%@page import="controller.VeiculoController"%>
<%@page import="model.Veiculo"%>
<%
	//Integer id = (Integer)request.getSession().getAttribute("user_id");
	//ArrayList<Veiculo> veiculos = VeiculoController.getMeusAnuncios(id);
	//ArrayList<Veiculo> veiculos = VeiculoController.getMeusAnuncios(2);
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="includes/head.jsp" />
<body>

	<%
	//verificar se o usuario esta logado
		System.out.println(session.getAttribute("user_id"));
			if(session.getAttribute("user") == null || session.getAttribute("user_id")==null){
				System.out.println("DENTRO DO IF ---> " + session.getAttribute("user_id"));
				%>
				<script>
					window.alert("Login necessário");
					window.location.replace("http://localhost:8080/Carangos/login.jsp");
				</script>
				<%
				response.sendRedirect("http://localhost:8080/Carangos/login.jsp");
			}
				Integer id = (Integer)request.getSession().getAttribute("user_id");
				ArrayList<Veiculo> veiculos = VeiculoController.getMeusAnuncios(id);
			
		%>
  <jsp:include page="includes/menu.jsp" />
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
  		<div class="breadcrumb">
		  <h3>Meus Anúncios</h3>
		  <a href="editar-anuncio.jsp?id=novo" class="btn cl1 btn-adicionar" role="button" aria-pressed="true">Adicionar</a>
		  <a href="logout.jsp"><h3>Logout</h3></a>
		</div>
        <div class="row">
		<% if (veiculos.size() > 0) { %>
			<% for (Veiculo veiculo : veiculos) {%>
				<jsp:include page="anuncio/item.jsp">
					<jsp:param name="link" value="<%=veiculo.getLinkEdicao()%>" />
					<jsp:param name="nome" value="<%=veiculo.getNome()%>" />
					<jsp:param name="valor" value="<%=veiculo.getValor()%>" />
					<jsp:param name="observacoes" value="<%=veiculo.getObservacoesAbrev()%>" />
					<jsp:param name="id" value="<%=veiculo.getId()%>" />
				</jsp:include>
			<%}%>
		<%} %>
        </div>
      </div>
    </div>
  </div>
<jsp:include page="includes/footer.jsp" />
</body>
</html>
