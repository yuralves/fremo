<%-- 
    Document   : index
    Created on : 07/11/2016, 10:10:10
    Author     : Yuri
--%>

<!Isso eh tipo os imports>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes.EVNT" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="data.EventoDO" %>
<%@ page import="data.ProvasDO" %>
<%@ page import="data.TipoProvaDO" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<!Inicio do codigo HTML/JS>
<%String email = (String)session.getAttribute("user_email");
boolean is_admin = (Boolean)session.getAttribute("is_admin");
boolean is_federacao = (Boolean)session.getAttribute("is_federacao");
boolean is_clube = (Boolean)session.getAttribute("is_clube");
boolean is_tecnico = (Boolean)session.getAttribute("is_tecnico");
boolean is_atleta = (Boolean)session.getAttribute("is_atleta");
%>
<html>
    <form action="./evnt007.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
                <li><a href="./calendario.jsp">Calendario</a>
                <li><a href="./resultados.jsp">Resultados</a>
                <li><a href="./ranking.jsp">Ranking</a>
                <li><a href="./gacc001.jsp">Adicionar Conta</a>
                <li><a href="./gacc006.jsp">Remover Conta</a>
                <li><a href="./gacc009.jsp">Mudar Senha</a>
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
                <table style="width:100%" border=0 cellpadding="10" cellspacing="0">
<% if(null != request.getParameter("Home")){ 
    pageContext.forward("./main.jsp");
}                
else if(null != request.getParameter("Sair")){
    session.removeAttribute("user_email");
    pageContext.forward("./index.jsp");
}
else if(null != request.getParameter("Federacao")){
    pageContext.forward("./federacao.jsp");
}
else if(null != request.getParameter("cancelar")){//caso o botao cancelar for apertado
    pageContext.forward("./main.jsp");
}
else if(null != request.getParameter("ver")) {//caso botao ver apertado
    if (null != request.getParameter("evento")) {//se algum evento selecionado
        transacoes.EVNT tr1 = new transacoes.EVNT();
        int id_evento = Integer.parseInt(request.getParameter("evento"));
        EventoDO eventoaux = tr1.busca_evento_por_ID(id_evento);
        Vector provas = tr1.provas_de_evento(id_evento);
        %>
        <td height="400" width:="250" align = "left">
            <h3>Provas do evento <%=eventoaux.getNome_Do_Evento()%>
            </h3>
            <br><br>
        <%
        for (int i = 0; i < provas.size(); i++) {
            data.ProvasDO provaaux = ((ProvasDO)provas.elementAt(i));
            int id_tipo_prova = provaaux.getId_Tipo_De_Prova();
            data.TipoProvaDO tipoprovaaux = tr1.busca_tipo_prova_por_ID(id_tipo_prova);
            %>                        
            <%=tipoprovaaux.getNome_Da_Prova()%>
            <br>
            <%
        }                
    }
}
else {%>
                <td height="400" width:="250" align = "left">
                Selecionar evento:
                <select class = "selecao" name="evento">
                <%              
                transacoes.EVNT tr = new transacoes.EVNT();
                Vector eventos = tr.todos_eventos_();
                for (int i = 0; i < eventos.size(); i++) {
                    data.EventoDO eventoaux = ((EventoDO)eventos.elementAt(i));
                %>
                    <option value=<%=eventoaux.getId()%>><%= eventoaux.getNome_Do_Evento()%></option>
                <%
                }                    
                %>
                </select> <br><br>     
                <input type="submit" name="ver" class="botao3" value="Ver provas"><br><br>
<%}%>
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