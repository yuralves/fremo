<%-- 
    Document   : index
    Created on : 07/11/2016, 10:10:10
    Author     : Yuri
--%>

<!Isso eh tipo os imports>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes.*" %>
<%@ page import="data.UsuarioDO" %>
<%@ page import="data.AtletaDO" %>
<%@ page import="data.TreinoDO" %>
<%@ page import="data.ExercicioDO" %>
<%@ page import="data.TipoExercicioDO" %>
<%@ page import="data.AtletaHasTreinoDO" %>
<%@ page import="data.InstanciaExercicioDO" %>

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
if (!is_atleta) {
    //verificacao manual de login
    pageContext.forward("main.jsp");
}%>
<html>
    <form action="./trtn005.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>>
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
                <li><a href="./catl001.jsp">Controle de presenca</a> 
                <li><a href="./gacc002.jsp">Editar cadastro</a> 
                <li><a href="./trtn002.jsp">Ver progresso</a>
                <li><a href="./trtn005.jsp">Fazer exercicio</a>
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
else if(null != request.getParameter("Atleta")){
    pageContext.forward("./atleta.jsp");
}
else if(null != request.getParameter("Tecnico")){
    pageContext.forward("./tecnico.jsp");
}
else if(null != request.getParameter("Clube")){
    pageContext.forward("./clube.jsp");
}
else if(null != request.getParameter("Federacao")){
    pageContext.forward("./federacao.jsp");
}
else if(null != request.getParameter("Admin")){
    pageContext.forward("./administrador.jsp");
}
else if(null == request.getParameter("Treinar") && null==request.getParameter("Realizar")) {%>
                    
                    <div style="padding:15px;">
                    <h2>Fazer treino</h2>
                    </div>
                    
                    <div style="padding:20px;">
                    <select name="treino_esc">                
    <%
    transacoes.GACC tng = new transacoes.GACC();
    AtletaDO atl = tng.busca_atleta_por_ID_atleta(id);
    int id_tecnico = atl.getID_TECNICO();
    
    transacoes.TRTN tnt = new transacoes.TRTN();
    Vector treino = tnt.vetor_treino_idatleta(id);
    for(int i = 0; i < treino.size(); i++){
    
        AtletaHasTreinoDO Treino = (AtletaHasTreinoDO) treino.elementAt(i);
        int id_treino = Treino.getId_TREINO();
        
    %>          

    <option value=<%=id_treino%>><%=id_treino%></option>
    
    
    <%}%>
    </select>
     
      
      <h3><input type="submit" class = "botao2" name="Treinar" value="Fazer Treino"></h3>
          </div>

      
     <%}else if(null != request.getParameter("Treinar")){
     transacoes.GACC tn = new transacoes.GACC();
     AtletaDO atl = tn.busca_atleta_por_ID_atleta(id);
     
     String aux = request.getParameter("treino_esc");
     int id_treino = Integer.parseInt(aux);
     session.setAttribute("treino_escolhido", id_treino);
     %> 

    <h2><%="Treino "+aux +": "+atl.getNOME_ATLETA()+" "+atl.getSOBRENOME_ATLETA()%></h2>


    <table>
  <tr>
    <th>Tipo de exercicio</th>
    <th>Valor</th>
  </tr>
  <%    transacoes.TRTN tnt = new transacoes.TRTN();    
        Vector exercicios = tnt.vetor_exercicio_idtreino(id_treino);
         for(int i = 0; i < exercicios.size(); i++){
            ExercicioDO Exercicio = (ExercicioDO) exercicios.elementAt(i);
            int aux1 = Exercicio.getIdTipoExercicio();
            TipoExercicioDO tipo_ex = tnt.Busca_TipoEx_por_Id(aux1);
  
  %>
                      <tr>
                          <th><%=tipo_ex.getNomeExercicio()%></th>
                          <th>
                              <input type="text" name="valor<%=i%>">
                          </th>
                      </tr>

  <%}%>
<p>
<tr><th>Data</th>
    <th><input type="text" name="Dia" ></th>
    <th>Data no modelo: YYYY-MM-DD</th>
</tr>
<tr></tr>
<tr>
    <th><h3><input type="submit" class = "botao2" name="Cancelar" value="cancelar" formaction="./main.jsp"></h3></th>
    <th><h3><input type="submit" class = "botao2" name="Realizar" value="realizar"></h3></th>

</tr>

</table>
      
    
  
<%} else if(null != request.getParameter("Realizar")){


     int id_exercicio;
     int valor;
     String data;   
     transacoes.TRTN tn = new transacoes.TRTN();
     int id_treino = (Integer)session.getAttribute("treino_escolhido");
     Vector exercicios = tn.vetor_exercicio_idtreino(id_treino);
      
     for(int i = 0; i < exercicios.size(); i++){
         
         ExercicioDO Exercicio = (ExercicioDO) exercicios.elementAt(i);
         id_exercicio = Exercicio.getIdExercicio();
         data=request.getParameter("Dia");
         String auxiliar = request.getParameter("valor"+i);
         
         valor = Integer.parseInt(auxiliar);
         
         
         InstanciaExercicioDO iedo = new InstanciaExercicioDO();
         iedo.setId_Exercicio( id_exercicio);
         iedo.setId_Atleta(id);
         iedo.setData_realizado(data);
         iedo.setValor(valor);
         
         boolean a = tn.criar_instancia_exercicio(iedo);  

}
%>

<h2>Os exercicios foram adicionados com sucesso</h2>

<%} %>


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