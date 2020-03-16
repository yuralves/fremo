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
<%@ page import="data.FederacaoDO" %>
<%@ page import="data.ProvasDO" %>
<%@ page import="data.TipoEventoDO" %>
<%@ page import="data.TipoProvaDO" %>
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
    <form action="./evnt001.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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

else if (null != request.getParameter("criar")) { //Caso o botao submeter tenha sido 
                    String nome_do_evento = request.getParameter("nomeevento"); //Seta  nome do evento
                    String diainicio = request.getParameter("diainicio");       //Seta  dia
                    String mesinicio = request.getParameter("mesinicio");       //Seta  mes
                    String anoinicio = request.getParameter("anoinicio");       //Seta  ano
                    String data_inicio = anoinicio.concat("-");                 
                    data_inicio = data_inicio.concat(mesinicio);
                    data_inicio = data_inicio.concat("-");
                    data_inicio = data_inicio.concat(diainicio);                //Junta string em aaaa-mm-dd
                    String diafim = request.getParameter("diafim");
                    String mesfim = request.getParameter("mesfim");
                    String anofim = request.getParameter("anofim");
                    String data_termino = anofim.concat("-");
                    data_termino = data_termino.concat(mesfim);
                    data_termino = data_termino.concat("-");
                    data_termino = data_termino.concat(diafim);                 //Junta string em aaaa-mm-dd
                    boolean flag_inscricao = true;                              //Seta a permissao para inscricao
                    String localizacao = "Raia da USP";                         //Seta localizacao
                    float reais = Integer.parseInt(request.getParameter("reais"));//Recebe reais
                    float centavos = Integer.parseInt(request.getParameter("centavos"));//Recebe centavos
                    float valor = reais + centavos/100;
                    transacoes.EVNT tn = new transacoes.EVNT();   //Cria uma transacao auxiliar
                    UsuarioDO usuario = tn.buscar_usuario_email(email);         //Cria um usuario com o usuario logado
                    int id_federacao = usuario.getID_USER();                    //Pega o ID da federacao logada
                    String tipo_do_evento = request.getParameter("tipoevento"); //Cria uma string com o valor do tipo do evento
                    int id_tipo_do_evento = Integer.parseInt(tipo_do_evento, 10);//Transforma string em valor inteiro
                    EventoDO evento = new data.EventoDO();                      //Nova classe EventoDO
                    evento.setNome_Do_Evento(nome_do_evento);                   //Seta nome e assim por diante
                    evento.setData_Inicio(data_inicio);
                    evento.setData_Termino(data_termino);
                    evento.setFlag_Inscricao(flag_inscricao);
                    evento.setId_Federacao(id_federacao);
                    evento.setId_Tipo_Do_Evento(id_tipo_do_evento);
                    evento.setLocalizacao(localizacao);
                    evento.setpreco_Inscricao(valor);
                    boolean bool = tn.criar_evento(evento);                     //Usa o controller pra atualizar o banco de dados. Guarda se deu certo ou nao
                    EventoDO eventoaux = tn.busca_evento_nome(nome_do_evento);  //Cria um evento auxiliar com o evento criado
                    int id_evento = eventoaux.getId();                          //Pega o ID do evento criado
                    ProvasDO prova = new data.ProvasDO();                       //Cria uma classe prova
                    boolean bool1;                                              //Os booleanos irao guardar se houve algum erro
                    boolean bool2 = true;
                    Vector tipos_provas = tn.todas_provas();                    //recebe os tipos de prova
                    for(int i = 1; i<=tipos_provas.size(); i++){
                        String prova_aux = Integer.toString(i);                 //Transforma i em string
                        if(null != request.getParameter(prova_aux)){            //Caso a checkbox em i foi selecionada será diferente de vazio
                            prova.setId_Evento(id_evento);                      //Seta o id do evento (nao muda)
                            prova.setId_Tipo_De_Prova(i);                       //Seta o id da prova
                            bool1 = tn.criar_prova(prova);                      //Cria a prova
                            if(bool1 == false){                                 //Se for falso alguma vez, vai mudar o bool2 para falso e este nunca mais vai ser verdadeiro
                                bool2 = false;                              
                            }
                        }
                        
                    }
                    
                    if(bool == true && bool2 == true){%>
                        <td height="400" width:="250" align = "Center">
                        <h3>O Evento foi incluso com sucesso</h3>
                    <%}        
                    else if(bool == true && bool2 == false){%>
                        <td height="400" width:="250" align = "Center">
                        <h3>Houve um erro na inclusao das provas</h3>
                    <%}        
                    else if(bool == false && bool2 == true){%>
                        <td height="400" width:="250" align = "Center">
                        <h3>Houve um erro na inclusao do evento</h3>
                    
                    <%}        
                    else{%>
                        <td height="400" width:="250" align = "Center">
                        <h3>Houve um erro</h3>
                        
                    <%}
            }

