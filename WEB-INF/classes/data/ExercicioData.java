package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class ExercicioData {
 public void incluir(ExercicioDO exercicio, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into Exercicio (ID_EXERCICIO, Treino_ID_TREINO, TipoExercicio_ID_TIPO_EXERCICIO, N_SERIES, REPETICOES, CARGA_OU_TEMPO) values (?, ?, ?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, exercicio.getIdExercicio());
     ps.setInt(2, exercicio.getIdTreino());
     ps.setInt(3, exercicio.getIdTipoExercicio());
     ps.setInt(4, exercicio.getNSeries());
     ps.setInt(5, exercicio.getNRepeticoes());
     ps.setString(6, exercicio.getCargaOuTempo());
     int result = ps.executeUpdate();
  }// incluir

  public void atualizar(ExercicioDO exercicio, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "update Exercicio set ID_EXERCICIO=?, ID_TREINO=?, ID_TIPOEXERCICIO=?, N_SERIES=?, N_REPETICOES=?, CARGA_OU_TEMPO=? where id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, exercicio.getIdExercicio());
     ps.setInt(2, exercicio.getIdTreino());
     ps.setInt(3, exercicio.getIdTipoExercicio());
     ps.setInt(4, exercicio.getNSeries());
     ps.setInt(5, exercicio.getNRepeticoes());
	 ps.setString(6, exercicio.getCargaOuTempo());
     int result = ps.executeUpdate();
  } // atualizar

  public ExercicioDO buscar(int idobj, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from Exercicio where  id=?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, idobj);
     ResultSet rs = ps.executeQuery();
     rs.next();
     ExercicioDO exercicio = new ExercicioDO();
     exercicio.setIdExercicio (rs.getInt("ID_EXERCICIO"));
     exercicio.setIdTreino (rs.getInt("ID_TREINO"));
     exercicio.setIdTipoExercicio(rs.getInt("ID_TIPOEXERCICIO"));
     exercicio.setNSeries(rs.getInt("N_SERIES"));
     exercicio.setNRepeticoes(rs.getInt("N_REPETICOES"));
     exercicio.setCargaOuTempo(rs.getString("CARGA_OU_TEMPO"));
     return exercicio;
  }
  
      public Vector buscar_por_id_treino(int id_treino, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "SELECT * from Exercicio Where Treino_ID_Treino = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, id_treino);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector devedores = new Vector();
     while (rs.next()) {
        ExercicioDO ad = new ExercicioDO();
        ad.setCargaOuTempo(rs.getString("CARGA_OU_TEMPO"));
        ad.setIdExercicio(rs.getInt("ID_EXERCICIO"));
        ad.setIdTipoExercicio(rs.getInt("TipoExercicio_ID_TIPO_EXercicio"));
        ad.setIdTreino(rs.getInt("TREINO_ID_TREINO"));
        ad.setNRepeticoes(rs.getInt("REPETICOES"));
        ad.setNSeries(rs.getInt("N_SERIES"));
        devedores.add(ad);
     }
     return devedores;
    } // pesquisarPorDevedores   
  
  
}//ExercicioData
