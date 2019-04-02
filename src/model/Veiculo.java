package model;

public class Veiculo {

	private Integer id;
	private Integer usuarioId;
	private String nome;
	private String placa;
	private Integer tipo;
	private Integer quilometragem;
	private Integer ano;
	private Double valor;
	private String observacoes;
	private Integer situacao;
	private Integer combustivel;

	public Veiculo() {
		super();
	}

	public Veiculo(Integer id, Integer usuarioId, String nome, String placa, Integer tipo, Integer quilometragem,
			Integer ano, Double valor, String observacoes, Integer situacao) {
		super();
		this.id = id;
		this.usuarioId = usuarioId;
		this.nome = nome;
		this.placa = placa;
		this.tipo = tipo;
		this.quilometragem = quilometragem;
		this.ano = ano;
		this.valor = valor;
		this.observacoes = observacoes;
		this.situacao = situacao;
	}

	public Veiculo(Integer usuarioId, String nome, String placa, Integer tipo, Integer quilometragem, Integer ano,
			Double valor, String observacoes, Integer situacao) {
		super();
		this.usuarioId = usuarioId;
		this.nome = nome;
		this.placa = placa;
		this.tipo = tipo;
		this.quilometragem = quilometragem;
		this.ano = ano;
		this.valor = valor;
		this.observacoes = observacoes;
		this.situacao = situacao;

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUsuarioId() {
		return usuarioId;
	}

	public void setUsuarioId(Integer usuarioId) {
		this.usuarioId = usuarioId;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public Integer getTipo() {
		return tipo;
	}

	public Integer getCombustivel() {
		return combustivel;
	}

	public void setTipo(Integer tipo) {
		this.tipo = tipo;
	}

	public Integer getQuilometragem() {
		return quilometragem;
	}

	public void setQuilometragem(Integer quilometragem) {
		this.quilometragem = quilometragem;
	}

	public Integer getAno() {
		return ano;
	}

	public void setAno(Integer ano) {
		this.ano = ano;
	}

	public String getObservacoes() {
		return observacoes;
	}

	public String getObservacoesHtml() {
		return observacoes.replace("\n", "<br />");
	}

	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public Integer getSituacao() {
		return situacao;
	}

	public void setSituacao(Integer situacao) {
		this.situacao = situacao;
	}

	public String getLinkEdicao() {
		return "editar-anuncio.jsp?id=" + this.id;
	}

	public String getLinkVisualizacao() {
		return "visualizar-anuncio.jsp?id=" + this.id;
	}

	public String getObservacoesAbrev() {
		if (this.observacoes.length() > 200) {
			return this.observacoes.substring(0, 200).trim() + "...";
		} else {
			return this.observacoes;
		}
	}

}
