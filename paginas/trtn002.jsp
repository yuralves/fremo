<%-- 
    Document   : index
    Created on : 07/11/2016, 10:10:10
    Author     : Yuri
--%>

<!Isso eh tipo os imports>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes.*" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="data.AtletaDO" %>
<%@ page import="data.TipoExercicioDO" %>
<%@ page import="data.InstanciaExercicioDO" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<!Inicio do codigo HTML/JS>
<%String email = (String)session.getAttribute("user_email");
int id = (Integer)session.getAttribute("user_id");
boolean is_admin = (Boolean)session.getAttribute("is_admin");
boolean is_federacao = (Boolean)session.getAttribute("is_federacao");
boolean is_clube = (Boolean)session.getAttribute("is_clube");
boolean is_tecnico = (Boolean)session.getAttribute("is_tecnico");
boolean is_atleta = (Boolean)session.getAttribute("is_atleta");
if (!is_tecnico && !is_atleta) {
    //verificacao manual de login
    pageContext.forward("main.jsp");
}%>
<html>
    <form action="./main.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
        <head>
            <link rel="stylesheet" type="text/css" href="Estilos.css">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>FREMO</title>
        </head>
        <!Tabela superior>
        <table style="width:100%" border=1 cellpadding="0" cellspacing="0" bgcolor="">
            <td align="Left" valign="top" height = "70">
                
                <br>
                <div style="float:left;width:50%;"><h3><input type="submit" class = "botao3" name="Home" value="Home"></h3></div>
                <div style="float:left;width:39%;"><h3>Header</h3></div>
                <div style="float:left;width:0%;"><h3><input type="submit" class = "botao3" name="Sair" value="Sair"</h3></div>
            
        </table>
        <!Miolo contendo menu e navegacao>
        <table style="width:100%" border=1 cellpadding="0" cellspacing="0">
            <td width="300" bgcolor="lightblue" align="left" valign="top">
                <br><br><br>
                <ul class="a">
                    <%if(is_atleta){%>
                <li><a href="./calendario.jsp">Calendario</a>
                <li><a href="./resultados.jsp">Resultados</a>
                <li><a href="./Ranking.jsp">Ranking</a>
                <li><a href="./catl001.jsp">Controle de presenca</a> 
                <li><a href="./gacc002.jsp">Editar cadastro</a> 
                <li><a href="./trtn002.jsp">Ver progresso</a>
                <li><a href="./trtn005.jsp">Fazer exercicio</a>
                <li><a href="./gacc009.jsp">Mudar Senha</a>
                <%} else{%>
                <li><a href="./calendario.jsp">Calendario</a>
                <li><a href="./resultados.jsp">Resultados</a>
                <li><a href="./ranking.jsp">Ranking</a>
                <li><a href="./gacc011.jsp">Editar cadastro</a>
                <li><a href="./trtn001.jsp">Atribuir treinos</a>
                <li><a href="./trtn002.jsp">Ver progresso</a>
                <li><a href="./trtn003.jsp">Criar treino</a>
                <li><a href="./trtn004.jsp">Criar exercicio</a>
                <li><a href="./gacc009.jsp">Mudar Senha</a>
                <%}%>
                </ul>
            </td>
            <td height="400" align = "left" valign="top"> 
                <table>
<% if(is_admin){%>
                        <input type="submit" class="botao4" name="Admin" value="Admin">
<%} if(is_federacao){%>
                        <input type="submit" class="botao4" name="Federacao" value="Federacao">
<%} if(is_clube){%>
                        <input type="submit" class="botao4" name="Clube" value="Clube">
<%} if(is_tecnico){%>
                        <input type="submit" class="botao4" name="Tecnico" value="Tecnico">
<%} if(is_atleta){%>
                        <input type="submit" class="botao4" name="Atleta" value="Atleta">
<%}%>
                </table>
      
      <table>
