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
  				<h3 class="my-4">Login</h3>
			</div>
			<form action="" >
				<div class="form-group" style="padding-bottom: 24px;">
					<label for="exampleInputEmail1">Usuario</label>
					<input type="text" class="form-control" name="email" placeholder="Usuario">
					<br>
					<label for="exampleInputEmail1">Senha</label>
					<input type="password" class="form-control" name="senha" placeholder="Senha">
					 <br><span class="input-group-btn">
						<button class="btn cl1">Submit</button>
						<button class="btn cl1" name="consultar" type="submit">Consultar</button>
					</span>
				</div>
				<%
				
				
				Conexao conexao = new Conexao();
				conexao.conecta();
				
		    	if(request.getParameter("consultar") != null){
		    		String email = request.getParameter("email");
		    		String senha = request.getParameter("senha");
		    		
		    		Usuario u1 = DAOUsuario.consultar(conexao, email,senha);
		    		if(u1 != null){
		    			  %>
			    		    <script>
			    		    	window.alert("Usuario e senha cadastrados");
			    		    </script>
			    		    <%
		    		}
		    		else{
		    			
		    			  %>
			    		    <script>
			    		    	window.alert("Usuario e senha nao conferem");
			    		    	window.location = "cadastrarUsuario.jsp";
			    		    </script>
			    		    <%
		    		}
		    		    		
	
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
