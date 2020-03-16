package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class MensalidadeClubesData {

  public void incluir(MensalidadeClubesDO mensalidadeclubes, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into MensalidadeClubes (Clube_Usuario_ID_User, Ano, Mes) values (?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, mensalidadeclubes.getId_CLUBE());
     ps.setInt(2, mensalidadeclubes.getAno());
     ps.setString(3, mensalidadeclubes.getMes());
     int result = ps.executeUpdate();
  }

  public void excluir(MensalidadeClubesDO mensalidadeclubes, Transacao tr) throws Exception {
     excluir(mensalidadeclubes.getId_CLUBE(), tr);
  } // excluir

  public void excluir (int idobj, Transacao tr) throws Exception {
  } // excluir 

  public void atualizar(MensalidadeClubesDO mensalidadeclubes, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update MensalidadeClubes set Ano=?, Mes=? where id_CLUBE=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, mensalidadeclubes.getAno());
     ps.setString(2, mensalidadeclubes.getMes());
	 ps.setInt(3, mensalidadeclubes.getId_CLUBE());
     int result = ps.executeUpdate();
  } // atualizar

  public MensalidadeClubesDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from MensalidadeClubes where  id_CLUBE=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     MensalidadeClubesDO mensalidadeclubes = new MensalidadeClubesDO();
     mensalidadeclubes.setId_CLUBE (rs.getInt("id_CLUBE"));
     mensalidadeclubes.setAno (rs.getInt("Ano"));
     mensalidadeclubes.setMes(rs.getString("Mes"));
     return mensalidadeclubes;
  } // buscar

} // MensalidadeClubesData