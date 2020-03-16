package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class MensalidadeAtletasData {

  public void incluir(MensalidadeAtletasDO mensalidadeatletas, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into MensalidadeAtletas (Atleta_Usuario_ID_User, Ano, Mes) values (?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, mensalidadeatletas.getId_ATLETA());
     ps.setInt(2, mensalidadeatletas.getAno());
     ps.setString(3, mensalidadeatletas.getMes());
     int result = ps.executeUpdate();
  }

  public void atualizar(MensalidadeAtletasDO mensalidadeatletas, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update MensalidadeAtletas set Ano=?, Mes=? where id_ATLETA=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, mensalidadeatletas.getAno());
     ps.setString(2, mensalidadeatletas.getMes());
	 ps.setInt(3, mensalidadeatletas.getId_ATLETA());
     int result = ps.executeUpdate();
  } // atualizar

  public MensalidadeAtletasDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from MensalidadeAtletas where  id_ATLETA=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     MensalidadeAtletasDO mensalidadeatletas = new MensalidadeAtletasDO();
     mensalidadeatletas.setId_ATLETA (rs.getInt("id_ATLETA"));
     mensalidadeatletas.setAno (rs.getInt("Ano"));
     mensalidadeatletas.setMes(rs.getString("Mes"));
     return mensalidadeatletas;
  } // buscar


} // MensalidadeAtletasData