<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
  <ol class="carousel-indicators">
   <% for(int i = 0; i < 3; i+=1) { %>
    <li data-target="#carouselExampleIndicators" data-slide-to="<%=i%>" class="active"></li>
   <% } %>
  </ol>
  <div class="carousel-inner" role="listbox">
   <% for(int i = 0; i < 3; i+=1) { %>
    <div class="carousel-item <%=i == 0 ? "active" : ""%>">
      <img class="d-block img-fluid" src="https://picsum.photos/1150/350?random" alt="First slide">
    </div>
   <% } %>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>