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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<!Inicio do codigo HTML/JS>
<%String email = (String)session.getAttribute("user_email");
boolean is_admin = (Boolean)session.getAttribute("is_admin");
boolean is_federacao = (Boolean)session.getAttribute("is_federacao");
boolean is_clube = (Boolean)session.getAttribute("is_clube");
boolean is_tecnico = (Boolean)session.getAttribute("is_tecnico");
boolean is_atleta = (Boolean)session.getAttribute("is_atleta");
if (!is_atleta) {
    //verificacao manual de login
    pageContext.forward("main.jsp");
}%>
<html>
    <form action="./gacc002.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
                <li><a href="./Ranking.jsp">Ranking</a>
                <li><a href="./catl001.jsp">Controle de presenca</a> 
                <li><a href="./gacc002.jsp">Editar cadastro</a> 
                <li><a href="./trtn002.jsp">Ver progresso</a>
                <li><a href="./trtn005.jsp">Fazer exercicio</a>
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
        <td>
            Nome:<br> 
            <input class="c" type="text" name="nome" required><br><br>     
        </td>                        
        <td>
            Sobrenome:<br> 
            <input class="c" type="text" name="sobrenome" required><br><br>     
        </td> 
    </tr>
    <tr>
        <td>
            Rg:<br> 
            <input class="c" type="text" name="rg" maxlengh="12" required><br><br>     
        </td>                        
        <td>
            CPF (123.456.789-00):<br> 
            <input class="c" type="text" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" name="cpf" required
                   title="O formato correto é 123.456.789-00!"><br><br>     
        </td> 
    </tr>
    <tr>
        <td>
            Data de nascimento:<br> 
            <input class="b" type="number" placeholder="Dia (dd)" name="dia" size="2"  min="01" max="31" required>
            <input class="b" type="number" placeholder="Mes (mm)" name="mes" size="2" min="01" max="12" required>
            <input class="b" type="number" placeholder="Ano (yyyy)" name="ano" size="4" max="2016" min="1910" required><br><br>                
        </td>                        
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
    String sobrenome = request.getParameter("sobrenome");
    String rg = request.getParameter("rg");
    String cpf = request.getParameter("cpf");
    String dia = request.getParameter("dia");
    String mes = request.getParameter("mes");
    String ano = request.getParameter("ano");
    String data_nascimento = ano.concat("-");
    data_nascimento = data_nascimento.concat(mes);
    data_nascimento = data_nascimento.concat("-");
    data_nascimento = data_nascimento.concat(dia);

    transacoes.GACC tn = new transacoes.GACC();
    data.UsuarioDO usuario = tn.buscar_usuario_email(email);
    int id_usuario = usuario.getID_USER();
    data.AtletaDO atleta = tn.busca_atleta_por_ID_atleta(id_usuario);
    
    atleta.setNOME_ATLETA(nome);
    atleta.setSOBRENOME_ATLETA(sobrenome);
    atleta.setRg_ATLETA(rg);
    atleta.setCpf_ATLETA(cpf);
    atleta.setData_nascimento_ATLETA(data_nascimento);
    tn.atualizar_info_atleta(atleta);
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