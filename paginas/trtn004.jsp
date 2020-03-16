<%-- 
    Document   : index
    Created on : 07/11/2016, 10:10:10
    Author     : Yuri
--%>

<!Isso eh tipo os imports>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes.TRTN" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="data.ExercicioDO" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<!Inicio do codigo HTML/JS>
<%String email = (String)session.getAttribute("user_email");
boolean is_admin = (Boolean)session.getAttribute("is_admin");
boolean is_federacao = (Boolean)session.getAttribute("is_federacao");
boolean is_clube = (Boolean)session.getAttribute("is_clube");
boolean is_tecnico = (Boolean)session.getAttribute("is_tecnico");
boolean is_atleta = (Boolean)session.getAttribute("is_atleta");
if (!is_tecnico) {
    //verificacao manual de login
    pageContext.forward("main.jsp");
}%>
<html>
    <form action="./trtn004.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
                <li><a href="./gacc011.jsp">Editar cadastro</a>
                <li><a href="./trtn001.jsp">Atribuir treinos</a>
                <li><a href="./trtn002.jsp">Ver progresso</a>
                <li><a href="./trtn003.jsp">Criar treino</a>
                <li><a href="./trtn004.jsp">Criar exercicio</a>
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
pageContext.forward("./main.jsp");
}                
else if(null != request.getParameter("Sair")){
    session.removeAttribute("user_email");
    pageContext.forward("./index.jsp");
}
else if(null != request.getParameter("criar")){//caso o botao criar for apertado
       String nomeexercicio = request.getParameter("nomeexercicio");
       data.TipoExercicioDO exercicio = new data.TipoExercicioDO(); 
       exercicio.setNomeExercicio(nomeexercicio);
       transacoes.TRTN tn = new transacoes.TRTN();  //Cria uma transacao 
       boolean criou = tn.criar_tipoexercicio(exercicio);
       if (criou==true)
        {
            %> Exercicio criado com sucesso
            <%
               
            }
            else {
           %> Erro ao criar exercicio
            <%    
}
}//Seta  nome do evento
else if(null != request.getParameter("cancelar")){//caso o botao cancelar for apertado
        /*remover atributos necessarios*/
        pageContext.forward("./main.jsp");
}
else {%>
	<td height="100" width:="400" align = "left">
                <div style="float:left;width:100%;">
								<br><br>
                    Criar exercicio:
					
							<br><br>
                  
                    <input type="text" name="nomeexercicio" class="c" placeholder="Nome Exercicio" required>
					 		<div style="float:right;width:30%;">
							
					 <input type="submit" name="criar" class="botao3" value="Criar"><br><br>
					 <input type="submit" name="cancelar" class="botao3" value="Cancelar"><br><br>
                   	 		</div>
       						</div>
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