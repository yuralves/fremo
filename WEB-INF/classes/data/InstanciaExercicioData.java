package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class InstanciaExercicioData {

  public void incluir(InstanciaExercicioDO exercicio, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into InstanciaExercicio (Exercicio_ID_EXERCICIO, Atleta_ID_User, DATA_REALIZADO, VALOR) values (?, ?, ?, ?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, exercicio.getId_Exercicio());
     ps.setInt(2, exercicio.getId_Atleta());
     ps.setString(3, exercicio.getData_realizado());
     ps.setInt(4, exercicio.getValor());
     int result = ps.executeUpdate();
  }

    public Vector buscarPorId_Atleta(int Id_ATLETA, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from InstanciaExercicio where Atleta_ID_User = ?";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, Id_ATLETA);
     ResultSet rs = ps.executeQuery();
     Vector treinos = new Vector();
     while (rs.next()) {
        InstanciaExercicioDO c = new InstanciaExercicioDO();
        c.setId_Atleta(rs.getInt("Atleta_ID_User"));
        c.setId_Exercicio(rs.getInt("Exercicio_ID_EXERCICIO"));
        c.setData_realizado(rs.getString("DATA_REALIZADO"));
        c.setValor(rs.getInt("Valor"));
        treinos.add(c);
     }
     return treinos;
  } // pesquisarPorId_Clube

     public Vector buscarPorId_TipoExercicio_Atleta(int Id_ATLETA, int Id_TIPOEXERCICIO, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "SELECT instanciaexercicio.valor, instanciaexercicio.data_realizado, instanciaexercicio.Exercicio_ID_EXERCICIO,instanciaexercicio.Atleta_ID_User\n" +
"FROM instanciaexercicio\n" +
"INNER JOIN exercicio\n" +
"ON exercicio.ID_EXERCICIO=instanciaexercicio.Exercicio_ID_EXERCICIO\n" +
"WHERE instanciaexercicio.Atleta_ID_User=? and exercicio.TipoExercicio_ID_TIPO_EXERCICIO=?\n" +
"ORDER BY instanciaexercicio.exercicio_Id_Exercicio;";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, Id_ATLETA);
     ps.setInt(2, Id_TIPOEXERCICIO);
     ResultSet rs = ps.executeQuery();
     Vector treinos = new Vector();
     while (rs.next()) {
        InstanciaExercicioDO c = new InstanciaExercicioDO();
        c.setId_Atleta(rs.getInt("Atleta_ID_User"));
        c.setId_Exercicio(rs.getInt("Exercicio_ID_EXERCICIO"));
        c.setData_realizado(rs.getString("DATA_REALIZADO"));
        c.setValor(rs.getInt("Valor"));
        treinos.add(c);
     }
     return treinos;
  } // pesquisarPorId_Clube 

} // InstanciaExercicioDATA