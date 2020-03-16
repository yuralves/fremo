package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class TipoExercicioData {

  public void incluir(TipoExercicioDO tipoexercicio, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into TipoExercicio (NOME_EXERCICIO) values (?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, tipoexercicio.getNomeExercicio());
     int result = ps.executeUpdate();
  }

  public void atualizar(TipoExercicioDO tipoexercicio, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update TipoExercicio set nome=? where ID_TIPO_EXERCICIO=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, tipoexercicio.getNomeExercicio());
	 ps.setInt(2, tipoexercicio.getIdTipoExercicio());
     int result = ps.executeUpdate();
     
  } // atualizar

  public TipoExercicioDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from TipoExercicio where  ID_TIPO_EXERCICIO=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     TipoExercicioDO tipoexerc = new TipoExercicioDO();
     tipoexerc.setIdTipoExercicio (rs.getInt("ID_TIPO_EXERCICIO"));
     tipoexerc.setNomeExercicio (rs.getString("NOME_EXERCICIO"));
     return tipoexerc;
  } // buscar

  public Vector pesquisarPorNome(String nome, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from TipoExercicio where nome like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nome);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector results = new Vector();
     while (rs.next()) {
        TipoExercicioDO e = new TipoExercicioDO();
        e.setIdTipoExercicio (rs.getInt("ID_TIPO_EXERCICIO"));
        e.setNomeExercicio (rs.getString("NOME_EXERCICIO"));
        System.out.println(" got " + e.getNomeExercicio());
        results.add(e);
     }
     return results;
  } // pesquisarPorNome
  
  public Vector Exercicios(Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from TipoExercicio";
     PreparedStatement ps = con.prepareStatement(sql);
     ResultSet rs = ps.executeQuery();
     Vector results = new Vector();
     while (rs.next()) {
        TipoExercicioDO e = new TipoExercicioDO();
        e.setIdTipoExercicio (rs.getInt("id_TIPO_EXERCICIO"));
        e.setNomeExercicio (rs.getString("NOME_EXERCICIO"));
        results.add(e);
     }
     return results;
  } // pesquisarPorNome

} // TipoExercicioData