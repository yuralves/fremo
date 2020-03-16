<%-- 
    Document   : index
    Created on : 07/11/2016, 10:10:10
    Author     : Yuri
--%>

<!Isso eh tipo os imports>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes.CATL" %>
<%@ page import="data.AtletasDevedoresDO" %>
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
if (!is_clube) {
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
    </form>    
        <!Miolo contendo menu e navegacao>
        <table style="width:100%" border=1 cellpadding="0" cellspacing="0">
            <td width="300" bgcolor="lightblue" align="left" valign="top">
            <br><br><br>
            <ul class="a">
                <li><a href="./calendario.jsp">Calendario</a>
                <li><a href="./resultados.jsp">Resultados</a>
                <li><a href="./ranking.jsp">Ranking</a>
                <li><a href="./catl002.jsp">Controle de pagamento</a>
                <li><a href="./catl003.jsp">Enviar e-mail de cobranca</a>
                <li><a href="./catl004.jsp">Atribuir mensalidade</a>
                <li><a href="./evnt002.jsp">Alocar atletas</a>
                <li><a href="./gacc003.jsp">Criar tecnico</a>
                <li><a href="./gacc004.jsp">Criar atletas</a>
                <li><a href="./gacc007.jsp">Apagar tecnico</a>
                <li><a href="./gacc008.jsp">Apagar atletas</a>
                <li><a href="./gacc015.jsp">Atribuir atleta a tecnico</a>
                <li><a href="./gacc018.jsp">Editar cadastro</a>
                <li><a href="./tatl002.jsp">Troca de atleta</a>
                <li><a href="./tatl003.jsp">Aprovar troca de atleta</a>
                <li><a href="./vstn003.jsp">Visualizar mensagens</a>
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
                <table>
<% if(null != request.getParameter("Home")){ 
pageContext.forward("./index.jsp");
}                
else if(null != request.getParameter("Sair")){
    session.removeAttribute("user_email");
    pageContext.forward("./index.jsp");
}
else if(null != request.getParameter("Submeter")){
    int ano = Integer.parseInt(request.getParameter("ano"));
    String mes = request.getParameter("meses");
    transacoes.CATL tn = new transacoes.CATL();
    Vector atletas = tn.cobrar_atletas(id, mes, ano);
    for(int i=0; i<atletas.size (); i++){
        AtletasDevedoresDO devedores = (AtletasDevedoresDO)atletas.elementAt(i);
        
        %><br><br>  Atleta: <%=devedores.getNome_Do_Atleta()%><%
        %><br><br>  Email: <%=devedores.getEmail_Do_Atleta()%><%
        %><br><br>  Valor a ser pago: <%=devedores.getMensalidade()%><br><%
    }
}
else {
                    transacoes.CATL tn = new transacoes.CATL();
                    Vector atletas = tn.atleta_clube(id);%>
                <form action="./catl003.jsp" method="post">
                    CATL 003 <br><br>
                    Ano: 
                    <input type="text" name="ano">
                    <br><br>
                    <select class = "selecao" name="meses">
                    <option value="Selecione mes">Selecione m&ecirc;s</option>
                    <option value="Janeiro">Janeiro</option>
                    <option value="Fevereiro">Fevereiro</option>
                    <option value="Marco">Mar&ccedil;o</option>
                    <option value="Abril">Abril</option>
                    <option value="Maio">Maio</option>
                    <option value="Junho">Junho</option>
                    <option value="Julho">Julho</option>
                    <option value="Agosto">Agosto</option>
                    <option value="Setembro">Setembro</option>
                    <option value="Outubro">Outubro</option>
                    <option value="Novembro">Novembro</option>
                    <option value="Dezembro">Dezembro</option>
                    </select>
                    <br><br>
                    <input type="submit" name="Submeter" value="Submeter" class="botao">
                </form>    
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