package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class UsuarioData {

  public void incluir(UsuarioDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Usuario (EMAIL_USER, SENHA, HABILITADO_ADMIN, HABILITADO_FEDERACAO, HABILITADO_CLUBE, HABILITADO_TECNICO, HABILITADO_ATLETA) values (?, ?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuario.getEmail_User());
     ps.setString(2, usuario.getPassword());
     ps.setBoolean(3, usuario.getHabilitado_ADMIN());
     ps.setBoolean(4, usuario.getHabilitado_FEDERACAO());
     ps.setBoolean(5, usuario.getHabilitado_CLUBE());
     ps.setBoolean(6, usuario.getHabilitado_TECNICO());
     ps.setBoolean(7, usuario.getHabilitado_ATLETA());
     int result = ps.executeUpdate();
  } // incluir

  public void atualizar(UsuarioDO usuario, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Usuario set email_USER=?, senha=?, HABILITADO_ADMIN=?, HABILITADO_FEDERACAO=?, HABILITADO_CLUBE=?, HABILITADO_TECNICO=?, HABILITADO_ATLETA=? where id_USER=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, usuario.getEmail_User());
     ps.setString(2, usuario.getPassword());
     ps.setBoolean(3, usuario.getHabilitado_ADMIN());
     ps.setBoolean(4, usuario.getHabilitado_FEDERACAO());
     ps.setBoolean(5, usuario.getHabilitado_CLUBE());
     ps.setBoolean(6, usuario.getHabilitado_TECNICO());
     ps.setBoolean(7, usuario.getHabilitado_ATLETA());
     ps.setInt(8, usuario.getID_USER());
     int result = ps.executeUpdate();
     if (result != 1) {
	   throw new Exception("mais de um registro atualizado!");
	 }
  } // atualizar
  
  public UsuarioDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Usuario where  ID_user=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     UsuarioDO usuario = new UsuarioDO();
     usuario.setID_USER (rs.getInt("ID_USER"));
     usuario.setEmail_User (rs.getString("EMAIL_User"));
     usuario.setPassword(rs.getString("SENHA"));
     usuario.setHabilitado_ADMIN(rs.getBoolean("HABILITADO_ADMIN"));
     usuario.setHabilitado_FEDERACAO(rs.getBoolean("HABILITADO_FEDERACAO"));
     usuario.setHabilitado_CLUBE(rs.getBoolean("HABILITADO_CLUBE"));
     usuario.setHabilitado_TECNICO(rs.getBoolean("HABILITADO_TECNICO"));
     usuario.setHabilitado_ATLETA(rs.getBoolean("HABILITADO_ATLETA"));
     return usuario;
  } // buscar
  
  public UsuarioDO buscarPorEmail(String email, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Usuario where  EMAIL_USER=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, email);
     ResultSet rs = ps.executeQuery();
     rs.next();
     UsuarioDO usuario = new UsuarioDO();
     usuario.setID_USER (rs.getInt("ID_USER"));
     usuario.setEmail_User (rs.getString("Email_User"));
     usuario.setPassword(rs.getString("Senha"));
     usuario.setHabilitado_ADMIN(rs.getBoolean("HABILITADO_ADMIN"));
     usuario.setHabilitado_FEDERACAO(rs.getBoolean("HABILITADO_FEDERACAO"));
     usuario.setHabilitado_CLUBE(rs.getBoolean("HABILITADO_CLUBE"));
     usuario.setHabilitado_TECNICO(rs.getBoolean("HABILITADO_TECNICO"));
     usuario.setHabilitado_ATLETA(rs.getBoolean("HABILITADO_ATLETA"));
     System.out.println(" got " + usuario.getPassword());
     return usuario;
  } // buscar
 
} // ContatoData