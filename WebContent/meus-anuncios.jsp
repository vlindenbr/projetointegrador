<!DOCTYPE html>
<html lang="en">
<jsp:include page="includes/head.jsp" />
<body>
  <jsp:include page="includes/menu.jsp" />
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
  		<div class="breadcrumb">
		  <h3>Meus Anúncios</h3>
		  <a href="editar-anuncio.jsp?id=novo" class="btn cl1 btn-adicionar" role="button" aria-pressed="true">Adicionar</a>
		</div>
        <div class="row">

          <% for(int i = 0; i < 12; i+=1) { %>
		    <jsp:include page="anuncio/item.jsp" /> 
		   <% } %>

        </div>
      </div>
    </div>
  </div>
<jsp:include page="includes/footer.jsp" />
</body>
</html>
