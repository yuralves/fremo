package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class ClubeData {

  public void incluirClube(ClubeDO clube, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Clube (Usuario_ID_User, ID_Federacao, NOME_CLUBE, ENDERECO_CLUBE, IMG_URL_CLUBE, SITE_CLUBE, MENSALIDADE_CLUBE) values (?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, clube.getIdClube());
     ps.setInt(2, clube.getIdFederacao());
     ps.setString(3, clube.getNomeClube());
     ps.setString(4, clube.getEnderecoClube());
     ps.setString(5, clube.getImgUrlClube());
     ps.setString(6, clube.getSiteClube());
     ps.setInt(7, clube.getMensalidadeClube());
     int result = ps.executeUpdate();
  }

  public void atualizar(ClubeDO clube, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Clube set NOME_CLUBE=?, ENDERECO_CLUBE=?, IMG_URL_CLUBE=?, SITE_CLUBE=?, MENSALIDADE_CLUBE=?, ID_FEDERACAO=? where Usuario_ID_User =?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, clube.getNomeClube());
     ps.setString(2, clube.getEnderecoClube());
     ps.setString(3, clube.getImgUrlClube());
     ps.setString(4, clube.getSiteClube());
     ps.setInt(5, clube.getMensalidadeClube());
     ps.setInt(6, clube.getIdFederacao());
     ps.setInt(7, clube.getIdClube());
     int result = ps.executeUpdate();
  } // atualizar

  public ClubeDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Clube where Usuario_ID_User=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ClubeDO clube = new ClubeDO();
     clube.setIdClube (rs.getInt("Usuario_ID_User"));
     clube.setIdFederacao (rs.getInt("ID_FEDERACAO"));
     clube.setNomeClube (rs.getString("NOME_CLUBE"));
     clube.setEnderecoClube(rs.getString("ENDERECO_CLUBE"));
     clube.setImgUrlClube (rs.getString("IMG_URL_CLUBE"));
     clube.setSiteClube (rs.getString("SITE_CLUBE"));
     clube.setMensalidadeClube (rs.getInt("MENSALIDADE_CLUBE"));
     
     return clube;
  } // buscar

  public Vector pesquisarPorNome(String nome, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Clube where NOME_CLUBE like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, nome);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector clubes = new Vector();
     while (rs.next()) {
        ClubeDO c = new ClubeDO();
        c.setIdClube (rs.getInt("ID_CLUBE"));
        c.setIdFederacao (rs.getInt("ID_FEDERACAO"));
        c.setMensalidadeClube (rs.getInt("MENSALIDADE_CLUBE"));
        
        c.setNomeClube (rs.getString("NOME_CLUBE"));
        c.setEnderecoClube (rs.getString("ENDERECO_CLUBE"));
        c.setImgUrlClube (rs.getString("IMG_URL_CLUBE"));
        c.setSiteClube (rs.getString("SITE_CLUBE"));
        //System.out.println(" got " + c.getNome());
        clubes.add(c);
     }
     return clubes;
  } // pesquisarPorNome
  
  public Vector pesquisarClubes(int id_federacao, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Clube where ID_FEDERACAO = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, id_federacao);
     ResultSet rs = ps.executeQuery();
     Vector clubes = new Vector();
     while (rs.next()) {
        ClubeDO c = new ClubeDO();
        c.setIdClube (rs.getInt("Usuario_ID_User"));
        c.setIdFederacao (rs.getInt("ID_FEDERACAO"));
        c.setMensalidadeClube (rs.getInt("MENSALIDADE_CLUBE"));
        c.setNomeClube (rs.getString("NOME_CLUBE"));
        c.setEnderecoClube (rs.getString("ENDERECO_CLUBE"));
        c.setImgUrlClube (rs.getString("IMG_URL_CLUBE"));
        c.setSiteClube (rs.getString("SITE_CLUBE"));
        //System.out.println(" got " + c.getNome());
        clubes.add(c);
     }
     return clubes;
  } // pesquisarClubes
  
  public Vector todosClubes(Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Clube";
     PreparedStatement ps = con.prepareStatement(sql);
     ResultSet rs = ps.executeQuery();
     Vector clubes = new Vector();
     while (rs.next()) {
        ClubeDO c = new ClubeDO();
        c.setIdClube (rs.getInt("Usuario_ID_User"));
        c.setIdFederacao (rs.getInt("ID_FEDERACAO"));
        c.setMensalidadeClube (rs.getInt("MENSALIDADE_CLUBE"));
        c.setNomeClube (rs.getString("NOME_CLUBE"));
        c.setEnderecoClube (rs.getString("ENDERECO_CLUBE"));
        c.setImgUrlClube (rs.getString("IMG_URL_CLUBE"));
        c.setSiteClube (rs.getString("SITE_CLUBE"));
        //System.out.println(" got " + c.getNome());
        clubes.add(c);
     }
     return clubes; 
  } // todosClubes
  
    public void atualizar_mensalidade(int idclube, int mensalidade, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Clube set MENSALIDADE_CLUBE=? where Usuario_ID_User=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, mensalidade);
     ps.setInt(2, idclube);
     int result = ps.executeUpdate();
  } // atualizar mensalidade

} // ClubeData