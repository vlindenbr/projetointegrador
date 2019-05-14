import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Collection;

import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;

import controller.VeiculoController;
import helper.Utils;
import model.Veiculo;
import model.VeiculoImagem;

@WebServlet("/anuncio")
@MultipartConfig
public class Anuncio extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Anuncio() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/* Obtem o caminho relatorio da pasta img */
		String path = request.getServletContext().getRealPath("img") + File.separator;

		File files = new File(path);
		response.setContentType("image/jpeg");

		/*
		 * Mostra o arquivo que está na pasta img onde foi realizado o upload
		 */
		for (String file : files.list()) {
			File f = new File(path + file);
			BufferedImage bi = ImageIO.read(f);
			OutputStream out = response.getOutputStream();
			ImageIO.write(bi, "jpg", out);
			out.close();
		}

		// doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer usuarioId = Integer.parseInt(request.getParameter("usuario_id"));
		String sId = request.getParameter("id");
		String nome = request.getParameter("nome");
		String placa = request.getParameter("placa");
		String tipo = request.getParameter("tipo");
		String quilometragem = request.getParameter("quilometragem");
		String ano = request.getParameter("ano");
		String valor = request.getParameter("valor");
		String observacoes = request.getParameter("observacoes");
		Integer situacao = 1;

		System.out.println("x");
		System.out.println(usuarioId);
		
		Integer id = null;

		if (nome != null && placa != null && tipo != null && quilometragem != null && ano != null && observacoes != null
				&& valor != null) {
			Veiculo veiculo = new Veiculo(usuarioId, nome, placa, Integer.parseInt(tipo),
					Integer.parseInt(quilometragem), Integer.parseInt(ano),
					Double.parseDouble(valor.replace(".", "").replace(",", ".")), observacoes, situacao);

			if (sId == null || sId.isEmpty() || sId.equalsIgnoreCase("null") || sId.equalsIgnoreCase("novo")) {
				try {
					id = VeiculoController.cadastrar(veiculo);
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
			} else {
				try {
					id = Integer.parseInt(sId);
					VeiculoController.updateById(veiculo, id);
				} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
			}
		}

		Part prt = null;

		Collection<Part> parts = request.getParts();
		Iterator<Part> itr = parts.iterator();
		while (itr.hasNext()) {
			prt = itr.next();

			if (prt.getName().equals("imagem")) {

				String fileName = Paths.get(prt.getSubmittedFileName()).getFileName().toString();
				InputStream fileContent = prt.getInputStream();

				if (fileName != null && !fileName.isEmpty()) {

					String diretorio = "C:\\Workspace\\Carangos\\WebContent\\assets\\img" + File.separator + id
							+ File.separator;
					Utils.createDir(diretorio);

					String caminho = diretorio + fileName;
					File file = new File(caminho);
					OutputStream outputStream = new FileOutputStream(file);
					IOUtils.copy(fileContent, outputStream);
					outputStream.close();

					VeiculoImagem ci = new VeiculoImagem(id, caminho);

					try {
						VeiculoController.cadastrarImagem(ci);
					} catch (Exception e) {
						e.printStackTrace();
					}

				}

			}
		}
		response.sendRedirect("meus-anuncios.jsp");
	}

}