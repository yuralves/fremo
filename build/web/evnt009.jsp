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
<%@ page import="data.ProvasDO" %>
<%@ page import="data.TipoProvaDO" %>
<%@ page import="data.ListaAtletasDO" %>
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
    <form action="./evnt009.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
    int id_tipo_prova = Integer.parseInt(request.getParameter("tipoprova"));
    transacoes.EVNT tr1 = new transacoes.EVNT();
    %>
    <h3>Resultados da prova <%=(tr1.busca_tipo_prova_por_ID(id_tipo_prova)).getNome_Da_Prova()%></h3>
    <br><br>
    <div style="float:left;width:50%;">
        <h4>Nome</h4>
    </div>
    <div style="float:left;width:50%;">
        <h4> Tempo (min)</h4>
    </div>
    <%    
    Vector provas_do_tipo = tr1.provas_de_tipo_prova(id_tipo_prova);
    for (int i = 0; i < provas_do_tipo.size(); i++) {
        data.ProvasDO provaaux = ((ProvasDO)provas_do_tipo.elementAt(i));
        int id_provaaux = provaaux.getId();
        Vector listaatletas = tr1.buscar_lista_atleta_por_IDProvas(id_provaaux);
        for (int j = 0; j < listaatletas.size(); j++) {
            data.ListaAtletasDO listaatletaaux = ((ListaAtletasDO)listaatletas.elementAt(j));
            data.AtletaDO atletaaux = tr1.busca_atleta_por_ID_atleta(listaatletaaux.getId_ATLETA());
            %>
            <div style="float:left;width:50%;">
            <%=atletaaux.getNOME_ATLETA()%> <%=atletaaux.getSOBRENOME_ATLETA()%>
            </div>
            <div style="float:left;width:50%;">
            <%=Float.toString(listaatletaaux.getResultado())%>
            </div>
            <br>
            <%            
        }    
    }
}
else {%>
                <td height="400" width:="250" align = "left">
                Selecionar tipo de prova:
                <select class = "selecao" name="tipoprova">
                <%            
                transacoes.EVNT tr = new transacoes.EVNT();
                Vector tiposprovas = tr.todas_provas();
                for (int i = 0; i < tiposprovas.size(); i++) {
                    data.TipoProvaDO tipoprovaaux = ((TipoProvaDO)tiposprovas.elementAt(i));
                %>
                    <option value=<%=tipoprovaaux.getId()%>><%= tipoprovaaux.getNome_Da_Prova()%></option>
                <%
                }                    
                %>
         
                <input type="submit" name="ver" class="botao3" value="Ver resultados"><br><br>


<%}%>
                </table>
            </td>
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