<%-- 
    Document   : index
    Created on : 07/11/2016, 10:10:10
    Author     : Yuri
--%>

<!Isso eh tipo os imports>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="data.EventoDO" %>
<%@ page import="transacoes.EVNT" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="data.ResultadosDO" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<!Inicio do codigo HTML/JS>
<%if ( session.getAttribute("user_email") == null) {
    //verificacao manual de login
}
String email = (String)session.getAttribute("user_email");
boolean is_admin = (Boolean)session.getAttribute("is_admin");
boolean is_federacao = (Boolean)session.getAttribute("is_federacao");
boolean is_clube = (Boolean)session.getAttribute("is_clube");
boolean is_tecnico = (Boolean)session.getAttribute("is_tecnico");
boolean is_atleta = (Boolean)session.getAttribute("is_atleta");


String action = request.getParameter("action");
if (null == action){
    action = "showEvents";
}
%>
<html>
    <form action="./resultados.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
        <head>
            <link rel="stylesheet" type="text/css" href="EstilosResultados.css">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>FREMO</title>
        </head>
        <!Tabela superior>
        <table style="width:100%" border=1 cellpadding="0" cellspacing="0" bgcolor="">
            <td align="Left" valign="top" height = "70">
                
                <br>
                <div style="float:left;width:50%;"><h3><input type="submit" class = "botao3" name="Home" value="Home"></h3></div>
                <div style="float:left;width:39%;"><h3>Header</h3></div>
                <%if ( session.getAttribute("user_email") == null) {%>
                    <div style="float:left;width:0%;"><h3><input type="submit" class = "botao3" name="Entrar" value="Entrar"</h3></div>
                <%}else{%>
                    <div style="float:left;width:0%;"><h3><input type="submit" class = "botao3" name="Sair" value="Sair"</h3></div>
                <%}%>
        </table>
        <!Miolo contendo menu e navegacao>
        <table style="width:100%" border=1 cellpadding="0" cellspacing="0">
            <td width="300" bgcolor="lightblue" align="left" valign="top">
                <br><br><br>
                <ul class="a">
                <li><a href="./calendario.jsp">Calendario</a>
                <li><a href="./resultados.jsp">Resultados</a>
                <li><a href="./ranking.jsp">Ranking</a>
                <li><a href="./clubes.jsp">Clubes</a>
                <li><a href="./contato.jsp">Contato</a>
                <li><a href="./newsletter.jsp">Newsletter</a>
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
else if(null != request.getParameter("Entrar")){
    pageContext.forward("./index.jsp");
}
//Se algum botao de campeonato for pressionado
else{
    if (action.equals("showRaces")){%>
                        <td width = 200 height="400" align = "left" valign="top"> 

                        <font face = "Verdana" size = "8">2016</font> <br>
                        <% 
                        transacoes.EVNT tr = new transacoes.EVNT();
                        Vector eventos = tr.todos_eventos_();
                        
                        for (int i = 0; i < eventos.size(); i++) {
                            data.EventoDO eventoaux = ((EventoDO)eventos.elementAt(i));
                        %>
                        <a href=resultados.jsp?action=showRaces&idRace=<%=eventoaux.getId()%>><%=eventoaux.getNome_Do_Evento()%></a>
                        <%}%>
                        
                        </td>
                        <%
                        int id_evento = Integer.parseInt(request.getParameter("idRace"));
                        %>
                        
                        
                        <td height="400" align = "center" valign="center"> 
                            <center>
                                <table>
                                   <%--<%=id_evento%>--%>
                                   
                                        <% 
                                        Vector resultados = tr.resultados(id_evento);
                                        
                                        for (int j = 0; j < resultados.size(); j++) {
                                            data.ResultadosDO resultadoaux = ((ResultadosDO)resultados.elementAt(j));
                                            if(j==0){
                                        %>
                                        <h2><%=resultadoaux.getnome_do_evento()%> </h2> <br>
                                            <%}%>
                                        <%=resultadoaux.getnome_da_prova()%> <br>
                                        <%=resultadoaux.getnome_atleta()%> <%=resultadoaux.getsobrenome_atleta()%> <br>
                                        Colocacao: <%=resultadoaux.getcolocacao()%> <br>
                                        Tempo: <%=resultadoaux.getresultado()%> <br><br>
                                        
                                        <%}%> 
                                        
                                </table>
                            </center>
                        </td>
<%}
else {%>                                                            
                <font face = "Verdana" size = "8">2016</font> <br>
                <% 
                transacoes.EVNT tr = new transacoes.EVNT();
                Vector eventos = tr.todos_eventos_();
                for (int i = 0; i < eventos.size(); i++) {
                    data.EventoDO eventoaux = ((EventoDO)eventos.elementAt(i));
                %>
                <a href=resultados.jsp?action=showRaces&idRace=<%=eventoaux.getId()%>><%=eventoaux.getNome_Do_Evento()%></a>
                <!--<input type="submit" class="botaoresultado" name="CX16" value="<%//= eventoaux.getNome_Do_Evento()%>"> <br>-->
                <%}%>
                
<%}
}%>
                </table>
            </td>
        </table>
                
        <!Seção inferior do site>
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