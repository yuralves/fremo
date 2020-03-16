package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class TipoProvaData {

  public void incluir(TipoProvaDO tipoProva, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into TipoProva (NOME_DA_PROVA, DISTANCIA, CATEGORIA, CATEGORIA2, QUANTIDADE_DE_PARTICIPANTES) values (?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, tipoProva.getNome_Da_Prova());
     ps.setString(2, tipoProva.getDistancia());
     ps.setString(3, tipoProva.getCategoria());
     ps.setString(4, tipoProva.getCategoria2());
     ps.setInt(5, tipoProva.getQuantidade_De_Participantes());
     int result = ps.executeUpdate();
  }

  public void atualizar(TipoProvaDO tipoProva, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update TipoProva set NOME_DA_PROVA=?, DISTANCIA=?, CATEGORIA=?, CATEGORIA2=?, QUANTIDADE_DE_PARTICIPANTES=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, tipoProva.getNome_Da_Prova());
     ps.setString(2, tipoProva.getDistancia());
     ps.setString(3, tipoProva.getCategoria());
     ps.setString(4, tipoProva.getCategoria2());
     ps.setInt(5, tipoProva.getQuantidade_De_Participantes());
	 ps.setInt(6, tipoProva.getId());
     int result = ps.executeUpdate();
  } // atualizar

  public TipoProvaDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from TipoProva where  ID_TIPOPROVA=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     TipoProvaDO tipoProva = new TipoProvaDO();
     tipoProva.setId (rs.getInt("ID_TIPOPROVA"));
     tipoProva.setNome_Da_Prova (rs.getString("NOME_DA_PROVA"));
     tipoProva.setDistancia(rs.getString("DISTANCIA"));
     tipoProva.setCategoria(rs.getString("CATEGORIA"));
     tipoProva.setCategoria2(rs.getString("CATEGORIA2"));
     tipoProva.setQuantidade_De_Participantes(rs.getInt("QUANTIDADE_DE_PARTICIPANTES"));
     return tipoProva;
  } // buscar

  public Vector pesquisarPorCategoria(String cat, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from TipoProva where CATEGORIA like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, cat);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector provas = new Vector();
     while (rs.next()) {
        TipoProvaDO tipoProva = new TipoProvaDO();
        tipoProva.setId (rs.getInt("ID_TIPOPROVA"));
        tipoProva.setNome_Da_Prova (rs.getString("NOME_DA_PROVA"));
        tipoProva.setDistancia(rs.getString("DISTANCIA"));
        tipoProva.setCategoria(rs.getString("CATEGORIA"));
        tipoProva.setCategoria2(rs.getString("CATEGORIA2"));
        tipoProva.setQuantidade_De_Participantes(rs.getInt("QUANTIDADE_DE_PARTICIPANTES"));
        provas.add(tipoProva);
     }
     return provas;
  } // pesquisarPorNome

  public Vector pesquisarPorCategoria2(String cat2, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from TipoProva where CATEGORIA2 like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, cat2);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector provas = new Vector();
     while (rs.next()) {
        TipoProvaDO tipoProva = new TipoProvaDO();
        tipoProva.setId (rs.getInt("ID_TIPOPROVA"));
        tipoProva.setNome_Da_Prova (rs.getString("NOME_DA_PROVA"));
        tipoProva.setDistancia(rs.getString("DISTANCIA"));
        tipoProva.setCategoria(rs.getString("CATEGORIA"));
        tipoProva.setCategoria2(rs.getString("CATEGORIA2"));
        tipoProva.setQuantidade_De_Participantes(rs.getInt("QUANTIDADE_DE_PARTICIPANTES"));
        provas.add(tipoProva);
     }
     return provas;
  } // pesquisarPorNome
  
  public Vector todas_provas(Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from TipoProva";
     PreparedStatement ps = con.prepareStatement(sql);
     ResultSet rs = ps.executeQuery();
     Vector provas = new Vector();
     while (rs.next()) {
        TipoProvaDO tipoProva = new TipoProvaDO();
        tipoProva.setId (rs.getInt("ID_TIPOPROVA"));
        tipoProva.setNome_Da_Prova (rs.getString("NOME_DA_PROVA"));
        tipoProva.setDistancia(rs.getString("DISTANCIA"));
        tipoProva.setCategoria(rs.getString("CATEGORIA"));
        tipoProva.setCategoria2(rs.getString("CATEGORIA2"));
        tipoProva.setQuantidade_De_Participantes(rs.getInt("QUANTIDADE_DE_PARTICIPANTES"));
        provas.add(tipoProva);
     }
     return provas;
  } // buscar
  
} // ContatoData
