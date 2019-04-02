package model;

public class VeiculoImagem {

	private Integer id;
	private Integer veiculoId;
	private String caminho;

	public VeiculoImagem(Integer id, Integer veiculoId, String caminho) {
		super();
		this.id = id;
		this.veiculoId = veiculoId;
		this.caminho = caminho;
	}

	public VeiculoImagem(Integer veiculoId, String caminho) {
		super();
		this.veiculoId = veiculoId;
		this.caminho = caminho;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getVeiculoId() {
		return veiculoId;
	}

	public void setVeiculoId(Integer veiculoId) {
		this.veiculoId = veiculoId;
	}

	public String getCaminho() {
		return caminho;
	}

	public void setCaminho(String caminho) {
		this.caminho = caminho;
	}

}
