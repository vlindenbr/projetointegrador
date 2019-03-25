package SGBD;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class PoolDeConexoes {
	
	private static PoolDeConexoes meuPool;
	
	private ArrayList<Conexao> listaConexoes;
	
	private PoolDeConexoes() {
		listaConexoes = new ArrayList<Conexao>();
	}

	public static PoolDeConexoes getInstance() {
		if( meuPool == null ) {
			meuPool =  new PoolDeConexoes();
		}
		
		return meuPool;
	}
	
	public synchronized Conexao getConexao() throws SQLException, IOException {
		for(Conexao cnx : listaConexoes) {
			if(cnx.isLivre()) {
				return cnx;
			}
		}
		Conexao cnx = new Conexao();
		listaConexoes.add(cnx);
		return cnx;
		
	}
}