<%
	String uri = request.getRequestURI();
	String pageName = uri.substring(uri.lastIndexOf("/")+1);
	
%>
<nav class="navbar navbar-expand-lg navbar-dark cl1 fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/Carangos">Carangos</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        <%
        if (session.getAttribute("user") == null || session.getAttribute("user_id")==null) {%>
          <li class="nav-item <% out.print(pageName.equalsIgnoreCase("cadastro.jsp") ? "active" : "");%>">
            <a class="nav-link" href="cadastrarUsuario.jsp">Cadastrar-se
            </a>
          </li>
          <li class="nav-item <% out.print(pageName.equalsIgnoreCase("login.jsp") ? "active" : "");%>">
            <a class="nav-link" href="login.jsp">Login</a>
          </li>
        <%}else{ %>
          <li class="nav-item <% out.print(pageName.equalsIgnoreCase("meus-anuncios.jsp") || pageName.equalsIgnoreCase("editar-anuncio.jsp") ? "active" : "");%>">
            <a class="nav-link" href="meus-anuncios.jsp">Meus Anúncios</a>
          </li>
          <li class="nav-item <% out.print(pageName.equalsIgnoreCase("meus-anuncios.jsp") || pageName.equalsIgnoreCase("editar-anuncio.jsp") ? "active" : "");%>">
            <a class="nav-link" href="logout.jsp">Logout</a>
          </li>
        <%} %>
        </ul>
      </div>
    </div>
  </nav>