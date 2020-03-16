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
<%@ page import="data.TipoExercicioDO" %>
<%@ page import="data.TreinoDO" %>
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
    <form action="./trtn003.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
                <table style="width:100%" border=0 cellpadding="10" cellspacing="0">
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

else if(null != request.getParameter("selecionar")){//caso o botao cancelar for apertado
     %> 
            <tr>
                <td>
                <div style="float:left;width:25%;">
                    <h3>Adicionar Instâncias</h3>
                </div>
                </td>
            </tr>
            <tr>
                <td>
                <div style="float:left;width:25%;">
                    <h4>Nome do exercício</h4>
                </div>    
                <div style="float:left;width:25%;">
                    <h4>Séries</h4>
                </div>
                <div style="float:left;width:25%;">
                    <h4>Repetições</h4>
                </div>
                <div style="float:left;width:25%;">
                    <h4>Carga/Tempo</h4>
                </div>              
                </td>
            </tr>
                  
                       <%
                    transacoes.TRTN tr3 = new transacoes.TRTN();
                    Vector texercicio_lista = tr3.NomeExercicio();
                    for(int j = 0; j<texercicio_lista.size(); j++){
                        data.TipoExercicioDO exercicioaux1 = ((TipoExercicioDO)texercicio_lista.elementAt(j));                     //Transforma i em string
                        String idexaux = Integer.toString(exercicioaux1.getIdTipoExercicio());
                        if(null != request.getParameter(idexaux)){                            
                        %>       
                            <tr>
                <td>
                <div style="float:left;width:25%;">
                    <%= exercicioaux1.getNomeExercicio()%>
                </div>    
                <div style="float:left;width:25%;">
                    <input type="number" class="e" min="1"  max="99" placeholder="Séries" name="<%= "series" + exercicioaux1.getIdTipoExercicio()%>" required>
                </div>
                <div style="float:left;width:25%;">
                    <input type="number" class="e" min="1"  max="99" placeholder="Repeticoes" name="<%= "repeticoes" + exercicioaux1.getIdTipoExercicio()%>" required>
                </div>
                <div style="float:left;width:25%;">
                    <select class = "selecao" name="<%= "tipo" + exercicioaux1.getIdTipoExercicio()%>">
                        <option value="carga">Carga
                        <option value="tempo">Tempo
                    </select> 
                </div>              
                </td>
            </tr>
            <%
                       }
                    }%>
                <tr>
                    <td>
                    <div style="float:left;width:25%;">
                        <input type="submit" name="criar" class="botao3" value="Criar">
                    </div>
                    <div style="float:left;width:25%;">
                        <input type="submit" name="cancelar" class="botao3" value="Cancelar">
                    </div>
                    </td>
                </tr>
<%}

else if (null != request.getParameter("criar")) {
            transacoes.TRTN tr = new transacoes.TRTN();
            Vector texercicio_lista = tr.NomeExercicio();
            UsuarioDO usuario = tr.buscar_usuario_email(email);
            for(int j = 0; j<texercicio_lista.size(); j++){
                data.TipoExercicioDO exercicioaux1 = ((TipoExercicioDO)texercicio_lista.elementAt(j));
                int series = 0; int repeticoes = 0; String tipo = new String();
                String parametro_series = "series" + Integer.toString(exercicioaux1.getIdTipoExercicio());
                String parametro_repeticoes = "repeticoes" + Integer.toString(exercicioaux1.getIdTipoExercicio());
                String parametro_tipo = "tipo" + Integer.toString(exercicioaux1.getIdTipoExercicio());
                if(request.getParameter(parametro_series) != null || request.getParameter(parametro_repeticoes) != null){
                    if(request.getParameter(parametro_series).equals("") == false || request.getParameter(parametro_repeticoes).equals("") == false){
    //                Caso algum input daquele atleta for preenchido
                        series = Integer.parseInt(request.getParameter(parametro_series));
                        repeticoes = Integer.parseInt(request.getParameter(parametro_repeticoes));
                        tipo = request.getParameter(parametro_tipo);
                        data.TreinoDO treino = new data.TreinoDO();
                        treino.setId_TECNICO(usuario.getID_USER());
                        tr.incluir_Treino(treino);
                        Vector treinos = tr.NomeTreino();
                        TreinoDO ultimotreino = tr.busca_ultimo_treino();
                        int id = ultimotreino.getId_TREINO();
                        System.out.println("tamanho id " + id);
                        ExercicioDO exercicio = new ExercicioDO();
                        exercicio.setIdTreino(id);
                        exercicio.setCargaOuTempo(tipo);
                        exercicio.setIdTipoExercicio(exercicioaux1.getIdTipoExercicio());
                        exercicio.setNRepeticoes(repeticoes);
                        exercicio.setNSeries(series);
                        tr.incluir_exercicio(exercicio);
                    }
                }
            }
}

else {
        %>
        
                    <td height="400" width:="250" align = "Left">
                    <h3>Criar Treino</h3>
                    <div style="float:left;width:40%;">
                        
                        <br><br>
					
                         <input type="submit" name="selecionar" class="botao3" value="Selecionar"><br><br>
			<input type="submit" name="cancelar" class="botao3" value="Cancelar"><br><br>
                        
                    </div>
					
                    <td height="400" width:="250" align = "Left">
                    <div style="float:left;width:100%;">
                   
          
                        Exercicio:<br>
                       <%
                    transacoes.TRTN tr2 = new transacoes.TRTN();
                    Vector exercicio_lista = tr2.NomeExercicio();
                    for (int i = 0; i < 8; i++) {
                        data.TipoExercicioDO exercicioaux = ((TipoExercicioDO)exercicio_lista.elementAt(i));
                         %>
                         <input class="d" name="<%= exercicioaux.getIdTipoExercicio()%>" type="checkbox" value="1"><%= exercicioaux.getNomeExercicio()%><br>
                        </input>
                    <%
                    } 
%>
                    
					 
                    </div>
					
                    <td height="400" width:="250" align = "Left">
                    <div style="float:left;width:100%;">
                        <br>
                       <%

                    for (int i = 8; i < 16; i++) {
                        data.TipoExercicioDO exercicioaux = ((TipoExercicioDO)exercicio_lista.elementAt(i));
                         %>
                         <input class="d" name="<%= exercicioaux.getIdTipoExercicio()%>" type="checkbox" value="1"><%= exercicioaux.getNomeExercicio()%><br>
                        </input>
                    <%
                        } 
%>

                       
                    </div>

                   <td height="400" width:="250" align = "Left">
                    <div style="float:left;width:100%;">
                        <br>
                       <%

                    for (int i = 16; i < exercicio_lista.size(); i++) {
                        data.TipoExercicioDO exercicioaux = ((TipoExercicioDO)exercicio_lista.elementAt(i));
                         %>
                         <input class="d" name="<%= exercicioaux.getIdTipoExercicio()%>" type="checkbox" value="1"><%= exercicioaux.getNomeExercicio()%><br>
                         </input>
                    <%
                        } 
%>

                       
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