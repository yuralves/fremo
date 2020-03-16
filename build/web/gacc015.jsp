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
<%@ page import="data.AtletaDO" %>
<%@ page import="data.TecnicoDO" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<!Inicio do codigo HTML/JS>
<%String email = (String)session.getAttribute("user_email");
boolean is_admin = (Boolean)session.getAttribute("is_admin");
boolean is_federacao = (Boolean)session.getAttribute("is_federacao");
boolean is_clube = (Boolean)session.getAttribute("is_clube");
boolean is_tecnico = (Boolean)session.getAttribute("is_tecnico");
boolean is_atleta = (Boolean)session.getAttribute("is_atleta");
if (!is_clube) {
    //verificacao manual de login
    pageContext.forward("main.jsp");
}%>
<html>
    <form action="./gacc015.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
                <li><a href="./catl002.jsp">Controle de pagamento</a>
                <li><a href="./catl003.jsp">Enviar e-mail de cobranca</a>
                <li><a href="./catl004.jsp">Atribuir mensalidade</a>
                <li><a href="./evnt002.jsp">Alocar atletas</a>
                <li><a href="./gacc003.jsp">Criar tecnico</a>
                <li><a href="./gacc004.jsp">Criar atletas</a>
                <li><a href="./gacc007.jsp">Apagar tecnico</a>
                <li><a href="./gacc008.jsp">Apagar atletas</a>
                <li><a href="./gacc015.jsp">Atribuir atleta a tecnico</a>
                <li><a href="./gacc018.jsp">Editar cadastro</a>
                <li><a href="./tatl002.jsp">Troca de atleta</a>
                <li><a href="./tatl003.jsp">Aprovar troca de atleta</a>
                <li><a href="./vstn003.jsp">Visualizar mensagens</a>
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
                        <input type="submit" class="botao4" name="Tecnico" value="Tecnico" formnovalidate>
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
                else if(null != request.getParameter("Atribuir")){
                    transacoes.GACC tn = new transacoes.GACC();
                    UsuarioDO usuario = tn.buscar_usuario_email(email);
                    int idClube = usuario.getID_USER();
                    session.setAttribute("idAtleta",request.getParameter("atleta"));
                    session.setAttribute("idTecnico",request.getParameter("tecnico"));
                    int idAtleta = Integer.parseInt((String)session.getAttribute("idAtleta"));
                    int idTecnico = Integer.parseInt((String)session.getAttribute("idTecnico"));
                    AtletaDO at = tn.busca_atleta_por_ID_atleta(idAtleta);
                    AtletaDO novoAt = new AtletaDO();
                    novoAt.setCpf_ATLETA(at.getCpf_ATLETA());
                    novoAt.setData_nascimento_ATLETA(at.getData_nascimento_ATLETA());
                    novoAt.setID_ATLETA(at.getID_ATLETA());
                    novoAt.setID_CLUBE(at.getID_CLUBE());
                    novoAt.setID_TECNICO(idTecnico);
                    novoAt.setMensalidade_ATLETA(at.getMensalidade_ATLETA());
                    novoAt.setNOME_ATLETA(at.getNOME_ATLETA());
                    novoAt.setRg_ATLETA(at.getRg_ATLETA());
                    novoAt.setSOBRENOME_ATLETA(at.getSOBRENOME_ATLETA());
                    if(at.getID_TECNICO() == idTecnico){%>
                        <td height="400" width:="250" align = "Center">
                        <h3>Este atleta já está vinculado a este técnico</h3>
                        <input type="submit" name="Voltar" class="botao3" value="Voltar">
                    <%}
                    else if(at.getID_TECNICO() != 0){
                        TecnicoDO antigo = tn.busca_tecnico_por_ID_tecnico(at.getID_TECNICO());
                        String nome_antigo = antigo.getNomeTecnico() + " " + antigo.getSobrenomeTecnico();%>
                        <td height="400" width:="250" align = "Center">
                        <h3><%="Este atleta está vinculado ao técnico " + nome_antigo%><br>
                            Deseja trocar o técnico do atleta?</h3>
                        <input type="submit" name="Confirmar" class="botao3" value="Confirmar">
                        <input type="submit" name="Cancelar" class="botao3" value="Cancelar">
                    <%}
                    else{
                        boolean bool = tn.atualizar_info_atleta(novoAt);
                        if(bool){%>
                            <td height="400" width:="250" align = "Center">
                            <h3>Atribuído com sucesso</h3>
                            <input type="submit" name="Voltar" class="botao3" value="Voltar">
                        <%}
                        else{%>
                            <td height="400" width:="250" align = "Center">
                            <h3>Erro na operação</h3>
                            <input type="submit" name="Voltar" class="botao3" value="Voltar">
                        <%}
                    }
                }
                else if(null != request.getParameter("Confirmar")){
                    transacoes.GACC tn = new transacoes.GACC();
                    UsuarioDO usuario = tn.buscar_usuario_email(email);
                    int idClube = usuario.getID_USER();
                    int idAtleta = Integer.parseInt((String)session.getAttribute("idAtleta"));
                    int idTecnico = Integer.parseInt((String)session.getAttribute("idTecnico"));
                    AtletaDO at = tn.busca_atleta_por_ID_atleta(idAtleta);
                    AtletaDO novoAt = new AtletaDO();
                    novoAt.setCpf_ATLETA(at.getCpf_ATLETA());
                    novoAt.setData_nascimento_ATLETA(at.getData_nascimento_ATLETA());
                    novoAt.setID_ATLETA(at.getID_ATLETA());
                    novoAt.setID_CLUBE(at.getID_CLUBE());
                    novoAt.setID_TECNICO(idTecnico);
                    novoAt.setMensalidade_ATLETA(at.getMensalidade_ATLETA());
                    novoAt.setNOME_ATLETA(at.getNOME_ATLETA());
                    novoAt.setRg_ATLETA(at.getRg_ATLETA());
                    novoAt.setSOBRENOME_ATLETA(at.getSOBRENOME_ATLETA());
                    boolean bool = tn.atualizar_info_atleta(novoAt) ;
                    if(bool){%>
                        <td height="400" width:="250" align = "Center">
                        <h3>Atribuído com sucesso</h3>
                        <input type="submit" name="Voltar" class="botao3" value="Voltar">
                    <%}
                    else{%>
                        <td height="400" width:="250" align = "Center">
                            <h3>Erro na operação</h3>
                        <input type="submit" name="Voltar" class="botao3" value="Voltar">
                    <%}
                }
                else{
                    transacoes.GACC tn = new transacoes.GACC();
                    UsuarioDO usuario = tn.buscar_usuario_email(email);
                    Vector atletas = tn.vetor_atletas_Id_clube(usuario.getID_USER());
                    Vector tecnicos = tn.busca_tecnico_por_ID_clube(usuario.getID_USER()); %>
                    <table>    
                    <tr>
                        <td height="400" width:="500" align = "Center" valign="center">
                            <h3>Atribuir atleta a técnico</h3><br>
                            Atleta:<br>
                            <select style="width: 250px;" name="atleta" required>
                                <option disabled selected value> Selecione um atleta </option>
                                <%for(int i = 0; i < atletas.size(); i++) { //for loop para cada atleta
                                    AtletaDO atleta = (AtletaDO)atletas.elementAt(i); //escolhe o i-esimo clube e faz o html
                                    UsuarioDO atl = tn.busca_usuario_por_ID(atleta.getID_ATLETA());
                                    if(atl.getHabilitado_ATLETA()){
                                %><option value="<%= atleta.getID_ATLETA()%>"><%= atleta.getNOME_ATLETA() + " " + atleta.getSOBRENOME_ATLETA()%></option>
                                <%}} // end loop atletas%>
                            </select><br><br>
                            Técnico:<br>
                            <select style="width: 250px;" name="tecnico" required>
                                <option disabled selected value> Selecione um técnico </option>
                                <%
                                    for(int j = 0; j < tecnicos.size(); j++) { //for loop para cada tecnico
                                    TecnicoDO tecnico = (TecnicoDO)tecnicos.elementAt(j); //escolhe o j-esimo clube e faz o html
                                    UsuarioDO tec = tn.busca_usuario_por_ID(tecnico.getIdTecnico());
                                    if(tec.getHabilitado_TECNICO()){
                                %><option value="<%= tecnico.getIdTecnico()%>"><%= tecnico.getNomeTecnico()+" "+ tecnico.getSobrenomeTecnico()%></option>
                                <%}} // end loop tecnicos%>
                            </select><br><br>
                            <input type="submit" name="Atribuir" class="botao3" value="Concluir">
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