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
if (false) {
    //verificacao manual de login
    pageContext.forward("main.jsp");
}%>
<html>
    <form action="./gacc009.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
                <div style="float:left;width:0%;"><h3><input type="submit" class = "botao3" name="Sair" value="Sair" formnovalidate=""</h3></div>
            
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
else if(null == request.getParameter("Ir") && null == request.getParameter("Cancelar")) {%>
<table>
    <h3>Mudar senha</h3>   
    <tr>
        <td>
            Senha atual:<br> 
            <input class="c" type="text" placeholder="Senha atual" name="senha_atual" required><br><br>     
        </td>                        
        <td>
            Nova senha:<br> 
            <input class="c" type="text" placeholder="Nova senha" name="nova_senha" required><br><br>     
        </td>  
    </tr>
    <tr>
        <td>
            </br>
            <input type="submit" name="Ir" class="botao3" value="Mudar"><br><br>
        </td>
        <td>
            </br>
            <input type="submit" name="Cancelar" class="botao3" value="Cancelar" formnovalidate=""><br><br>
        </td>
    </tr>
</table>
<%}else if(null != request.getParameter("Ir") && null == request.getParameter("Cancelar")){%>
<table>
    <h3>Mudar senha</h3>   
    <tr>
        <td>
            Senha atual:<br> 
            <input class="c" type="password" placeholder="Senha atual" name="senha_atual" required><br><br>     
        </td>                        
        <td>
            Nova senha:<br> 
            <input class="c" type="password" placeholder="Nova senha" name="nova_senha" required><br><br>     
        </td> 
    </tr>
    <tr>
        <td>
            </br>
            <input type="submit" name="Ir" class="botao3" value="Mudar"><br><br>
        </td>
        <td>
            </br>
            <input type="submit" name="Cancelar" class="botao3" value="Cancelar" formnovalidate=""><br><br>
        </td>
    </tr>
</table>
<%
    String passwd = request.getParameter("senha_atual");
    String nova = request.getParameter("nova_senha");
    transacoes.GACC tn = new transacoes.GACC();
    data.UsuarioDO usuario = tn.buscar_usuario_email(email);
    boolean check_senha = usuario.getPassword().equals(passwd);
    
    if(check_senha){
        //transacoes.Controlador tn = new transacoes.Controlador();
        //data.UsuarioDO usuario_at = tn.buscar_usuario_email(user);
        usuario.setPassword(nova);
        tn.atualizar_usuario(usuario);
    %>
        Senha atualizada com sucesso!
    <%}else{%>
        Senha incorreta!
    <%}
}%>
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