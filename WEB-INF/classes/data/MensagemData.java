package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class MensagemData {

  public void incluir(MensagemDO mensagem, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Mensagem (id_clube, email, mensagem) values (?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, mensagem.getId_clube());
     ps.setString(2, mensagem.getEmail());
     ps.setString(3, mensagem.getTexto());
     int result = ps.executeUpdate();
  }

  public void excluir (int idobj, Transacao tr) throws Exception {
  
      Connection con = tr.obterConexao();
     String sql = "DELETE From Mensagem WHERE ID_MENSAGEM = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     int result = ps.executeUpdate();
      
  } // excluir 

  public MensagemDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Mensagem where  id = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     MensagemDO mensagem = new MensagemDO();
     mensagem.setId (rs.getInt("id"));
     mensagem.setId_clube (rs.getInt("id_clube"));
     mensagem.setEmail (rs.getString("email"));
     mensagem.setTexto(rs.getString("texto"));
     return mensagem;
  } // buscar

     public Vector pesquisarPorIdClube(String header, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Mensagem where id_clube like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, header);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector mensagens = new Vector();
     while (rs.next()) {
        MensagemDO m = new MensagemDO();
        m.setId (rs.getInt("id"));
        m.setId_clube (rs.getInt("id_clube"));
        System.out.println(" got " + m.getId_clube());
        m.setEmail (rs.getString("email"));
        m.setTexto(rs.getString("texto"));
        mensagens.add(m);
     }
     return mensagens;
  } // pesquisarPorHeader
     
public MensagemDO buscar_email_id(int header, Transacao tr) throws Exception{
    Connection con = tr.obterConexao();
    String sql = "select * from Mensagem where id_mensagem like ?";
    PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, header);
     ResultSet rs = ps.executeQuery();
     rs.next();
     System.out.println("query executada");    
        MensagemDO m = new MensagemDO();
        m.setId (rs.getInt("id_mensagem"));
        m.setId_clube (rs.getInt("id_clube"));
        System.out.println(" got " + m.getId_clube());
        m.setEmail (rs.getString("email"));
        m.setTexto(rs.getString("mensagem"));
     return m;
    
}     

public Vector buscar_emails(int header, Transacao tr) throws Exception{
    Connection con = tr.obterConexao();
    String sql = "select * from Mensagem where id_clube like ?";
    PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, header);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector mensagens = new Vector();
     while (rs.next()) {
        MensagemDO m = new MensagemDO();
        m.setId (rs.getInt("id_mensagem"));
        m.setId_clube (rs.getInt("id_clube"));
        System.out.println(" got " + m.getId_clube());
        m.setEmail (rs.getString("email"));
        m.setTexto(rs.getString("mensagem"));
        mensagens.add(m);
     }
     return mensagens;
    
}

} // MensagemData