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
<%@ page import="data.ProvasDO" %>
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
    <form action="./evnt011.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
else if(null != request.getParameter("alterar")) {//caso botao alterar apertado
    String str_id_evento = (String)(session.getAttribute("evento"));
    int id_evento = Integer.parseInt(str_id_evento);
    
    String diainicio = request.getParameter("diainicio");    //Seta  dia
    String mesinicio = request.getParameter("mesinicio");    //Seta  mes
    String anoinicio = request.getParameter("anoinicio");    //Seta  ano
    String data_inicio = anoinicio.concat("-");                 
    data_inicio = data_inicio.concat(mesinicio);
    data_inicio = data_inicio.concat("-");
    data_inicio = data_inicio.concat(diainicio);  //Junta string em aaaa-mm-dd
    
    String diafim = request.getParameter("diafim");
    String mesfim = request.getParameter("mesfim");
    String anofim = request.getParameter("anofim");
    String data_termino = anofim.concat("-");
    data_termino = data_termino.concat(mesfim);
    data_termino = data_termino.concat("-");
    data_termino = data_termino.concat(diafim);    //Junta string em aaaa-mm-dd
    
    float reais = Float.parseFloat(request.getParameter("reais"));
    float centavos = Float.parseFloat(request.getParameter("centavos"));
    float preco = reais + centavos/100;

    transacoes.EVNT tr = new transacoes.EVNT();
    
    //mudancas na tabela evento
    data.EventoDO eventoaux = tr.busca_evento_por_ID(id_evento);
    eventoaux.setData_Inicio(data_inicio);
    eventoaux.setData_Termino(data_termino);
    eventoaux.setpreco_Inscricao(preco);
    boolean att_datas = tr.atualizar_evento(eventoaux);
    
    //mudancas na tabela provas
    for (int i = 1; i < 12; i++) {
        //procurar se ja existe a prova no evento:
        data.ProvasDO provabusca = tr.busca_prova_por_ID_evento_ID_tiporpova(id_evento, i);
        //pegar valor do checkbox:
        String prova_marcada = request.getParameter(Integer.toString(i));
        
        if (prova_marcada != null) { //para evitar nullpointerexception ao usar .equals
            if (prova_marcada.equals("1")) {//se prova marcada
                if (provabusca == null) {//checa se ainda nao existe essa prova nesse evento
                    data.ProvasDO provaaux = new data.ProvasDO();
                    provaaux.setId_Evento(id_evento);
                    provaaux.setId_Tipo_De_Prova(i);
                    boolean nova_prova = tr.criar_prova(provaaux);
                }
                //caso prova ja exista, nada precisa fazer
            }
        }
        else {//se prova desmarcada 
            if (provabusca != null) { //checar se anteriormente havia sido marcada para esse evento
                int id_prova = provabusca.getId();
                boolean excluir = tr.excluir_prova_de_evento_por_ID(id_prova);
            }
        }
    } //fim for
}
else {
                   
%>
                <td height="400" width:="250" align = "Left">
                    <h3>Editar Evento</h3>
                    <div style="float:left;width:25%;">
                        
 						<br><br><br><br><br><br>
                        Data de Inicio:<br>                
                        <input class="b" type="text" placeholder="Dia (dd)" name="diainicio" size="2" maxlength="2" required>
                        <input class="b" type="text" placeholder="Mes (mm)" name="mesinicio" size="2" maxlength="2" required>
                        <input class="b" type="text" placeholder="Ano (yyyy)" name="anoinicio" size="4" maxlength="4" required><br><br>
                        Data de Fim:<br> 
                        <input class="b" type="text" placeholder="Dia (dd)" name="diafim" size="2" maxlength="2" required>
                        <input class="b" type="text" placeholder="Mes (mm)" name="mesfim" size="2" maxlength="2" required>
                        <input class="b" type="text" placeholder="Ano (yyyy)" name="anofim" size="4" maxlength="4" required><br>
                    </div>
                    <div style="float:left;width:25%;">
                        Provas:<br>
                        <input class="d" type="checkbox" name="1" value="1">Canoe Masc. 500m<br><br>
                        <input class="d" type="checkbox" name="2" value="1">Canoe Masc. 1000m<br><br>
                        <input class="d" type="checkbox" name="3" value="1">Canoe Fem. 500m<br><br>
                        <input class="d" type="checkbox" name="4" value="1">Single Skiff Fem. 500m<br><br>
                        Valor por participacao:<br> 
                        <input class="c" type="text" placeholder="Reais" name="reais" size="2"><br>
                        <input class="c" type="text" placeholder="Centavos (cc)" name="centavos" size="2" maxlength="2"><br>
                    </div>
                    <div style="float:left;width:25%;">
                        <br>
                        <input class="d" type="checkbox" name="5" value="1">Single Skiff Masc. 500m<br><br>
                        <input class="d" type="checkbox" name="6" value="1">Double Skiff Fem. 500m<br><br>
                        <input class="d" type="checkbox" name="7" value="1">Double Skiff Masc. 500m<br><br>
                        <input class="d" type="checkbox" name="8" value="1">4- Fem. 500m<br><br><br>
                        <input type="submit" name="cancelar" class="botao3" value="Cancelar"><br><br>
                    </div>
                    <div style="float:left;width:25%;">
                        <br>
                        <input class="d" type="checkbox" name="9" value="1">4+ Masc. 500m<br><br>
                        <input class="d" type="checkbox" name="10" value="1">8+ Fem. 500m<br><br>
                        <input class="d" type="checkbox" name="11" value="1">8+ Masc. 500m<br><br><br><br><br><br>
                        <input type="submit" name="alterar" class="botao3" value="Alterar"><br><br>
                    </div>
                </td>
                
  

                </table>
            </td>
        </table>   


<%}%>
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