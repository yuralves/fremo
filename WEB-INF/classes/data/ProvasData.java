package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class ProvasData {

  public void incluir(ProvasDO prova, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Provas (Evento_ID_EVENTO, ID_TIPOPROVA) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, prova.getId_Evento());
     ps.setInt(2, prova.getId_Tipo_De_Prova());
     int result = ps.executeUpdate();
  } //incluir

  public void excluir(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from Provas where ID_PROVA=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     int result = ps.executeUpdate();
  } // excluir

  public void atualizar(ProvasDO prova, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Provas set ID_EVENTO=?, ID_TIPO_DE_PROVA=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, prova.getId_Evento());
     ps.setInt(2, prova.getId_Tipo_De_Prova());
	 ps.setInt(3, prova.getId());
     int result = ps.executeUpdate();
  } // atualizar

  public ProvasDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Provas where  ID_PROVA=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ProvasDO prova = new ProvasDO();
     prova.setId (rs.getInt("ID_PROVA"));
     prova.setId_Evento (rs.getInt("Evento_ID_EVENTO"));
     prova.setId_Tipo_De_Prova(rs.getInt("ID_TIPOPROVA"));
     return prova;
  } // buscar
  
    public Vector buscarPorID_Evento(int id_evento, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Provas where Evento_ID_Evento = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, id_evento);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector provas = new Vector();
     while (rs.next()) {
        ProvasDO p = new ProvasDO();
        p.setId(rs.getInt("ID_Prova"));
        p.setId_Evento(rs.getInt("Evento_ID_Evento"));
        p.setId_Tipo_De_Prova(rs.getInt("ID_TIPOPROVA"));
        provas.add(p);
     }  
     return provas;
     } // buscarPorID_Evento
    
    public ProvasDO buscarPorID_Evento_e_ID_Tipoprova(int id_evento, int id_tipoprova, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Provas where Evento_ID_EVENTO=? AND ID_TIPOPROVA=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, id_evento);
     ps.setInt(2, id_tipoprova);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ProvasDO prova = new ProvasDO();
     prova.setId (rs.getInt("ID_PROVA"));
     prova.setId_Evento (rs.getInt("Evento_ID_EVENTO"));
     prova.setId_Tipo_De_Prova(rs.getInt("ID_TIPOPROVA"));
     return prova;
  } // buscar
  
    public Vector buscarPorID_TipoProva(int id_tipo_prova, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Provas where ID_TIPOPROVA = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, id_tipo_prova);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector provas = new Vector();
     while (rs.next()) {
        ProvasDO p = new ProvasDO();
        p.setId(rs.getInt("ID_Prova"));
        p.setId_Evento(rs.getInt("Evento_ID_Evento"));
        p.setId_Tipo_De_Prova(rs.getInt("ID_TIPOPROVA"));
        provas.add(p);
     }  
     return provas;
     } // buscarPorID_TipoProva
     
} // ProvasData