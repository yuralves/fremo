package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class NewsletterData {

  public void incluir(NewsletterDO newsletter, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Newsletter (EMAIL_VISITANTE) values (?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, newsletter.getEmail());
     int result = ps.executeUpdate();
  }

  public void excluir(NewsletterDO newsletter, Transacao tr) throws Exception {
     excluir(newsletter.getEmail(), tr);
  } // excluir

  public void excluir (String email, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "delete from Newsletter where EMAIL_VISITANTE=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, email);
     int result = ps.executeUpdate();
  } // excluir
  
  public NewsletterDO buscar(String email, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Newsletter where EMAIL_VISITANTE=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, email);
     ResultSet rs = ps.executeQuery();
     rs.next();
     NewsletterDO newsletter = new NewsletterDO();
     newsletter.setEmail(rs.getString("EMAIL_VISITANTE"));
     return newsletter;
  }

} // ContatoData
