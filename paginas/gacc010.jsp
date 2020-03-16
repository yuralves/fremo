<%-- 
    Document   : index
    Created on : 07/11/2016, 10:10:10
    Author     : Yuri
--%>

<!Isso eh tipo os imports>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes.GACC" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="data.FederacaoDO" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<!Inicio do codigo HTML/JS>
<%String email = (String)session.getAttribute("user_email");
boolean is_admin = (Boolean)session.getAttribute("is_admin");
boolean is_federacao = (Boolean)session.getAttribute("is_federacao");
boolean is_clube = (Boolean)session.getAttribute("is_clube");
boolean is_tecnico = (Boolean)session.getAttribute("is_tecnico");
boolean is_atleta = (Boolean)session.getAttribute("is_atleta");
if (!is_federacao) {
    //verificacao manual de login
    pageContext.forward("main.jsp");
}%>
<html>
    <form action="./gacc010.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
        <head>
            <link rel="stylesheet" type="text/css" href="Estilos.css">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>FREMO</title>
        </head>
        <!Tabela superior>
        <table style="width:100%" border=1 cellpadding="0" cellspacing="0" bgcolor="">
            <td align="Left" valign="top" height = "70">
                
                <br>
                <div style="float:left;width:50%;"><h3><input type="submit" class = "botao3" name="Home" value="Home" formnovalidate=""></h3></div>
                <div style="float:left;width:39%;"><h3>Header</h3></div>
                <div style="float:left;width:0%;"><h3><input type="submit" class = "botao3" name="Sair" value="Sair" formnovalidate=""></h3></div>
            
        </table>
        <!Miolo contendo menu e navegacao>
        <table style="width:100%" border=1 cellpadding="0" cellspacing="0">
            <td width="300" bgcolor="lightblue" align="left" valign="top">
                <br><br><br>
                <ul class="a">
                <li><a href="./calendario.jsp">Calendario</a>
                <li><a href="./resultados.jsp">Resultados</a>
                <li><a href="./ranking.jsp">Ranking</a>
                    
                <li><a href="./cclb001.jsp">Controle de clubes</a>
                <li><a href="./cclb002.jsp">Enviar e-mail para clube</a>
                <li><a href="./cclb003.jsp">Atribuir mensalidade</a>
                    
                <li><a href="./evnt001.jsp">Criar evento</a>
                <li><a href="./evnt004.jsp">Atualizar tempo das provas</a>  
                <li><a href="./evnt006.jsp">Aprovar inscricoes</a>
                <li><a href="./evnt010.jsp">Alterar evento</a>
                    
                <li><a href="./gacc010.jsp">Editar cadastro</a>
                <li><a href="./gacc013.jsp">Criar clube</a>
                <li><a href="./gacc014.jsp">Excluir clube</a>
                    
                <li><a href="./tatl001.jsp">Aprovar troca de atleta</a>
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
else if(null != request.getParameter("Cancelar")){
    pageContext.forward("./main.jsp");
}
else if(null == request.getParameter("Ir") && null == request.getParameter("Cancelar")){%>
<table>
    <h3>Alterar dados de cadastro</h3>   
    <tr>
        Nome da federação:<br> 
        <input class="c" type="text" name="nome" maxlengh="64" required><br><br>     
    </tr>
    <tr>
        Endereço:<br> 
        <input class="c" type="text" name="endereco" maxlengh="64" required><br><br>                            
    </tr>
    <tr>
        Site:<br> 
        <input class="c" type="url" name="site" maxlengh="64" required><br><br>                        
    </tr>
    <tr>
        Logo:<br> 
        <input class="c" type="url" name="logo" maxlengh="64" required><br><br>                        
    </tr>
    <tr>
        <td>
            </br>
            <input type="submit" name="Ir" class="botao3" value="Atualizar"><br><br>
        </td>
        <td>
            </br>
            <input type="submit" name="Cancelar" class="botao3" value="Cancelar" formnovalidate=""><br><br>
        </td>
    </tr>
</table>
<%}else if(null != request.getParameter("Ir") && null == request.getParameter("Cancelar")){
    String nome = request.getParameter("nome");
    String endereco = request.getParameter("endereco");
    String site = request.getParameter("site");
    String logo = request.getParameter("logo");

    transacoes.GACC tn = new transacoes.GACC();
    data.UsuarioDO usuario = tn.buscar_usuario_email(email);
    int id_usuario = usuario.getID_USER();
    data.FederacaoDO federacao = tn.busca_federacao_por_ID_federacao(id_usuario);
    
    federacao.setNomeFEDERACAO(nome);
    federacao.setEnderecoFederacao(endereco);
    federacao.setSiteFederacao(site);
    federacao.setImgUrl(logo);

    tn.atualizar_federacao(federacao);
%>
    <h3>Dados atualizados!</h3>
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