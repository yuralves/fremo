package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class ListaAtletasData {

  public void incluir(ListaAtletasDO listaAtletas, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into ListaAtletas (Atleta_Usuario_ID_User, Clube_Usuario_ID_User, Provas_ID_PROVA, RESULTADO, COLOCACAO, PONTUACAO, INSCRICAO_APROVADA) values (?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, listaAtletas.getId_ATLETA());
     ps.setInt(2, listaAtletas.getId_CLUBE());
     ps.setInt(3, listaAtletas.getId_PROVA());
     ps.setFloat(4, listaAtletas.getResultado());
     ps.setString(5, listaAtletas.getColocacao());
     ps.setInt(6, listaAtletas.getPontuacao());
     ps.setBoolean(7, listaAtletas.getInscricao_Aprovada());
     int result = ps.executeUpdate();
  }

  public void excluir(ListaAtletasDO contato, Transacao tr) throws Exception {
     excluir(contato.getId_ATLETA(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update ListaAtletas set VALIDO=0 where ID_ATLETA=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     
     int result = ps.executeUpdate();
  } // excluir 

  public void atualizar(ListaAtletasDO listaAtletas, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update ListaAtletas set ID_PROVA=?, ID_CLUBE=?, RESULTADO=?, COLOCACAO=?, PONTUACAO=?, INSCRICAO_APROVADA=? where ID_ATLETA=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, listaAtletas.getId_PROVA());
     ps.setInt(2, listaAtletas.getId_CLUBE());
     ps.setFloat(3, listaAtletas.getResultado());
     ps.setString(4, listaAtletas.getColocacao());
     ps.setInt(5, listaAtletas.getPontuacao());
     ps.setBoolean(6, listaAtletas.getInscricao_Aprovada());
     ps.setInt(7, listaAtletas.getId_ATLETA());
     int result = ps.executeUpdate();
  } // atualizar

    public ListaAtletasDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from ListaAtletas where  Atleta_Usuario_ID_User=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ListaAtletasDO contato = new ListaAtletasDO();
     contato.setId_ATLETA (rs.getInt("Atleta_Usuario_ID_User"));
     contato.setId_PROVA (rs.getInt("Provas_ID_PROVA"));
     contato.setId_CLUBE(rs.getInt("Clube_Usuario_ID_User"));
     contato.setResultado(rs.getFloat("RESULTADO"));
     contato.setColocacao(rs.getString("COLOCACAO"));
     contato.setPontuacao(rs.getInt("PONTUACAO"));
     contato.setInscricao_Aprovada(rs.getBoolean("INSCRICAO_APROVADA"));
     
     return contato;
  } // buscar
  
     public ListaAtletasDO buscarPor_ID_User_e_ID_Prova(int id_user,int id_prova, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from ListaAtletas where  Atleta_Usuario_ID_User=? AND Provas_ID_PROVA=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, id_user);
     ps.setInt(2, id_prova);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ListaAtletasDO contato = new ListaAtletasDO();
     contato.setId_ATLETA (rs.getInt("Atleta_Usuario_ID_User"));
     contato.setId_PROVA (rs.getInt("Provas_ID_PROVA"));
     contato.setId_CLUBE(rs.getInt("Clube_Usuario_ID_User"));
     contato.setResultado(rs.getFloat("RESULTADO"));
     contato.setColocacao(rs.getString("COLOCACAO"));
     contato.setPontuacao(rs.getInt("PONTUACAO"));
     contato.setInscricao_Aprovada(rs.getBoolean("INSCRICAO_APROVADA"));
     
     return contato;
  } // buscar   
     
    public Vector pesquisarPorProvas(int id_provas, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from ListaAtletas where Provas_ID_PROVA = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, id_provas);
     ResultSet rs = ps.executeQuery();
     Vector ListaAtletas = new Vector();
     while (rs.next()) {
        ListaAtletasDO la = new ListaAtletasDO();
        la.setId_ATLETA (rs.getInt("Atleta_Usuario_ID_User"));
        la.setId_PROVA (rs.getInt("Provas_ID_PROVA"));
        la.setId_CLUBE(rs.getInt("Clube_Usuario_ID_User"));
        la.setResultado(rs.getFloat("RESULTADO"));
        la.setColocacao(rs.getString("COLOCACAO"));
        la.setPontuacao(rs.getInt("PONTUACAO"));
        la.setInscricao_Aprovada(rs.getBoolean("INSCRICAO_APROVADA"));
        ListaAtletas.add(la);
     }
     return ListaAtletas;
  } // pesquisarPorTipo
    
      public void atualizar_resultado(ListaAtletasDO listaAtletas, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update ListaAtletas set RESULTADO=?, COLOCACAO=?, PONTUACAO=? where Atleta_Usuario_ID_User=? AND Provas_ID_PROVA=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setFloat(1, listaAtletas.getResultado());
     ps.setString(2, listaAtletas.getColocacao());
     ps.setInt(3, listaAtletas.getPontuacao());
     ps.setInt(4, listaAtletas.getId_ATLETA());
     ps.setInt(5, listaAtletas.getId_PROVA());
     int result = ps.executeUpdate();
  } // atualizar
  
    public void atualizar_inscricao(ListaAtletasDO listaAtletas, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update ListaAtletas set INSCRICAO_APROVADA=? where Atleta_Usuario_ID_User=? AND Provas_ID_PROVA=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setBoolean(1, listaAtletas.getInscricao_Aprovada());
     ps.setInt(2, listaAtletas.getId_ATLETA());
     ps.setInt(3, listaAtletas.getId_PROVA());
     int result = ps.executeUpdate();
  } // atualizar

} // ListaAtletasData