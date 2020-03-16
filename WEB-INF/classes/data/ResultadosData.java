/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author erich
     */
package data;

import java.sql.*;
import java.util.*;
import utils.Transacao;
import java.util.Date;


public class ResultadosData {
    
     public Vector listaResultados(int Id_EVENTOS, Transacao tr) throws Exception {
     Connection con = tr.obterConexao();
     String sql = "SELECT EVENTO.ID_EVENTO, EVENTO.NOME_DO_EVENTO,  TIPOPROVA.NOME_DA_PROVA, ATLETA.NOME_ATLETA, ATLETA.SOBRENOME_ATLETA,  LISTAATLETAS.COLOCACAO, LISTAATLETAS.RESULTADO FROM EVENTO JOIN PROVAS ON EVENTO.ID_EVENTO = PROVAS.EVENTO_ID_EVENTO JOIN TIPOPROVA ON PROVAS.ID_TIPOPROVA = TIPOPROVA.ID_TIPOPROVA JOIN LISTAATLETAS ON PROVAS.ID_PROVA = LISTAATLETAS.PROVAS_ID_PROVA JOIN ATLETA ON LISTAATLETAS.Atleta_Usuario_ID_User = ATLETA.Usuario_ID_User WHERE EVENTO.ID_EVENTO = ? ";
     PreparedStatement ps = con.prepareStatement(sql);
     ps.setInt(1, Id_EVENTOS);
     ResultSet rs = ps.executeQuery();
     System.out.println("query executada");
     Vector Resultados = new Vector();
     while (rs.next()) {
        ResultadosDO e = new ResultadosDO();
        e.setId_evento (rs.getInt("ID_EVENTO"));
        e.setnome_do_evento (rs.getString("NOME_DO_EVENTO"));
        e.setnome_da_prova (rs.getString("NOME_DA_PROVA"));
        e.setnome_atleta (rs.getString("NOME_ATLETA"));
        e.setsobrenome_atleta (rs.getString("SOBRENOME_ATLETA"));
        e.setcolocacao (rs.getInt("COLOCACAO"));
        e.setresultado (rs.getFloat("RESULTADO"));
        Resultados.add(e);
     }
     return Resultados;
  } // pesquisarPorId_Tecnico
}
