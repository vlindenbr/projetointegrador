<%@page import="helper.Formater" %>
<div class="col-lg-4 col-md-6 mb-4">
  <div class="card h-100">
    <a href="<% out.print(request.getParameter("link"));%>"><img class="card-img-top" src="veiculo?id=<% out.print(request.getParameter("id"));%>" alt=""></a>
    <div class="card-body">
      <h4 class="card-title">
        <a href="<% out.print(request.getParameter("link"));%>"><% out.print(request.getParameter("nome"));%></a>
      </h4>
      <h5>R$ <% out.print( Formater.valor(Double.valueOf(request.getParameter("valor"))));%></h5>
      <p class="card-text"><% out.print(request.getParameter("observacoes"));%></p>
    </div>
  </div>
</div>