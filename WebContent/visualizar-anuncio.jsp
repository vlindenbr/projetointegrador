<%@page import="model.VeiculoImagem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helper.Formater"%>
<%@page import="controller.VeiculoController"%>
<%@page import="model.Veiculo"%>
<%
	String id = request.getParameter("id");

	Veiculo veiculo = null;
	ArrayList<VeiculoImagem> imagens = new ArrayList<VeiculoImagem>();

	if (id != null) {
		veiculo = VeiculoController.getVeiculoById(Integer.parseInt(id));
		imagens = VeiculoController.getImagensByVeiculoId(Integer.parseInt(id));
	}
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="includes/head.jsp" />
<body>
	<jsp:include page="includes/menu.jsp" />

	<div class="container">
		<%
			if (imagens.size() > 0) {
		%>

		<div id="carouselExampleIndicators" style="background-color: #eee"
			class="carousel slide my-4" data-ride="carousel">
			<ol class="carousel-indicators">
				<%
					for (int i = 0; i < imagens.size(); i++) {
				%>
				<li data-target="#carouselExampleIndicators" data-slide-to="<%=i%>"
					class="active"></li>
				<%
					}
				%>
			</ol>
			<div class="carousel-inner" role="listbox">
				<%
					for (int i = 0; i < imagens.size(); i++) {
				%>
				<div class="carousel-item <%=i == 0 ? "active" : ""%>">
					<center>
						<img style="height: 350px;" class="d-block img-fluid"
							src="imagem?id=<%out.print(imagens.get(i).getId());%>"
							alt="First slide">
					</center>
				</div>
				<%
					}
				%>
			</div>
			<%
				if (imagens.size() > 1) {
			%>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
			<%
				}
			%>
		</div>
		<%
			}
		%>
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb">
					<h3><%=veiculo.getNome()%></h3>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>Placa:</label> <b><%=veiculo.getPlaca()%></b>
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>Quilometragem:</label> <b><%=veiculo.getQuilometragem()%></b>
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>Ano:</label> <b><%=veiculo.getAno()%></b>
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>Valor:</label> <b><%=veiculo.getValor()%></b>
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>Descrição:</label> <b><%=veiculo.getObservacoes()%></b>
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>E-mail:</label> <b></b>
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>Telefone:</label> <b></b>
					</div>
				</div>
			</div>

		</div>
		<!-- /.row -->

	</div>
</body>
<jsp:include page="includes/footer.jsp" />
</html>
