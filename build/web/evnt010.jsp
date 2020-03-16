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
<%@ page import="data.EventoDO" %>
<%@ page import="data.ClubeDO" %>
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
    <form action="./evnt010.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
else if(null != request.getParameter("editar")) {//caso botao editar informacoes apertado
    if(null != request.getParameter("evento")) {//se tiver evento selecionado
        session.setAttribute("evento", request.getParameter("evento")); //guarda id do evento no servidor
        pageContext.forward("./evnt011.jsp"); //encaminha para pagina de edicao
    }
    else {
    pageContext.forward("./evnt010.jsp"); //se nao tiver evento, fica na pagina
    }
}
else if(null != request.getParameter("visualizar")) {//caso botao visualizar inscriçoes apertado
    session.setAttribute("evento", request.getParameter("evento")); //guarda evento no servidor
    pageContext.forward("./evnt006.jsp"); //encaminha para pagina de aprovacao de inscricoes
}
else if(null != request.getParameter("apagar")) { //caso botao apagar evento apertado
    if(null != request.getParameter("evento")) {//se tiver evento selecionado
        transacoes.EVNT tr1 = new transacoes.EVNT();
        int id_evento = Integer.parseInt(request.getParameter("evento"));
        boolean excluir = tr1.excluir_evento_por_ID(id_evento);
        if(excluir == true) {
        %>
        <td height="400" width:="250" align = "Center">
        <h3> Evento excluído com sucesso. </h3>
        <%
        }            
    }
    else {
    pageContext.forward("./evnt010.jsp"); //se nao tiver evento, fica na pagina
    }
}
else if(null != request.getParameter("ativar")) {//caso botao ativar apertado
    if(null != request.getParameter("evento")) {//se tiver evento selecionado
        transacoes.EVNT tr2 = new transacoes.EVNT();
        int id_evento = Integer.parseInt(request.getParameter("evento"));
        data.EventoDO eventoaux1 = tr2.busca_evento_por_ID(id_evento);
        if (eventoaux1.getFlag_Inscricao() == false) {
            eventoaux1.setFlag_Inscricao(true);
            boolean desativou = tr2.atualizar_evento(eventoaux1);
        }
    }
    else {
    pageContext.forward("./evnt010.jsp"); //se nao tiver evento, fica na pagina
    }
}
else if(null != request.getParameter("desativar")) {//caso botao desativar apertado
    if(null != request.getParameter("evento")) {//se tiver evento selecionado
        transacoes.EVNT tr3 = new transacoes.EVNT();
        int id_evento = Integer.parseInt(request.getParameter("evento"));
        data.EventoDO eventoaux2 = tr3.busca_evento_por_ID(id_evento);
        if (eventoaux2.getFlag_Inscricao() == true) {
            eventoaux2.setFlag_Inscricao(false);
            boolean desativou = tr3.atualizar_evento(eventoaux2);
        }
    }
    else {
    pageContext.forward("./evnt010.jsp"); //se nao tiver evento, fica na pagina
    }
}
else if(null != request.getParameter("resultados")) {//caso botao resultados apertado
    pageContext.forward("./ranking.jsp");
}
else if(null != request.getParameter("informar")) {//caso botao informar sobre evento apertado

    transacoes.EVNT tr = new transacoes.EVNT();
    data.UsuarioDO usuario = tr.buscar_usuario_email(email);
    int id_fed = usuario.getID_USER();
    %>
        <td height="400" width:="250" align = "left">
            <h3> Lista de email dos Clubes</h3><br><br>
        
    <%
    Vector listaClubes = tr.clube_federacao(id_fed);
    for (int i = 0; i < listaClubes.size(); i++) {
        ClubeDO clubeaux = (ClubeDO)listaClubes.elementAt(i);
        int id_usuario = clubeaux.getIdClube();
        UsuarioDO usuarioaux = tr.busca_usuario_por_ID(id_usuario);
        String emailaux = usuarioaux.getEmail_User();
        %>
        <%=emailaux%><br>
        <%
    }
    %>
    </td>
    <%
}
else {
                   
%>
                
		<td height="400" width:="250" align = "left">
                <div style="float:left;width:25%;">
		
                    Selecionar evento:
                    <select class = "selecao" name="evento">
                    <%              
                    transacoes.EVNT tr = new transacoes.EVNT();
                    data.UsuarioDO usuarioaux = tr.buscar_usuario_email(email);
                    int id_fed = usuarioaux.getID_USER();
                    Vector eventos_da_fed = tr.eventos_por_ID_federacao(id_fed);
                    for (int i = 0; i < eventos_da_fed.size(); i++) {
                        data.EventoDO eventoaux = ((EventoDO)eventos_da_fed.elementAt(i));
                    %>
                        <option value=<%=eventoaux.getId()%>><%= eventoaux.getNome_Do_Evento()%></option>
                    <%
                    }                    
                    %>
                    </select> <br><br>
					 
                    <input type="submit" name="editar" class="botao3" value="Editar Informações"><br><br>
					 
                    <input type="submit" name="visualizar" class="botao3" value="Visualizar Inscrições"><br><br>
					 
                    <input type="submit" name="apagar" class="botao3" value="Apagar Evento"><br><br>
						
                </div>
				
		<div style="float:right;width:35%;">
					 
                    <br>
                    <input type="submit" name="informar" class="botao3" value="Informar sobre evento"><br><br>
					 
                    <input type="submit" name="resultados" class="botao3" value="Resultados"><br><br>					 

                    <input type="submit" name="ativar" class="botao5" value="Ativar">
                    <input type="submit" name="desativar" class="botao5" value="Desativar"><br><br>
					 
                    <input type="submit" name="cancelar" class="botao3" value="Cancelar"><br><br>
				
		</div>				
		</td>                    
                </table>
            </td>
        </table>
<%
}
%>
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