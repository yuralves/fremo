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
<%@ page import="data.TreinoDO" %>
<%@ page import="data.AtletaDO" %>
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
    <form action="./trtn001.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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

else if(null != request.getParameter("cancelar")){//caso o botao cancelar for apertado
        /*remover atributos necessarios*/
        pageContext.forward("./main.jsp");
}


// CRIAR ELSE IF PARA O ATRIBUIR TREINO!
else if(null != request.getParameter("atribuir")){
 
       String idtreino = request.getParameter("idtreino");
       String idatleta = request.getParameter("atleta");
       int idTreino2 = Integer.parseInt(idtreino, 10);//Transforma string em valor inteiro
       int idAtleta2 = Integer.parseInt(idatleta, 10);//Transforma string em valor inteiro
       data.AtletaHasTreinoDO treino = new data.AtletaHasTreinoDO(); 
       treino.setId_TREINO(idTreino2);
       treino.setId_ATLETA(idAtleta2);
       transacoes.TRTN tn = new transacoes.TRTN();  //Cria uma transacao 
       boolean idtreinoatribuido = tn.incluir_Treino_a_Atleta(treino);
              
       if (idtreinoatribuido==true)
        {
            %>Treino Atribuido com sucesso
            <%
               
            }
}

     
else {
 %>   
            <td height="150" width:="250" align = "left">
                <div style="float:left;width:100%;">
		
                    <h3>Atribuir Treino a Atleta:</h3>
					
                    <select class = "selecao" placeholder="Id Treino" name="idtreino">
                                               <%
                                                   
                    transacoes.TRTN tr = new transacoes.TRTN();           
                    Vector treino_lista = tr.NomeTreino();
                    %> <option disabled="disabled" selected="selected">Selecionar Treino <%
                   for (int i = 0; i < treino_lista.size(); i++) {
                         data.TreinoDO treinoaux = ((TreinoDO)treino_lista.elementAt(i));
                         
                         %>
                         
                         <option  value=<%=treinoaux.getId_TREINO()%>><%= treinoaux.getId_TREINO()%><br>
                         </option>
                    <%  
                        } 
%> 

                    </select> <br><br>
                    
                                        <select class = "selecao" placeholder="Nome do Atleta" name="atleta">
                        <%
                    Vector atleta_lista = tr.NomeAtleta();
                      %>   <option disabled="disabled" selected="selected">Selecionar Atleta <%
                   for (int i = 0; i < atleta_lista.size(); i++) {
                        data.AtletaDO atletaaux = ((AtletaDO)atleta_lista.elementAt(i));
                         %>
                    
                         <option  value="<%=atletaaux.getID_ATLETA()%>"><%= atletaaux.getNOME_ATLETA() %> <%= atletaaux.getSOBRENOME_ATLETA()%><br>
                         </option>
                    <%
                       } 
%> 

                    </select> <br><br>
					<input type="submit" name="atribuir" class="botao3" value="Atribuir">
					<input type="submit" name="cancelar" class="botao3" value="Cancelar"><br><br>

					</div>		

<%    }
%>
  
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