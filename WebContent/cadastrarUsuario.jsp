<%@page import="java.util.ArrayList"%>

<%@page import="controller.VeiculoController"%>
<%@page import="model.Usuario"%>
<%@page import="model.Veiculo"%>
<%@page import="lib.Conexao"%>
<%@page import="dao.DAOUsuario"%>
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
  				<h3 class="my-4">Cadastrar Usuario</h3>
			</div>
			<form action="" >
				<div class="form-group" style="padding-bottom: 24px;">
					<label for="exampleInputEmail1">E-mail</label>
					<input type="text" class="form-control" name="email" placeholder="E-mail">
					<br>
					<label for="exampleInputEmail1">Nome completo</label>
					<input type="text" class="form-control" name="nomeCompleto" placeholder="Nome completo">
					<br>
					<label for="exampleInputEmail1">Telefone</label>
					<input type="text" class="form-control" name="telefone" placeholder="Telefone">
					<br>
					<label for="exampleInputEmail1">Cidade</label>
					<input type="text" class="form-control" name="cidade" placeholder="Cidade">
					<br>
					<label for="exampleInputEmail1">Senha</label>
					<input type="password" class="form-control" name="senha" placeholder="Senha">
					 <br><span class="input-group-btn">
						<button class="btn cl1" name="submit" type="submit">Cadastrar</button>
					</span>
				</div>
				<%
				
				Conexao conexao = new Conexao();
				conexao.conecta();
				
		    	if(request.getParameter("submit") != null){
		    		String email = request.getParameter("email");
		    		String senha = request.getParameter("senha");
		    		String telefone = request.getParameter("telefone");
		    		String cidade = request.getParameter("cidade");
		    		String nome = request.getParameter("nomeCompleto");
		    		//Usuario userFinal = DAOUsuario.cadastrar(conexao, usuario);
		    		
		    		Usuario usuario = new Usuario(nome,email,senha,cidade,telefone);
		    		DAOUsuario.cadastrar(conexao, usuario);
		    	}
		    	
		    %> 
			</form>
		</div>
	</div>
    <div class="row">
      <div class="col-lg-12">
<!-- 
  		<jsp:include page="includes/carousel.jsp" />      
 -->

      </div>
    </div>
  </div>
<jsp:include page="includes/footer.jsp" />
</body>
</html>
