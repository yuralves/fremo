package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class TreinoData {

  public void incluir(TreinoDO treino, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Treino (Tecnico_Usuario_ID_User) values (?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, treino.getId_TECNICO());
     int result = ps.executeUpdate();
  }

  public void atualizar(TreinoDO treino, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Treino set id_TECNICO=? where id_TREINO=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, treino.getId_TECNICO());
	 ps.setInt(2, treino.getId_TREINO());
     int result = ps.executeUpdate();
  } // atualizar

  public TreinoDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Treino where  id_TREINO=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     TreinoDO treino = new TreinoDO();
     treino.setId_TREINO (rs.getInt("id_TREINO"));
     treino.setId_TECNICO (rs.getInt("id_TECNICO"));
     return treino;
  } // buscar
  
  public Vector pesquisarPorTecnico(int idtecnico, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Treino where Tecnico_Usuario_ID_User = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idtecnico);
     ResultSet rs = ps.executeQuery();
     Vector tecnicos = new Vector();
     while (rs.next()) {
        TreinoDO c = new TreinoDO();
        c.setId_TECNICO(rs.getInt("Tecnico_Usuario_ID_Tecnico"));
        c.setId_TREINO(rs.getInt("ID_TREINO"));
        tecnicos.add(c);
     }
     return tecnicos;
  } // pesquisarPorNome
  
     public Vector Treinos(Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Treino";
     PreparedStatement ps = con.prepareStatement(sql);
     ResultSet rs = ps.executeQuery();
     Vector results = new Vector();
     while (rs.next()) {
        TreinoDO e = new TreinoDO();
        e.setId_TREINO (rs.getInt("ID_TREINO"));
        results.add(e);
     }
     return results;
  } // Treinos
     
         public TreinoDO buscar_ultimo (Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "SELECT * FROM treino where ID_TREINO = (SELECT MAX(ID_TREINO) FROM treino)";
     PreparedStatement ps = con.prepareStatement(sql);
     ResultSet rs = ps.executeQuery();
     rs.next();
     TreinoDO treino = new TreinoDO();
     treino.setId_TREINO(rs.getInt("ID_TREINO"));
     treino.setId_TECNICO(rs.getInt("Tecnico_Usuario_ID_User"));
     return treino;
  } // buscar

} // TreinoData