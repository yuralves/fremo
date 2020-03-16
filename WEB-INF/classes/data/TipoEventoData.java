package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;

public class TipoEventoData {

  public void incluir(TipoEventoDO TipoEvento, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "insert into TipoEvento (tipo_do_evento) values (?)";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, TipoEvento.getTipo_do_evento());
     int result = ps.executeUpdate();
  }

  public Vector buscar(Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "select * from TipoEvento";
     PreparedStatement ps = con.prepareStatement(sql);
     ResultSet rs = ps.executeQuery();
     Vector TipoEvento = new Vector();
     while (rs.next()) {
        TipoEventoDO c = new TipoEventoDO();
        c.setId (rs.getInt("id_tipo_evento"));
        c.setTipo_do_evento (rs.getString("tipo_do_evento"));
        TipoEvento.add(c);
     }
     return TipoEvento;
  } // buscar

} // TipoEventoData