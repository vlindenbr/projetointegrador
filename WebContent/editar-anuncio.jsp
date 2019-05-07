<%@page import="controller.VeiculoController"%>
<%@page import="model.Veiculo"%>
<%@page import="helper.Formater"%>
<%
	String id = request.getParameter("id");

	Integer usuarioId = 2;
	Veiculo veiculo= null;

	if(request.getMethod().equals("GET")){
		if (id != null && !id.equals("novo")) {
			veiculo = VeiculoController.getVeiculoById(Integer.parseInt(id));
			if(veiculo.getUsuarioId() != usuarioId){
				response.sendRedirect("index.jsp");
			}
		} 
	}
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
					<h3>Meus An�ncios / Editar</h3>
				</div>
				<form method="post" enctype="multipart/form-data" action="anuncio">
						<ul>
							<li class="col-6">
								<input type="hidden" name="id" value="<%=id %>">
								<input type="text" class="form-control" placeholder="Placa*" name="placa" required="required" value="<%out.print(veiculo != null ? veiculo.getPlaca() : "");%>" onchange="consultarPlaca(this)">
							</li>
							<li class="col-6">
								<input type="text" class="form-control" placeholder="Nome*" name="nome" required="required" value="<%out.print(veiculo != null ? veiculo.getNome() : "");%>">
							</li>
							<li class="col-6">
								<select required="required" name="tipo" class="form-control">
  									<option>Tipo*</option>
  									<option value="0" <%out.print(veiculo != null && veiculo.getTipo() == 0 ? "selected=\"selected\"" : "");%>>Carro</option>
  									<option value="1" <%out.print(veiculo != null && veiculo.getTipo() == 1 ? "selected=\"selected\"" : "");%>>Moto</option>
  									<option value="2" <%out.print(veiculo != null && veiculo.getTipo() == 2 ? "selected=\"selected\"" : "");%>>Caminh�o</option>
								</select>
							</li>
							<li class="col-6">
								<input placeholder="Quilometragem" name="quilometragem" type="number" class="form-control" aria-describedby="basic-addon1" value="<%out.print(veiculo != null ? veiculo.getQuilometragem() : "");%>">
							</li>
							<li class="col-6">
								<input placeholder="Ano" name="ano" type="number" class="form-control" aria-describedby="basic-addon1" value="<%out.print(veiculo != null ? veiculo.getAno() : "");%>">
							</li>
							<li class="col-6">
								<input type="text" class="form-control" placeholder="Valor*" name="valor" required="required" value="<%out.print(veiculo != null ? Formater.valor(veiculo.getValor()) : "");%>">
							</li>
							<li class="col-6">
								<textarea class="form-control" rows="3" name="observacoes" placeholder="Descri��o"><% out.print(veiculo != null ? veiculo.getObservacoes() : "");%></textarea>
							</li>
							<li class="col-6">
								<div class="custom-file">
									<input name="imagem" multiple="multiple" type="file" class="custom-file-input">
    								<label class="custom-file-label" for="validatedCustomFile">Fotos...</label>
  								</div>
							</li>
							<li class="col-6">
							</li>
							<li>
								<button type="submit" class="btn cl1 btn-salvar">Salvar</button>
							</li>
						</ul>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp" />
	<script>
	function consultarPlaca(obj){
		$('input[name="nome"]').val("...");
	  	$('input[name="ano"]').val("");
		$.ajax({
			  url: "http://erp.size.inf.br/services/consultar_placa/"+$(obj).val()
			}).done(function(data) {
				var ret = jQuery.parseJSON(data);
				console.log(ret);
			  	$('input[name="placa"]').val($(obj).val().toUpperCase());
			  	$('input[name="nome"]').val(ret.modelo.replace("I/",""));
			  	$('input[name="ano"]').val(ret.ano);
			  	if(ret.situacao == "Roubo/Furto"){
			  		alert("Ve�culo roubado!");
			  	}
			}).fail(function(){
				$('input[name="nome"]').val("");
			  	$('input[name="ano"]').val("");
				alert("Ve�culo n�o encontrado!");
			});
	}
	</script>
</body>
</html>
