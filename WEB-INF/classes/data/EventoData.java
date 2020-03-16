package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class EventoData {

  public void incluir(EventoDO evento, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Evento (NOME_DO_EVENTO,TipoEvento_ID_Tipo_EVENTO,Federacao_Usuario_ID_User,LOCALIZACAO,DATA_INICIO,DATA_TERMINO,PRECO_INSCRICAO,FLAG_INSCRICAO) values (?, ?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, evento.getNome_Do_Evento());
     ps.setInt(2, evento.getId_Tipo_Do_Evento());
     ps.setInt(3, evento.getId_Federacao());
     ps.setString(4, evento.getLocalizacao());
     ps.setString(5, evento.getData_Inicio());
     ps.setString(6, evento.getData_Termino());
     ps.setFloat(7, evento.getPreco_Inscricao());
     ps.setBoolean(8, evento.getFlag_Inscricao());
     int result = ps.executeUpdate();
  }

  public void excluir(EventoDO evento, Transacao tr) throws Exception {
     excluir(evento.getId(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from Evento where ID_EVENTO=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     int result = ps.executeUpdate();
  } // excluir

  public void atualizar(EventoDO evento, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Evento set Federacao_Usuario_ID_User=?, TipoEvento_ID_Tipo_EVENTO=?, NOME_DO_EVENTO=?, LOCALIZACAO=?, DATA_INICIO=?,DATA_TERMINO=?,PRECO_INSCRICAO=?, FLAG_INSCRICAO=? where id_evento=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, evento.getId_Federacao());
     ps.setInt(2, evento.getId_Tipo_Do_Evento());
     ps.setString(3, evento.getNome_Do_Evento());
     ps.setString(4, evento.getLocalizacao());
     ps.setString(5, evento.getData_Inicio());
     ps.setString(6, evento.getData_Termino());
     ps.setFloat(7, evento.getPreco_Inscricao());
     ps.setBoolean(8, evento.getFlag_Inscricao());
     ps.setInt(9, evento.getId());
     int result = ps.executeUpdate();
  } // atualizar

  public EventoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Evento where  ID_EVENTO=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     EventoDO evento = new EventoDO();
     evento.setId (rs.getInt("ID_EVENTO"));
     evento.setNome_Do_Evento (rs.getString("NOME_DO_EVENTO"));
     evento.setId_Tipo_Do_Evento (rs.getInt("TipoEvento_ID_Tipo_EVENTO"));
     evento.setId_Federacao (rs.getInt("Federacao_Usuario_ID_User"));
     evento.setLocalizacao(rs.getString("LOCALIZACAO"));
     evento.setData_Inicio(rs.getString("DATA_INICIO"));
     evento.setData_Termino(rs.getString("DATA_TERMINO"));
     evento.setpreco_Inscricao(rs.getFloat("PRECO_INSCRICAO"));
     evento.setFlag_Inscricao(rs.getBoolean("FLAG_INSCRICAO"));
     return evento;
  } // buscar

  public Vector pesquisarPorTipo(int id_tipo, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Evento where TipoEvento_ID_Tipo_EVENTO = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, id_tipo);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector eventos = new Vector();
     while (rs.next()) {
        EventoDO e = new EventoDO();
        e.setId (rs.getInt("ID_EVENTO"));
        e.setNome_Do_Evento (rs.getString("NOME_DO_EVENTO"));
        e.setId_Tipo_Do_Evento (rs.getInt("TipoEvento_ID_Tipo_EVENTO"));
        e.setId_Federacao (rs.getInt("Federacao_Usuario_ID_User"));
        e.setLocalizacao(rs.getString("LOCALIZACAO"));
        e.setData_Inicio(rs.getString("DATA_INICIO"));
        e.setData_Termino(rs.getString("DATA_TERMINO"));
        e.setpreco_Inscricao(rs.getFloat("PRECO_INSCRICAO"));
        e.setFlag_Inscricao(rs.getBoolean("FLAG_INSCRICAO"));
        eventos.add(e);
     }
     return eventos;
  } // pesquisarPorTipo

  public Vector pesquisarPorFederacao(int id_federacao, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Evento where Federacao_Usuario_ID_User = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, id_federacao);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector eventos = new Vector();
     while (rs.next()) {
        EventoDO e = new EventoDO();
        e.setId (rs.getInt("ID_EVENTO"));
        e.setNome_Do_Evento (rs.getString("NOME_DO_EVENTO"));
        e.setId_Tipo_Do_Evento (rs.getInt("TipoEvento_ID_Tipo_EVENTO"));
        e.setId_Federacao (rs.getInt("Federacao_Usuario_ID_User"));
        e.setLocalizacao(rs.getString("LOCALIZACAO"));
        e.setData_Inicio(rs.getString("DATA_INICIO"));
        e.setData_Termino(rs.getString("DATA_TERMINO"));
        e.setpreco_Inscricao(rs.getFloat("PRECO_INSCRICAO"));
        e.setFlag_Inscricao(rs.getBoolean("FLAG_INSCRICAO"));
        eventos.add(e);
     }
     return eventos;
  } // pesquisarPorTipo
  
  public EventoDO pesquisarPorNomeEvento(String nome_evento, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Evento where  NOME_DO_EVENTO=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nome_evento);
     ResultSet rs = ps.executeQuery();
     rs.next();
     EventoDO evento = new EventoDO();
     evento.setId (rs.getInt("ID_EVENTO"));
     evento.setNome_Do_Evento (rs.getString("NOME_DO_EVENTO"));
     evento.setId_Tipo_Do_Evento (rs.getInt("TipoEvento_ID_Tipo_EVENTO"));
     evento.setId_Federacao (rs.getInt("Federacao_Usuario_ID_User"));
     evento.setLocalizacao(rs.getString("LOCALIZACAO"));
     evento.setData_Inicio(rs.getString("DATA_INICIO"));
     evento.setData_Termino(rs.getString("DATA_TERMINO"));
     evento.setpreco_Inscricao(rs.getFloat("PRECO_INSCRICAO"));
     evento.setFlag_Inscricao(rs.getBoolean("FLAG_INSCRICAO"));
     return evento;
  } // buscar
  
    public Vector buscarTodosEventos(Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Evento";
     PreparedStatement ps = con.prepareStatement(sql);
     ResultSet rs = ps.executeQuery();
     Vector Evento = new Vector();
     while (rs.next()) {
        EventoDO evento = new EventoDO();
        evento.setId (rs.getInt("ID_EVENTO"));
        evento.setNome_Do_Evento (rs.getString("NOME_DO_EVENTO"));
        evento.setId_Tipo_Do_Evento (rs.getInt("TipoEvento_ID_Tipo_EVENTO"));
        evento.setId_Federacao (rs.getInt("Federacao_Usuario_ID_User"));
        evento.setLocalizacao(rs.getString("LOCALIZACAO"));
        evento.setData_Inicio(rs.getString("DATA_INICIO"));
        evento.setData_Termino(rs.getString("DATA_TERMINO"));
        evento.setpreco_Inscricao(rs.getFloat("PRECO_INSCRICAO"));
        evento.setFlag_Inscricao(rs.getBoolean("FLAG_INSCRICAO"));
        Evento.add(evento);
     }
     return Evento;
  } // buscar
    
  public Vector pesquisarPorData(String data, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "SELECT NOME_DO_EVENTO FROM EVENTO WHERE ? between DATA_INICIO and DATA_TERMINO";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, data);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector eventos = new Vector();
     while (rs.next()) {
        EventoDO e = new EventoDO();
        e.setNome_Do_Evento (rs.getString("NOME_DO_EVENTO"));
        eventos.add(e);
     }
     return eventos;
  }

} // EventoData
