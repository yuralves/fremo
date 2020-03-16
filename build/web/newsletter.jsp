<%-- 
    Document   : index
    Created on : 07/11/2016, 10:10:10
    Author     : Yuri
--%>

<!Isso eh tipo os imports>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes.VSTN" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="data.ClubeDO" %>
<%@ page import="data.MensagemDO" %>
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
    <form action="./newsletter.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
        <head>
            <link rel="stylesheet" type="text/css" href="Estilos.css">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>FREMO</title>
        </head>
        
        <!Tabela superior>
        <table style="width:100%" border=1 cellpadding="0" cellspacing="0" bgcolor="">
            <td align="Left" valign="top" height = "70">
                <br>
                <div style="float:left;width:50%;"><h3><input type="submit" class = "botao3" name="Home" value="Home" formnovalidate></h3></div>
                <div style="float:left;width:39%;"><h3>Header</h3></div>
                <%if ( session.getAttribute("user_email") == null) {%>
                    <div style="float:left;width:0%;"><h3><input type="submit" class = "botao3" name="Entrar" value="Entrar" formnovalidate</h3></div>
                <%}else{%>
                    <div style="float:left;width:0%;"><h3><input type="submit" class = "botao3" name="Sair" value="Sair" formnovalidate</h3></div>
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
            <td height="400" align="center"> 
                <table>
                    <% if(null != request.getParameter("Home")){ 
                    pageContext.forward("./main.jsp");
                    }                
                    else if(null != request.getParameter("Sair")){
                        session.removeAttribute("user_email");
                        pageContext.forward("./main.jsp");
                    }     
                    else if(null != request.getParameter("Entrar")){
                        pageContext.forward("./index.jsp");
                    }   
            else if(null != request.getParameter("Cadastrar")){
                String user = request.getParameter("email");
                transacoes.VSTN tn = new transacoes.VSTN();
                data.NewsletterDO usuario = tn.buscar_newsletter_email(user);

                if(user!=null && !user.isEmpty()){
                    if(null != usuario){
                        %>
                            <h3>Usuário já existe</h3>
                        <%}

                    else{
                        transacoes.VSTN tn2 = new transacoes.VSTN();
                        data.NewsletterDO usuario2 = new data.NewsletterDO();
                        usuario2.setEmail(user);
                        tn2.incluir_newsletter_email(usuario2);
                        %>
                        <table>    
                            <tr>
                                <td height="400" width:="500" align = "Center">
                                        <h3>E-mail cadastrado com sucesso</h3>
                            </tr>
                        </table>
                        <%}
                }
            }
            else if(null != request.getParameter("Descadastrar")){
    String user = request.getParameter("email");
    transacoes.VSTN tn = new transacoes.VSTN();
    data.NewsletterDO usuario = tn.buscar_newsletter_email(user);
    if(user!=null && !user.isEmpty()){
        if(null == usuario){
            %>
                <h3>E-mail não cadastrado</h3>
            <%}

            else{
            transacoes.VSTN tn2 = new transacoes.VSTN();
            data.NewsletterDO usuario2 = new data.NewsletterDO();
            usuario2.setEmail(user);
            tn2.excluir_newsletter_email(usuario2);
            %>
                <h3>E-mail descadastrado com sucesso</h3>
            <%}
            }
}
        else {%>

            <h2>Receba nossa newletter!</h2><br>
                <!Inserir email para newsletter>  
            <tr>
                <td align="Center" valign="Center">        
                    Email:<br>  
                    <input type="text" name="email" required/><br><br>  
                    <input type="submit" name="Cadastrar" class="botao3" value="Cadastrar email">
                    <input type="submit" name="Descadastrar" class="botao3" value="Descadastrar email"><br><br>
                </td>
            </tr>
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
