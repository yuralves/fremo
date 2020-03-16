/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;
/**
 *
 * @author danielmsverde
 */
public class ClubesDevedoresData {
    
    public Vector pesquisarDevedores(int id_federacao, String mes, int ano, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "SELECT clube.mensalidade_clube, USUARIO.EMAIL_USER, NOME_CLUBE FROM CLUBE JOIN USUARIO ON USUARIO.ID_USER = CLUBE.USUARIO_ID_USER WHERE CLUBE.USUARIO_ID_USER IN	(SELECT clube.Usuario_ID_User FROM clube where (clube.ID_FEDERACAO = ? AND clube.Usuario_ID_User NOT IN (select mensalidadeclubes.Clube_Usuario_ID_User from mensalidadeclubes where mensalidadeclubes.Mes=? and mensalidadeclubes.ANO=?))) GROUP BY usuario.ID_User";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, id_federacao);
     ps.setString(2, mes);
     ps.setInt(3, ano);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector devedores = new Vector();
     while (rs.next()) {
        ClubesDevedoresDO cd = new ClubesDevedoresDO();
        cd.setEmail_Do_Clube(rs.getString("EMAIL_USER"));
        cd.setNome_Do_Clube (rs.getString("NOME_CLUBE"));
        cd.setMensalidade(rs.getInt("mensalidade_clube"));
        devedores.add(cd);
     }
     return devedores;
    } // pesquisarPorDevedores
    
    
    
}
