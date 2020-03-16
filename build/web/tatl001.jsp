<%-- 
    Document   : index
    Created on : 07/11/2016, 10:10:10
    Author     : Yuri
--%>

<!Isso eh tipo os imports>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes.TATL" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="data.TrocaAtletaDO" %>
<%@ page import="data.AtletaDO" %>
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
}
String action = request.getParameter("action");
if (null == action) {
    action = "showRequisitionForm";
}
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
else {
    if (action.equals("showRequisitionForm")){
    transacoes.TATL tn = new transacoes.TATL();
    Vector atletas = tn.vetor_troca_atletas();
    for(int i = 0; i < atletas.size(); i++) {
        TrocaAtletaDO Troca = (TrocaAtletaDO)atletas.elementAt(i);
        AtletaDO atl = tn.busca_atleta_por_ID_atleta(Troca.getIdAtleta());
        ClubeDO clb = tn.busca_clube_por_ID_clube(Troca.getIdClubeAntigo());
        ClubeDO clb2 = tn.busca_clube_por_ID_clube(Troca.getIdClubeNovo());
        
%>
                    <table>
                        <br>
                        <text>Atleta: <%=atl.getNOME_ATLETA()%> <br> <%=clb.getNomeClube()%> >>> <%=clb2.getNomeClube()%> </text>
                        <a href=tatl001.jsp?action=showApprovalForm&id_atl=<%=atl.getID_ATLETA()%>&id_clb=<%=clb2.getIdClube()%>>Aprovar</a>
                        <a href=tatl001.jsp?action=showRepprovalForm&id_atl=<%=atl.getID_ATLETA()%>&id_clb=<%=clb.getIdClube()%>>Reprovar</a>
                        <br>
                    </table>
<%    }
    }
    if (action.equals("showApprovalForm")) {
        transacoes.TATL tn = new transacoes.TATL();
        int id_atleta = Integer.parseInt(request.getParameter("id_atl"));
        int id_clube = Integer.parseInt(request.getParameter("id_clb"));
        boolean result = false;
        try {
            result = tn.atualizar_clube_atleta(id_atleta, id_clube);
        } catch (Exception e) {
%>           <%= e.toString() %>
<%
       }
       if ( result ) {
         // avisar usuario que transacao foi feita com sucesso
%>
          Troca aprovada com sucesso!
<%     } else {
%>
          Erro ao Aprovar troca!
<%     }
    }
    if (action.equals("showRepprovalForm")) {
        transacoes.TATL tn = new transacoes.TATL();
        int id_atleta = Integer.parseInt(request.getParameter("id_atl"));
        int id_clube = Integer.parseInt(request.getParameter("id_clb"));
        boolean result = false;
        try {
            result = tn.atualizar_clube_atleta(id_atleta, id_clube);
        } catch (Exception e) {
%>           <%= e.toString() %>
<%
       }
       if ( result ) {
         // avisar usuario que transacao foi feita com sucesso
%>
          Troca reprovada com sucesso!
<%     } else {
%>
          Erro ao Reprovar Troca!
<%     }
    }
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