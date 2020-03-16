package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class FederacaoData {

  public void incluir(FederacaoDO federacao, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Federacao values (?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, federacao.getIdFEDERACAO());
     ps.setString(2, federacao.getNomeFEDERACAO());
     ps.setString(3, federacao.getEnderecoFederacao());
     ps.setString(4, federacao.getSiteFederacao());
     ps.setString(5, federacao.getImgUrl());
     int result = ps.executeUpdate();
  }

  public void atualizar(FederacaoDO federacao, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update FEDERACAO set NOME_FEDERACAO=?, ENDERECO_FEDERACAO=?, SITE_FEDERACAO=?, IMG_URL_FEDERACAO=? where Usuario_ID_User=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, federacao.getNomeFEDERACAO());
     ps.setString(2, federacao.getEnderecoFederacao());
     ps.setString(3, federacao.getSiteFederacao());
     ps.setString(4, federacao.getImgUrl());
     ps.setInt(5, federacao.getIdFEDERACAO());
     int result = ps.executeUpdate();
  } // atualizar

  public FederacaoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from FEDERACAO where  Usuario_ID_User=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     FederacaoDO federacao = new FederacaoDO();
     federacao.setIdFEDERACAO (rs.getInt("Usuario_ID_User"));
     federacao.setNomeFEDERACAO (rs.getString("NOME_FEDERACAO"));
     federacao.setEnderecoFederacao(rs.getString("ENDERECO_FEDERACAO"));
     federacao.setSiteFederacao(rs.getString("SITE_FEDERACAO"));
     federacao.setImgUrl(rs.getString("IMG_URL_FEDERACAO"));
     return federacao;
  } // buscar

} // ContatoData