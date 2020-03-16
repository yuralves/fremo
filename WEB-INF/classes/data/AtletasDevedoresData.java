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
public class AtletasDevedoresData {
    
    public Vector pesquisarDevedores(int id_clube, String mes, int ano, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "SELECT atleta.mensalidade_atleta, USUARIO.EMAIL_USER, NOME_atleta FROM atleta JOIN USUARIO ON USUARIO.ID_USER = atleta.USUARIO_ID_USER WHERE atleta.USUARIO_ID_USER IN	(SELECT atleta.Usuario_ID_User FROM atleta where (atleta.ID_clube = ? AND atleta.Usuario_ID_User NOT IN (select mensalidadeatletas.atleta_Usuario_ID_User from mensalidadeatletas where mensalidadeatletas.Mes=? and mensalidadeatletas.ANO=?))) GROUP BY usuario.ID_User";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, id_clube);
     ps.setString(2, mes);
     ps.setInt(3, ano);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector devedores = new Vector();
     while (rs.next()) {
        AtletasDevedoresDO ad = new AtletasDevedoresDO();
        ad.setEmail_Do_Atleta(rs.getString("EMAIL_USER"));
        ad.setNome_Do_Atleta(rs.getString("NOME_ATLETA"));
        ad.setMensalidade(rs.getInt("mensalidade_atleta"));
        devedores.add(ad);
     }
     return devedores;
    } // pesquisarPorDevedores   
    
}