else {
    transacoes.EVNT tn = new transacoes.EVNT(); //inicia o controller
    //pega os tipos de evento
    Vector tipos_evento = tn.todos_eventos();%> 
                <td height="400" width:="250" align = "Left">
                    <h3>Criar Evento</h3>
                    <div style="float:left;width:25%;">
                        
                        Tipo de Evento:<br>   
                        <select class = "selecao" name="tipoevento">
<%for(int i = 0; i < tipos_evento.size(); i++) { //for loop para cada tipo de evento
    TipoEventoDO Evento = (TipoEventoDO)tipos_evento.elementAt(i); //escolhe o i-esimo tipo de evento e faz o html
                        %><option value="<%= Evento.getId() %>"><%=Evento.getTipo_do_evento()%></option>
<%} // end loop tipos de evento%>
                        </select> <br><br>
                        Nome do Evento:<br> 
                        <input class="c" type="text" placeholder="Nome do Evento" name="nomeevento" required><br><br>
                        Data de Inicio:<br>                
                        <input class="b" type="number" placeholder="Dia (dd)" name="diainicio" size="2"  min="01" max="31" required>
                        <input class="b" type="number" placeholder="Mes (mm)" name="mesinicio" size="2" min="01" max="12" required>
                        <input class="b" type="number" placeholder="Ano (yyyy)" name="anoinicio" size="4" min="2016" required><br><br>
                        Data de Fim:<br> 
                        <input class="b" type="number" placeholder="Dia (dd)" name="diafim" size="2" min="01" max="31" required>
                        <input class="b" type="number" placeholder="Mes (mm)" name="mesfim" size="2" min="01" max="12" required>
                        <input class="b" type="number" placeholder="Ano (yyyy)" name="anofim" size="4" min="2016" required><br>
                    </div>
                    <div style="float:left;width:25%;">
                        Provas:<br>
<%
    Vector tipos_provas = tn.todas_provas(); //recebe os tipos de prova. Não precisa inicializar o controlador porque ele já foi inicializado nesse else
    %><table style="width:100%"><%
    for(int i = 0; i < tipos_provas.size(); i++) {
    //loop entre os tipos de prova, montando o html a cada i-esima prova
        int resto = (i % 3);
        if (resto == 0) {
        %><tr><%
        }
        TipoProvaDO Prova = (TipoProvaDO)tipos_provas.elementAt(i);
        %>
        <td><input class="d" type="checkbox" name="<%=Prova.getId()%>" value="<%=Prova.getId()%>"><%=Prova.getNome_Da_Prova()%><br><br></td>
        <% resto = (i+1 % 3);
        if (resto == 0) {
            %></tr><%
        }
        
    } //end loop tipos de prova%>
    </table>
                    </div>
                    <div style="float:left;width:25%;">
                        Valor por participacao:<br> 
                        <input class="e" type="number" placeholder="Reais" name="reais" min="0" required>
                        <input class="e" type="number" placeholder="Centavos" name="centavos" min="1" max="99" required>
                        <input type="submit" name="criar" class="botao3" value="Criar"><br><br>
                        <input type="submit" name="cancelar" class="botao3" value="Cancelar"><br><br>
                    </div>
                </td>
                
  
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