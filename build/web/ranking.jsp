c<%-- 
    Document   : index
    Created on : 07/11/2016, 10:10:10
    Author     : Yuri
--%>

<!Isso eh tipo os imports>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes.EVNT" %>
<%@ page import="data.UsuarioDO" %>
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
%>
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
else {%>
                    
                    <center><font face = "Verdana" size = "8">Top 5</font></center>
                    <table style ="width:50% ; border-collapse: collapse;" align ="center" valign ="center" >
                        <style>
                            tr:nth-child(even){background-color: #f2f2f2}
                         </style>
                         <tr>
                             <th style = "text-align: left; padding: 8px;">Nome do Atleta</th>
                             <th style = "text-align: left; padding: 8px;">Vitórias</th>
                         </tr>

                         <tr>
                             <td style = "text-align: left; padding: 8px; background-color: #F58427; color: white;">Peter</td>
                             <td style = "text-align: left; padding: 8px; background-color: #F58427; color: white;">10</td>
                         </tr>

                         <% 
                             int i;  
                             for(i = 0; i < 5; i++){ 
                         %>
                         <tr>
                             <td style = "text-align: left; padding: 8px;"><% out.print(i); %></td>
                             <td style = "text-align: left; padding: 8px;">8</td>
                         </tr>
                         <%}%>
                    </table>

                                 
    
<!--         <tr>
             <td style = "text-align: left; padding: 8px;">Roger</td>
             <td style = "text-align: left; padding: 8px;">8</td>
         </tr>

         <tr>
             <td style = "text-align: left; padding: 8px;">Edward</td>
             <td style = "text-align: left; padding: 8px;">6</td>
         </tr>

         <tr>
             <td style = "text-align: left; padding: 8px;">George</td>
             <td style = "text-align: left; padding: 8px;">1</td>
         </tr>
         
                  <tr>
             <td style = "text-align: left; padding: 8px;">George</td>
             <td style = "text-align: left; padding: 8px;">1</td>
         </tr>-->

    </table>



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