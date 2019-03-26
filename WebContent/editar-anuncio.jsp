<!DOCTYPE html>
<html lang="en">
<jsp:include page="includes/head.jsp" />
<body>
	<jsp:include page="includes/menu.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb">
					<h3>Meus Anúncios / Editar</h3>
				</div>
				<form>
						<ul>
							<li class="col-6">
							<input type="text" class="form-control" placeholder="Titulo">
							</li>
							<li class="col-6">
							<input type="text" class="form-control" placeholder="Descrição" aria-describedby="basic-addon1">
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
</body>
</html>
