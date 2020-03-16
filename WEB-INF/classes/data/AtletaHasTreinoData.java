package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class AtletaHasTreinoData {

  public void incluir(AtletaHasTreinoDO atletahastreino, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into AtletaHasTreino (Treino_ID_TREINO, Atleta_Usuario_ID_User) values (?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, atletahastreino.getId_TREINO());
     ps.setInt(2, atletahastreino.getId_ATLETA());
     int result = ps.executeUpdate();
  }

  public void excluir(AtletaHasTreinoDO atletahastreino, Transacao tr) throws Exception {
     excluir(atletahastreino.getId_TREINO(), tr);
  } // excluir

  public void excluir (int id_TREINOobj, Transacao tr) throws Exception {
  } // excluir 

  public void atualizar(AtletaHasTreinoDO atletahastreino, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update AtletaHasTreino set id_ATLETA=? where id_TREINO=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, atletahastreino.getId_ATLETA());
	 ps.setInt(2, atletahastreino.getId_TREINO());
     int result = ps.executeUpdate();
  } // atualizar

  public AtletaHasTreinoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from AtletaHasTreino where id_TREINO=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     AtletaHasTreinoDO atletahastreino = new AtletaHasTreinoDO();
     atletahastreino.setId_TREINO (rs.getInt("id_TREINO"));
     atletahastreino.setId_ATLETA (rs.getInt("id_ATLETA"));
     return atletahastreino;
  } // buscar
  
      public Vector buscar_por_id_atleta(int Id_atleta, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from AtletaHasTreino where atleta_usuario_id_user like ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, Id_atleta);
     ResultSet rs = ps.executeQuery();
     Vector atletahastreino = new Vector();
     while (rs.next()) {
        AtletaHasTreinoDO c = new AtletaHasTreinoDO();
        c.setId_ATLETA (rs.getInt("Atleta_Usuario_ID_User"));
        c.setId_TREINO (rs.getInt("Treino_ID_TREINO"));

        atletahastreino.add(c);
     }
     return atletahastreino;
  } // pesquisarPorId_Clube 

} // AtletaHasTreinoData