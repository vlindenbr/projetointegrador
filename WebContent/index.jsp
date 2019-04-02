<%@page import="java.util.ArrayList"%>

<%@page import="controller.VeiculoController"%>
<%@page import="model.Veiculo"%>
<%
	String pesquisa = request.getParameter("pesquisa");
	ArrayList<Veiculo> veiculos = VeiculoController.getAnuncios(pesquisa);
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="includes/head.jsp" />
<body>
  <jsp:include page="includes/menu.jsp" />

  <div class="container">
  	<div class="row">
		<div class="col-lg-12">
			<div class="breadcrumb">
  				<h3 class="my-4">Bem vindo ao carangos</h3>
			</div>
			<form action="" >
				<div class="input-group" style="padding-bottom: 24px;">
					<input type="text" class="form-control" name="pesquisa" placeholder="O que você está procurando?" value="<% out.print(pesquisa != null ? pesquisa : ""); %>">
					 <span class="input-group-btn">
						<button class="btn cl1" type="submit">Pesquisar</button>
					</span>
				</div>
			</form>
		</div>
	</div>
	
	<% if(veiculos.size() > 0){%>
    <div class="row">
      <div class="col-lg-12">
<!-- 
  		<jsp:include page="includes/carousel.jsp" />      
 -->

        <div class="row">

          <% for (Veiculo veiculo : veiculos) {%>
			<jsp:include page="anuncio/item.jsp">
				<jsp:param name="link" value="<%=veiculo.getLinkVisualizacao()%>" />
				<jsp:param name="nome" value="<%=veiculo.getNome()%>" />
				<jsp:param name="valor" value="<%=veiculo.getValor()%>" />
				<jsp:param name="observacoes"
					value="<%=veiculo.getObservacoesAbrev()%>" />
				<jsp:param name="id" value="<%=veiculo.getId()%>" />
			</jsp:include>
			<%}%>

        </div>
      </div>
    </div>
    <%}else{%>
	    <div class="row">
      		<div class="col-lg-12" style="padding-bottom: 24px;">
				<i>Nenhum anúncio encontrado!</i>
			</div>
		</div>
	<%} %>
  </div>
<jsp:include page="includes/footer.jsp" />
</body>
</html>
