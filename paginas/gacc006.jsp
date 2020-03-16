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
<%@ page import="data.ClubeDO" %>
<%@ page import="data.TecnicoDO" %>
<%@ page import="data.AtletaDO" %>
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
if (!is_admin) {
    //verificacao manual de login
    pageContext.forward("main.jsp");
}%>
<html>
    <form action="./gacc006.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
                <table>
<% if(null != request.getParameter("Home")){ 
pageContext.forward("./index.jsp");
}                
else if(null != request.getParameter("Sair")){
    session.removeAttribute("user_email");
    pageContext.forward("./index.jsp");
}
else if(null == request.getParameter("Inativar")){%>
<table>
    <h3>Inativar conta de federação</h3>   
    <tr>
        <td>
            <input type="text" name="email" />
        </td>                        
        <td>
            <input type="submit" class = "botao3" name="Inativar" value="Inativar federação">
        </td>                        
    </tr>
</table>
<%}else if(null != request.getParameter("Inativar")){%>
    <table>    
        <h3>Inativar conta de federação</h3> 
        <tr>
            <td>
                <input type="text" name="email" />
            </td>                        
            <td>
                <input type="submit" class = "botao3" name="Inativar" value="Inativar federação">
            </td>                        
        </tr>
        <%String user = request.getParameter("email");
        transacoes.GACC tn = new transacoes.GACC();
        data.UsuarioDO usuario_fed = tn.buscar_usuario_email(user);
        if (usuario_fed != null) { //caso nao encontre ninguem, nao prosseguir com acao
            if (usuario_fed.getHabilitado_FEDERACAO()){
                
                //desabilita federacao
                usuario_fed.setHabilitado_FEDERACAO(false);
                tn.atualizar_usuario(usuario_fed);
                                
                int id_federacao = usuario_fed.getID_USER();
                Vector clubes = tn.vetor_clubes_Id_federacao(id_federacao);
                for(int i = 0; i < clubes.size(); i++){
                    //desabilita todos os clubes dessa federação
                    ClubeDO Clube = (ClubeDO) clubes.elementAt(i);
                    int id_clube = Clube.getIdClube();
                    data.UsuarioDO usuario_clube = tn.busca_usuario_por_ID(id_clube);
                    usuario_clube.setHabilitado_CLUBE(false);
                    tn.atualizar_usuario(usuario_clube);
                    
                    Vector tecnicos = tn.vetor_tecnicos_Id_clube(id_clube);
                    for(int j = 0; j < tecnicos.size(); j++){
                        //desabilita todos os tecnicos desses clubes
                        TecnicoDO Tecnico = (TecnicoDO) tecnicos.elementAt(j);
                        int id_tecnico = Tecnico.getIdTecnico();
                        data.UsuarioDO usuario_tecnico = tn.busca_usuario_por_ID(id_tecnico);
                        usuario_tecnico.setHabilitado_TECNICO(false);
                        tn.atualizar_usuario(usuario_tecnico);
                    }
                    Vector atletas = tn.vetor_atletas_Id_clube(id_clube);
                    for(int j = 0; j < atletas.size(); j++){
                        //desabilita todos os atletas desses clubes
                        AtletaDO Atleta = (AtletaDO) atletas.elementAt(j);
                        int id_atleta = Atleta.getID_ATLETA();
                        data.UsuarioDO usuario_atleta = tn.busca_usuario_por_ID(id_atleta);
                        usuario_atleta.setHabilitado_ATLETA(false);
                        tn.atualizar_usuario(usuario_atleta);
                    }
                }
                
        %>
        A federação foi excluída com sucesso! </br>
            <%}else{%>
                Desculpa, essa conta não é de uma federação</br>
            <%}
            }else{%>
            Esse usuário não existe</br>
            <%}%>
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