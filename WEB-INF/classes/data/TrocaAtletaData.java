package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class TrocaAtletaData {

  public void incluir(TrocaAtletaDO troca, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into TrocaAtleta (Atleta_Usuario_ID_User, Clube_Usuario_ID_User_1, Clube_Usuario_ID_User_2, APROVADO_CLUBE_ANTIGO) values (?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, troca.getIdAtleta());
     ps.setInt(2, troca.getIdClubeAntigo());
     ps.setInt(3, troca.getIdClubeNovo());
     ps.setBoolean(4, troca.getAprovadoClubeAntigo());
     int result = ps.executeUpdate();
  }

  public void atualizar(TrocaAtletaDO troca, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update TrocaAtleta set Atleta_Usuario_ID_User=?, Clube_Usuario_ID_User_1=?, Clube_Usuario_ID_User_1=?, APROVADO_CLUBE_ANTIGO=? where Atleta_Usuario_ID_User=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, troca.getIdAtleta());
     ps.setInt(2, troca.getIdClubeAntigo());
     ps.setInt(3, troca.getIdClubeNovo());
     ps.setBoolean(4, troca.getAprovadoClubeAntigo());
     ps.setInt(5, troca.getIdAtleta());
     int result = ps.executeUpdate();
  } // atualizar

  public Vector buscarPorAprovacao(Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from TrocaAtleta where APROVADO_CLUBE_ANTIGO=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setBoolean(1, true);
     ResultSet rs = ps.executeQuery();
     Vector Trocas = new Vector();
     while (rs.next()) {
        TrocaAtletaDO TA = new TrocaAtletaDO();
        TA.setIdAtleta(rs.getInt("Atleta_Usuario_ID_User"));
        TA.setIdClubeAntigo(rs.getInt("Clube_Usuario_ID_User_1"));
        TA.setIdClubeNovo(rs.getInt("Clube_Usuario_ID_User_2"));
        TA.setAprovadoClubeAntigo(rs.getBoolean("APROVADO_CLUBE_ANTIGO"));
        Trocas.add(TA);
     }
     return Trocas;
  } // buscar
  
    public void excluir(int id_atleta, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "DELETE FROM TrocaAtleta WHERE ID_ATLETA=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, id_atleta);
     int result = ps.executeUpdate();
  } // excluir
    
    public Vector buscarPorClube(int id_clube, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from TrocaAtleta where Clube_Usuario_ID_User_2=? AND APROVADO_CLUBE_ANTIGO=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, id_clube);
     ps.setBoolean(2, false);
     ResultSet rs = ps.executeQuery();
     Vector Trocas = new Vector();
     while (rs.next()) {
        TrocaAtletaDO TA = new TrocaAtletaDO();
        TA.setIdAtleta(rs.getInt("Atleta_Usuario_ID_User"));
        TA.setIdClubeAntigo(rs.getInt("Clube_Usuario_ID_User_1"));
        TA.setIdClubeNovo(rs.getInt("Clube_Usuario_ID_User_2"));
        TA.setAprovadoClubeAntigo(rs.getBoolean("APROVADO_CLUBE_ANTIGO"));
        Trocas.add(TA);
     }
     return Trocas;
  } // buscar
  
 public void autorizar_clube(int id_atleta, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update TrocaAtleta set APROVADO_CLUBE_ANTIGO=? where Atleta_Usuario_ID_User=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setBoolean(1, true);
     ps.setInt(2, id_atleta);
     int result = ps.executeUpdate();
  } // atualizar
    

} // ContatoData