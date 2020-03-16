package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class TecnicoData {

  public void incluirTecnico(TecnicoDO tecnico, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Tecnico (Usuario_ID_USER, ID_CLUBE, NOME_TECNICO, SOBRENOME_TECNICO, RG_TECNICO, CPF_TECNICO, DATA_NASCIMENTO_TECNICO) values (?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, tecnico.getIdTecnico());
     ps.setInt(2, tecnico.getIdClube());
     ps.setString(3, tecnico.getNomeTecnico());
     ps.setString(4, tecnico.getSobrenomeTecnico());
     ps.setString(5, tecnico.getRgTecnico());
     ps.setString(6, tecnico.getCpfTecnico());
     ps.setDate(7, java.sql.Date.valueOf(tecnico.getDataNascimentoTecnico()));
     
     int result = ps.executeUpdate();
  }//incluir

  public void atualizarTecnico(TecnicoDO tecnico, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Tecnico set ID_CLUBE=?, NOME_TECNICO=?, SOBRENOME_TECNICO=?, RG_TECNICO=?, CPF_TECNICO=?, DATA_NASCIMENTO_TECNICO=? where Usuario_ID_User=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, tecnico.getIdClube());
     ps.setString(2, tecnico.getNomeTecnico());
     ps.setString(3, tecnico.getSobrenomeTecnico());
     ps.setString(4, tecnico.getRgTecnico());
     ps.setString(5, tecnico.getCpfTecnico());
     ps.setDate(6, java.sql.Date.valueOf(tecnico.getDataNascimentoTecnico()));
     ps.setInt(7, tecnico.getIdTecnico());
     int result = ps.executeUpdate();
  } // atualizar

  public TecnicoDO buscarTecnico(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Tecnico where  Usuario_ID_USER=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     TecnicoDO tecnico = new TecnicoDO();
     tecnico.setIdTecnico (rs.getInt("Usuario_ID_USER"));
     tecnico.setIdClube (rs.getInt("ID_CLUBE"));
     tecnico.setNomeTecnico (rs.getString("NOME_TECNICO"));
     tecnico.setSobrenomeTecnico(rs.getString("SOBRENOME_TECNICO"));
     tecnico.setRgTecnico(rs.getString("RG_TECNICO"));
     tecnico.setCpfTecnico(rs.getString("CPF_TECNICO"));
     tecnico.setDataNascimentoTecnico(rs.getString("DATA_NASCIMENTO_TECNICO"));
     return tecnico;
  } // buscar

  public Vector pesquisarPorNome(String nome, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Tecnico where NOME_TECNICO like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nome);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector tecnicos = new Vector();
     while (rs.next()) {
        TecnicoDO c = new TecnicoDO();
        c.setIdTecnico (rs.getInt("Usuario_ID_User"));
        c.setIdClube (rs.getInt("ID_CLUBE"));
        c.setNomeTecnico (rs.getString("NOME_TECNICO"));
        c.setSobrenomeTecnico(rs.getString("SOBRENOME_TECNICO"));
        c.setRgTecnico(rs.getString("RG_TECNICO"));
        c.setCpfTecnico(rs.getString("CPF_TECNICO"));
        c.setDataNascimentoTecnico(rs.getString("DATA_NASCIMENTO_TECNICO"));
        tecnicos.add(c);
     }
     return tecnicos;
  } // pesquisarPorNome

  public Vector pesquisarPorClube(int idclube, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Tecnico where ID_CLUBE = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idclube);
     ResultSet rs = ps.executeQuery();
     Vector tecnicos = new Vector();
     while (rs.next()) {
        TecnicoDO c = new TecnicoDO();
        c.setIdTecnico (rs.getInt("Usuario_ID_User"));
        c.setIdClube (rs.getInt("ID_CLUBE"));
        c.setNomeTecnico (rs.getString("NOME_TECNICO"));
        c.setSobrenomeTecnico(rs.getString("SOBRENOME_TECNICO"));
        c.setRgTecnico(rs.getString("RG_TECNICO"));
        c.setCpfTecnico(rs.getString("CPF_TECNICO"));
        c.setDataNascimentoTecnico(rs.getString("DATA_NASCIMENTO_TECNICO"));
        tecnicos.add(c);
     }
     return tecnicos;
  } // pesquisarPorNome
  
  
} // TecnicoData