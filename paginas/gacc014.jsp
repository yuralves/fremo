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
<%@ page import="data.ClubeDO" %>
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
    <form action="./gacc014.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
                <div style="float:left;width:0%;"><h3><input type="submit" class = "botao3" name="Sair" value="Sair" formnovalidate></h3></div>
            
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
                        <input type="submit" class="botao4" name="Admin" value="Admin" formnovalidate>
                    <%} if(is_federacao){%>
                        <input type="submit" class="botao4" name="Federacao" value="Federacao" formnovalidate>
                    <%} if(is_clube){%>
                        <input type="submit" class="botao4" name="Clube" value="Clube" formnovalidate>
                    <%} if(is_tecnico){%>
                        <input type="submit" class="botao4" name="Tecnico" value="Tecnico"formnovalidate>
                    <%} if(is_atleta){%>
                        <input type="submit" class="botao4" name="Atleta" value="Atleta" formnovalidate>
                    <%}%>
                </table>
                <table>
                <% if(null != request.getParameter("Home")){ 
                pageContext.forward("./main.jsp");
                }                
                else if(null != request.getParameter("Sair")){
                    session.removeAttribute("user_email");
                    pageContext.forward("./index.jsp");
                }
                else if(null != request.getParameter("Confirmar")){
                    transacoes.GACC tn = new transacoes.GACC();
                    int idExcluido = Integer.parseInt(request.getParameter("clube"));
                    UsuarioDO excluir = tn.busca_usuario_por_ID(idExcluido);
                    ClubeDO clube = tn.busca_clube_por_ID_clube(idExcluido);
                    excluir.setHabilitado_CLUBE(false);
                    boolean bool = tn.atualizar_usuario(excluir);
                    if(bool){%>
                        <td height="400" width:="250" align = "Center">
                        <h3><%=clube.getNomeClube()%> excluído com sucesso</h3>
                        Endereço de e-mail <font color="blue"><u><%=excluir.getEmail_User()%></u></font> desabilitado <br><br>
                        <input type="submit" name="Voltar" class="botao3" value="Voltar">
                    <%}
                    else{%>
                        <td height="400" width:="250" align = "Center">
                        <h3>Erro na operação</h3>
                        <input type="submit" name="Voltar" class="botao3" value="Voltar">
                    <%}
                }
                else {
                    transacoes.GACC tn = new transacoes.GACC();
                    UsuarioDO usuario = tn.buscar_usuario_email(email);
                    int idFederacao = usuario.getID_USER();
                    Vector clubes = tn.buscar_clubes_por_ID_federacao(idFederacao);%>
                    <table>    
                    <tr>
                        <td height="400" width:="500" align = "Center" valign="center">
                            <h3>Excluir conta de clube</h3><br>
                            Selecione o clube:<br>
                            <select style="width: 250px;" name="clube" required>
                                <option disabled selected value> Selecione um clube </option>
                                <%for(int i = 0; i < clubes.size(); i++) { //for loop para cada clube
                                    ClubeDO clube = (ClubeDO)clubes.elementAt(i); //escolhe o i-esimo clube e faz o html
                                    UsuarioDO cl = tn.busca_usuario_por_ID(clube.getIdClube());
                                    if(cl.getHabilitado_CLUBE()){
                                     %><option value="<%= clube.getIdClube() %>"><%= clube.getNomeClube() %></option>
                                <%}} // end loop clubes%>
                            </select><br><br>
                            <input type="submit" name="Confirmar" class="botao3" value="Confirmar">
                        </td>
                    </tr>
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