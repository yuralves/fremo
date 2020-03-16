package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;
import java.util.Date;

public class AtletaData {

  public void incluir(AtletaDO atleta, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Atleta (Usuario_ID_User, ID_CLUBE, ID_TECNICO, NOME_ATLETA, SOBRENOME_ATLETA, RG_ATLETA, CPF_ATLETA, DATA_NASCIMENTO_ATLETA, MENSALIDADE_ATLETA) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, atleta.getID_ATLETA());
     ps.setInt(2, atleta.getID_CLUBE());
     ps.setInt(3, atleta.getID_TECNICO());
     ps.setString(4, atleta.getNOME_ATLETA());
     ps.setString(5, atleta.getSOBRENOME_ATLETA());
     ps.setString(6, atleta.getRg_ATLETA());
     ps.setString(7, atleta.getCpf_ATLETA());
     ps.setDate(8, java.sql.Date.valueOf(atleta.getData_nascimento_ATLETA()));
     ps.setInt(9, atleta.getMensalidade_ATLETA());
     int result = ps.executeUpdate();
  }

  public void atualizar(AtletaDO atleta, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Atleta set ID_CLUBE=?, ID_TECNICO=?, NOME_ATLETA=?, SOBRENOME_ATLETA=?, RG_ATLETA=?, CPF_ATLETA=?, DATA_NASCIMENTO_ATLETA=?, MENSALIDADE_ATLETA=? where Usuario_ID_User =?";
     PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, atleta.getID_CLUBE());
	ps.setInt(2, atleta.getID_TECNICO());
	ps.setString(3, atleta.getNOME_ATLETA());
	ps.setString(4, atleta.getSOBRENOME_ATLETA());
	ps.setString(5, atleta.getRg_ATLETA());
	ps.setString(6, atleta.getCpf_ATLETA());
        ps.setDate(7, java.sql.Date.valueOf(atleta.getData_nascimento_ATLETA()));;
        ps.setInt(8, atleta.getMensalidade_ATLETA());
	ps.setInt(9, atleta.getID_ATLETA());
     int result = ps.executeUpdate();
  } // atualizar
  
  public void atualizar_mensalidade(int idATLETA, int mensalidade, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Atleta set MENSALIDADE_ATLETA=? where Usuario_ID_User=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, mensalidade);
     ps.setInt(2, idATLETA);
     int result = ps.executeUpdate();
  } // atualizar mensalidade

  public Vector buscarPorId_Tecnico(int Id_TECNICO, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Atleta where Id_TECNICO like ?";
     PreparedStatement ps = con.prepareStatement(sql);

     ps.setInt(1, Id_TECNICO);
     ResultSet rs = ps.executeQuery();

     Vector atleta = new Vector();
     while (rs.next()) {
        AtletaDO c = new AtletaDO();
        c.setID_ATLETA (rs.getInt("Usuario_ID_User"));
        c.setID_CLUBE (rs.getInt("ID_CLUBE"));
        c.setID_TECNICO (rs.getInt("ID_TECNICO"));
        c.setNOME_ATLETA (rs.getString("NOME_ATLETA"));
        c.setSOBRENOME_ATLETA (rs.getString("SOBRENOME_ATLETA"));
        c.setRg_ATLETA (rs.getString("RG_ATLETA"));
        c.setCpf_ATLETA (rs.getString("CPF_ATLETA"));
        c.setData_nascimento_ATLETA (rs.getString("DATA_NASCIMENTO_ATLETA"));
        c.setMensalidade_ATLETA (rs.getInt("MENSALIDADE_ATLETA"));
        atleta.add(c);
     }
     return atleta;
  } // pesquisarPorId_Tecnico

  public Vector buscarPorId_Clube(int Id_CLUBE, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Atleta where ID_CLUBE like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, Id_CLUBE);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector atleta = new Vector();
     while (rs.next()) {
        AtletaDO c = new AtletaDO();
        c.setID_ATLETA (rs.getInt("Usuario_ID_User"));
        c.setID_CLUBE (rs.getInt("ID_CLUBE"));
        c.setID_TECNICO (rs.getInt("ID_TECNICO"));
        c.setNOME_ATLETA (rs.getString("NOME_ATLETA"));
        c.setSOBRENOME_ATLETA (rs.getString("SOBRENOME_ATLETA"));
        c.setRg_ATLETA (rs.getString("RG_ATLETA"));
        c.setCpf_ATLETA (rs.getString("CPF_ATLETA"));
        c.setData_nascimento_ATLETA (rs.getString("DATA_NASCIMENTO_ATLETA"));
        c.setMensalidade_ATLETA (rs.getInt("MENSALIDADE_ATLETA"));
        atleta.add(c);
     }
     return atleta;
  } // pesquisarPorId_Clube

  public AtletaDO buscarPorId_atleta(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Atleta where Usuario_ID_User=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     AtletaDO atl = new AtletaDO();
     atl.setID_ATLETA (rs.getInt("Usuario_ID_User"));
     atl.setID_CLUBE (rs.getInt("ID_CLUBE"));
     atl.setID_TECNICO (rs.getInt("ID_TECNICO"));
     atl.setNOME_ATLETA (rs.getString("NOME_ATLETA"));
     atl.setSOBRENOME_ATLETA (rs.getString("SOBRENOME_ATLETA"));
     atl.setRg_ATLETA (rs.getString("RG_ATLETA"));
     atl.setCpf_ATLETA (rs.getString("CPF_ATLETA"));
     atl.setData_nascimento_ATLETA (rs.getString("DATA_NASCIMENTO_ATLETA"));
     atl.setMensalidade_ATLETA (rs.getInt("MENSALIDADE_ATLETA"));
     return atl;
  }
  
  public Vector pesquisarAtletas(int id_clube, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Atleta where ID_CLUBE = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, id_clube);
     ResultSet rs = ps.executeQuery();
     Vector atletas = new Vector();
     while (rs.next()) {
        AtletaDO a = new AtletaDO();
        a.setID_ATLETA (rs.getInt("Usuario_ID_User"));
        a.setID_CLUBE(rs.getInt("ID_CLUBE"));
        a.setID_TECNICO(rs.getInt("ID_TECNICO"));
        a.setNOME_ATLETA(rs.getString("NOME_ATLETA"));
        a.setSOBRENOME_ATLETA(rs.getString("SOBRENOME_ATLETA"));
        a.setRg_ATLETA(rs.getString("RG_ATLETA"));
        a.setCpf_ATLETA(rs.getString("CPF_ATLETA"));
        a.setData_nascimento_ATLETA("DATA_NASCIMENTO_ATLETA");
        a.setMensalidade_ATLETA(rs.getInt("MENSALIDADE_ATLETA"));
        //System.out.println(" got " + c.getNome());
        atletas.add(a);
     }
     return atletas;
  } // pesquisarAtletas
  
  public void atualizar_clube(int ID_ATLETA, int ID_CLUBE, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Atleta set ID_CLUBE=? where Usuario_ID_User =?";
     PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, ID_CLUBE);
	ps.setInt(2, ID_ATLETA);
     int result = ps.executeUpdate();
  }
  
  public Vector buscarPorNome(String NOME, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Atleta where NOME_ATLETA =?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, NOME);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector atleta = new Vector();
     while (rs.next()) {
        AtletaDO c = new AtletaDO();
        c.setID_ATLETA (rs.getInt("Usuario_ID_User"));
        c.setID_CLUBE (rs.getInt("ID_CLUBE"));
        c.setID_TECNICO (rs.getInt("ID_TECNICO"));
        c.setNOME_ATLETA (rs.getString("NOME_ATLETA"));
        c.setSOBRENOME_ATLETA (rs.getString("SOBRENOME_ATLETA"));
        c.setRg_ATLETA (rs.getString("RG_ATLETA"));
        c.setCpf_ATLETA (rs.getString("CPF_ATLETA"));
        c.setData_nascimento_ATLETA (rs.getString("DATA_NASCIMENTO_ATLETA"));
        c.setMensalidade_ATLETA (rs.getInt("MENSALIDADE_ATLETA"));
        atleta.add(c);
     }
     return atleta;
  }
  
       public Vector Atletas(Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Atleta";
     PreparedStatement ps = con.prepareStatement(sql);
     ResultSet rs = ps.executeQuery();
     Vector results = new Vector();
     while (rs.next()) {
        AtletaDO e = new AtletaDO();
        e.setID_ATLETA (rs.getInt("Usuario_ID_User"));
        e.setNOME_ATLETA (rs.getString("NOME_ATLETA"));
        e.setSOBRENOME_ATLETA (rs.getString("SOBRENOME_ATLETA"));
        results.add(e);
     }
     return results;
  } // Treinos
  
} // AtletaData