<% if(null != request.getParameter("Home")){ 
pageContext.forward("./index.jsp");
}                
else if(null != request.getParameter("Sair")){
    session.removeAttribute("user_email");
    pageContext.forward("./index.jsp");
}
else if(null == request.getParameter("Progresso")) {%>
                    
                    <div style="padding:15px;">
                    <h2>Ver Progresso</h2>
                    </div>
                    
                    <div style="padding:20px;">
                    <select name="atleta_esc">                
    <%
    transacoes.TATL tna = new transacoes.TATL();%>
    <%if(is_atleta){
          AtletaDO at = tna.busca_atleta_por_ID_atleta(id);
    %>
          <option value=<%=at.getID_ATLETA()%>><%=at.getNOME_ATLETA()%> </option>
        
    <%}%>
    
    <%transacoes.TRTN tn = new transacoes.TRTN();
    Vector atletas = tn.vetor_atletas_Id_tecnico(id);
    for(int i = 0; i < atletas.size(); i++){
    
        AtletaDO Atleta = (AtletaDO) atletas.elementAt(i);
        int id_atleta = Atleta.getID_ATLETA();
        
    %>          

    <option value=<%=id_atleta%>><%=Atleta.getNOME_ATLETA()%></option>
    
    
    <%}%>
    </select>


      
    <select name="exercicio_esc">                
    <%
    Vector tipos_exercicio = tn.vetor_tipos_exercicio();
    for(int i = 0; i < tipos_exercicio.size(); i++){
    
        TipoExercicioDO Tipo_ex = (TipoExercicioDO) tipos_exercicio.elementAt(i);
        int id_exercicio=Tipo_ex.getIdTipoExercicio();
    %>          

                    <option value=<%=id_exercicio%>><%=Tipo_ex.getNomeExercicio()%></option>
                
      <%}%>
      </select>      
      <table><tr>
              <th><h3><input type="submit" class = "botao2" name="Progresso" value="Ver Progresso" formaction="./trtn002.jsp"></h3></th>
      <th><h3><input type="submit" class = "botao2" name="Cancelar" value="cancelar" formaction="./main.jsp"></h3></th>
      </tr>
      </table>              </div>

      
     <%} if(null != request.getParameter("Progresso")){
     transacoes.TRTN tn = new transacoes.TRTN();
     String aux = request.getParameter("atleta_esc");
     int id_atleta = Integer.parseInt(aux);
     
     String aux2 = request.getParameter("exercicio_esc");
     int id_exercicio = Integer.parseInt(aux2);
     
     transacoes.GACC tng = new transacoes.GACC();
     AtletaDO at = tng.busca_atleta_por_ID_atleta(id_atleta);
     TipoExercicioDO ex = tn.Busca_TipoEx_por_Id(id_exercicio);
     %> 
    <div style="padding:15px;">
    <h2><%=ex.getNomeExercicio()+": "+at.getNOME_ATLETA()+" "+at.getSOBRENOME_ATLETA()%></h2>
    </div>

    <table>
        <tr>
    <th>Valor</th>
    <th>Data</th>
  </tr>
  <%     
                  
         Vector inst_ex = tn.vetor_instanciaexercicio_atleta(at.getID_ATLETA(), ex.getIdTipoExercicio());
    for(int i = 0; i < inst_ex.size(); i++){
    
        InstanciaExercicioDO Instancia = (InstanciaExercicioDO) inst_ex.elementAt(i);
  
  %>
                      <tr><th><%=Instancia.getValor()%></th>
                          <th><%=Instancia.getData_realizado()%></th></tr>
    
  <%}%>

    </table>

<%} %>

                    
                </table>
            </td>
        </table>
        <table> 
        </table>
        <table style="width:100%" border=1 cellpadding="0" cellspacing="0" bgcolor="">
            <td align="center">
                <table style="width:100%" border=0 cellpadding="0" cellspacing="0">
                    <td align="left">
                        Site criado pelos alunos de engenharia mecatronica da POLI USP
                    </td>
                    <td align="right">
                        <img src="http://sites.poli.usp.br/d/PME2333/Figuras/minerva.png" alt="PoliLogo" width="75" height="85" style="display: block;" />
                    </td>
                </table>
            </td>
        </table>
    </form>
</html>