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
<%@ page import="data.FuncoesAuxiliares" %>
<%
    session.setAttribute("is_admin", false);
    session.setAttribute("is_federacao", false);
    session.setAttribute("is_clube", false);
    session.setAttribute("is_tecnico", false);
    session.setAttribute("is_atleta", false);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!Inicio do codigo HTML/JS>
<html>
    <form action="./index.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
                <div style="float:left;width:0%;"><h3><input type="submit" class = "botao3" name="Entrar" value="Entrar"</h3></div>
            
        </table>
    </form>
    <form action="./main.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
        <!Miolo contendo menu e navegacao>
        <table style="width:100%" border=1 cellpadding="0" cellspacing="0">
            <td width="300" bgcolor="lightblue" align="left" valign="top">
                <br><br><br>
                <ul class="a">
                    <li><a href="./calendario.jsp">Calendario</a></li>
                    <li><a href="./resultados.jsp">Resultados</a></li>
                    <li><a href="./ranking.jsp">Ranking</a></li>
                    <li><a href="./clubes.jsp">Clubes</a></li>
                    <li><a href="./contato.jsp">Contato</a></li>
                    <li><a href="./newsletter.jsp">Newsletter</a></li>
                </ul>
            </td>
            
            <td height="400" align = "center">
                <!Codigo verificando botao de entrar pressionado>
            <%  if (null != request.getParameter("Entrar")) {%>
                <!Formulario de login e senha>
                <table>    
                    <tr>
                        <td align="Center" valign="Center">
                            Email:<br>
                            <input type="text" name="email" /><br><br>
                            Senha:<br>
                            <input type="password" name="senha" /><br><br>
                            <input type="submit" name="Login" class="botao3" value="Entrar"><br><br>
                            <input type="submit" name="Esqueci" class="botao3" value="Esqueci minha senha">
                        </td>
                    </tr>
                </table>
            <% } //codigo verificando a validade de login e senha
                else if (null != request.getParameter("Esqueci")) {%>
                <!Formulario de login e senha>
                <table>    
                    <tr>
                        <td align="Center" valign="Center">
                            Email:<br>
                            <input type="text" name="email" /><br><br>
                            <input type="submit" name="esqueciminhasenha" class="botao3" value="Enviar nova senha">
                        </td>
                    </tr>
                </table>
            <% }else if (null != request.getParameter("Login")) {
                String user = request.getParameter("email");
                String passwd = request.getParameter("senha");
                transacoes.GACC tn = new transacoes.GACC();
                data.UsuarioDO usuario = tn.buscar_usuario_email(user);
                if (usuario != null) { //caso nao encontre ninguem, nao prosseguir com acao
                    boolean check_login = usuario.getPassword().equals(passwd);
                    if (check_login) {
                        session.setAttribute("user_id", usuario.getID_USER());
                        session.setAttribute("user_email", user);
                        session.setAttribute("is_admin", usuario.getHabilitado_ADMIN());
                        session.setAttribute("is_federacao", usuario.getHabilitado_FEDERACAO());
                        session.setAttribute("is_clube", usuario.getHabilitado_CLUBE());
                        session.setAttribute("is_tecnico", usuario.getHabilitado_TECNICO());
                        session.setAttribute("is_atleta", usuario.getHabilitado_ATLETA());
                        pageContext.forward("./main.jsp");
                    } else { //senha incorreta pede o login novamente com a mensagem de erro
            %>
            
            
            <h2>Usuário ou senha incorretos!</h2><br>
                <!Formulario de login e senha>
                <table>    
                    <tr>
                        <td align="Center" valign="Center">
                            Email:<br>
                            <input type="text" name="email" /><br><br>
                            Senha:<br>
                            <input type="password" name="senha" /><br><br>
                            <input type="submit" name="Login" class="botao3" value="Entrar"><br><br>
                            <input type="submit" name="Esqueci" class="botao3" value="Esqueci minha senha">
                        </td>
                    </tr>
                </table>
            <%
                }
            } else {
            %>    
            <h2>Usuário ou senha incorretos!</h2><br>
                <!Formulario de login e senha>
                <table>    
                    <tr>
                        <td align="Center" valign="Center">
                            Email:<br>
                            <input type="text" name="email" /><br><br>
                            Senha:<br>
                            <input type="password" name="senha" /><br><br>
                            <input type="submit" name="Login" class="botao3" value="Entrar"><br><br>
                            <input type="submit" name="Esqueci" class="botao3" value="Esqueci minha senha">
                        </td>
                    </tr>
                </table>
            <%
                }
            } else if (null != request.getParameter("Home")) { %>
            <h2>Bem vindo ao sistema de federações FREMO</h2>
            
            <%} 
            else if (null != request.getParameter("esqueciminhasenha")) {
                String user = request.getParameter("email");
                transacoes.GACC tn = new transacoes.GACC();
                UsuarioDO usuario = tn.buscar_usuario_email(user);
                FuncoesAuxiliares FA = new FuncoesAuxiliares(); 
                if (usuario != null) { //caso nao encontre ninguem, nao prosseguir com acao 
                    //COLOCAR ACAO DE ENVIAR EMAIL
                    usuario.setPassword(FA.randomString(8));
                    tn.atualizar_usuario(usuario); %>
                    <td height="400" align = "center">
                    <h2>Senha enviada com sucesso!</h2><br>
                    Sua nova senha é: <font color="red"><%=usuario.getPassword()%></font><br>
                    Ssshhh... Não conte para ninguém<br><br>
                    <!Colocar o email>
                    <table>    
                        <tr>
                            <td align="Center" valign="Center">
                                Email:<br>
                                <input type="text" name="email" /><br><br>
                                <input type="submit" name="esqueciminhasenha" class="botao3" value="Enviar nova senha">
                            </td>
                        </tr>
                    </table>
                    
                <%} else{ //senha incorreta pede o login novamente com a mensagem de erro%>
                    <td height="400" align = "center">
                    <h2>E-mail não encontrado!</h2><br>
                    <!Colocar o email>
                    <table>    
                        <tr>
                            <td align="Center" valign="Center">
                                Email:<br>
                                <input type="text" name="email" /><br><br>
                                <input type="submit" name="esqueciminhasenha" class="botao3" value="Enviar nova senha">
                            </td>
                        </tr>
                    </table>
                <%}
            }
            else { %>
            <h2>Bem vindo ao sistema de federações FREMO</h2>
            <%}%>
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
