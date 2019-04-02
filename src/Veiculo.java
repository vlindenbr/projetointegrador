import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.VeiculoController;

@WebServlet("/veiculo")
@MultipartConfig
public class Veiculo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Veiculo() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sId = request.getParameter("id");

		if (sId != null) {
			try {
				String imagem = VeiculoController.getImagemByVeiculoId(Integer.parseInt(sId));

				if (imagem == null) {
					imagem = "C:\\Workspace\\Carangos\\WebContent\\assets\\img\\" + sId + File.separator
							+ "700x400.png";
				}

				// File file = new File(imagem);

				Path path = Paths.get(imagem);
				byte[] imageData = Files.readAllBytes(path);

				response.setContentType("image/jpeg");
				response.getOutputStream().write(imageData);

			} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}