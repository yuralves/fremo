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
<%@ page import="data.TipoProvaDO" %>
<%@ page import="data.AtletaDO" %>
<%@ page import="data.ListaAtletasDO" %>

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
    <form action="./evnt002.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
    session.removeAttribute("prova");
    session.removeAttribute("evento");
    pageContext.forward("./main.jsp");
}                
else if(null != request.getParameter("Sair")){
    session.removeAttribute("user_email");
    session.removeAttribute("prova");
    session.removeAttribute("evento");
    pageContext.forward("./index.jsp");
}
else if(null != request.getParameter("Cancelar")){
    session.removeAttribute("prova");
    session.removeAttribute("evento");
    pageContext.forward("./main.jsp");
}
else if(null != request.getParameter("Clube")){
    session.removeAttribute("prova");
    session.removeAttribute("evento");
    pageContext.forward("./clube.jsp");
}
else if(null != request.getParameter("escolher")){                              //Segunda parte, após escolher o evento. Deve aparecr os tipos de evento
            transacoes.EVNT tn = new transacoes.EVNT();           //Cria uma transacao auxiliar
            String evento = request.getParameter("evento");                     //Cria uma string com o valor do id do evento
            session.setAttribute("evento", evento);                             //Grava o valor selecionado no sessão pois precisaremos usá-lo depois
            int id_evento = Integer.parseInt(evento, 10);                       //Transforma string do id do evento em valor inteiro
            EventoDO eventoaux = tn.busca_evento_por_ID(id_evento);             //Cria um evento pelo id do evento selecionado%>                            
            <td height="400" width:="250" align = "Left" valign="Top">
            <h3>Alocar Atletas</h3>            
            <h4>Evento: <%= eventoaux.getNome_Do_Evento() %></h4>
            <select class = "selecao" name="provas">
            <%
            Vector provas = tn.busca_provas_por_ID(id_evento);                  //Pega todas as provas com o id do evento
            for(int i=0; i<provas.size(); i++){                                 
                ProvasDO Prova = (ProvasDO)provas.elementAt(i);                 //Cria o objeto da prova
                TipoProvaDO Tipo_prova = tn.busca_tipo_prova_por_ID(Prova.getId_Tipo_De_Prova()); //Cria um objeto com o tipo de prova
                %> 
                    <option value=<%= Tipo_prova.getId() %>><%= Tipo_prova.getNome_Da_Prova() %></option>
                    <%//Cria-se opções com os tipos de provas do evento selecionado
            }%>
            </select>
            <input type="submit" name="inscrever" class="botao3" value="Inscrever Atletas"><br><br>
            <input type="submit" name="cancelar" class="botao3" value="Cancelar"><br><br>
<%}
else if(null != request.getParameter("inscrever")){                             //Terceira tela, quando aperta o botao inscrever. Deve aparecer os atletas
            transacoes.EVNT tn = new transacoes.EVNT();           //Cria uma transacao auxiliar
            String provas = request.getParameter("provas");                     //Cria uma string com o valor do id do tipo de prova
            session.setAttribute("prova", provas);                              //Grava o valor selecionado ns sessão pos sera usado depos
            int id_tipo_prova = Integer.parseInt(provas, 10);                   //Transforma string em valor inteiro
            TipoProvaDO Tipo_prova = tn.busca_tipo_prova_por_ID(id_tipo_prova); //Busca o tipo de prova pelo id escolhido%>
            <td height="400" width:="250" align = "Left" valign="Top">
            <h3>Alocar Atletas</h3>
            <h4>Prova: <%= Tipo_prova.getNome_Da_Prova()%></h4>
            <%
            UsuarioDO usuario = tn.buscar_usuario_email(email);                 //Busca o usuario logado
            int id_clube = usuario.getID_USER();                                //Pega o ID do clube logado
            Vector atletas = tn.vetor_atletas_Id_clube(id_clube);               //Busca todos os atletas pelo id do clube
            for(int i=0; i<atletas.size(); i++){                                //Percorre todo vetor
                AtletaDO Atleta = (AtletaDO)atletas.elementAt(i);               //Cria os objetos atleta
                %>
                <input class="d" type="checkbox" name="<%= i %>" value="1"><%= Atleta.getNOME_ATLETA()%> <%= Atleta.getSOBRENOME_ATLETA()%><br>  
            <%//Crio uma checkbox com todos os atletas do clube
            }
            if(atletas.size() == 0){%>
                <h4>O Clube nao possui atletas cadastrados</h4>
            <%}
            else{%>
                <br>
                <input type="submit" name="confirmar" class="botao3" value="Confirmar"><br><br>
                <input type="submit" name="cancelar" class="botao3" value="Cancelar"><br><br>
            <%}
}
else if(null != request.getParameter("confirmar")){                             //Ultima parte. Farei a atualizacao do banco de dados aqui
            transacoes.EVNT tn = new transacoes.EVNT();           //Cria uma transacao auxiliar
            UsuarioDO usuario = tn.buscar_usuario_email(email);                 //Cria um usuario com o usuario logado
            int id_clube = usuario.getID_USER();                                //Pega o id do clube logado
            String provas = (String)session.getAttribute("prova");              //Pega o valor da prova escolhido que está na sessão
            String evento = (String)session.getAttribute("evento");             //Pega o valor do evento escolhido que está na sessão
            ProvasDO Prova = tn.busca_prova_por_ID_evento_ID_tiporpova(Integer.parseInt(evento, 10), Integer.parseInt(provas, 10));
             //Busca prova com o id do evento e do tipo de prova selecionados. Só deve exister uma
            Vector naoinscritos = new Vector();                                 //Vai gravar o nome de todos os nao inscritos
            Vector inscritos = new Vector();                                    //Vai gravar o nome de todos os inscritos
            String nome_sobrenome;                                              //Vai receber o nome e o sobrenome dos atletas
            Vector atletas = tn.vetor_atletas_Id_clube(id_clube);               //Busca todos os atletas pelo id do clube
            for(int i = 0; i < atletas.size(); i++){                            //Percorre denovo todos os atletas dentro do vetor
                AtletaDO Atleta = (AtletaDO)atletas.elementAt(i);               //Cria os objetos atleta
                if(null != request.getParameter(Integer.toString(i))){          //Caso a checkbox desse atleta for selecionada
                    ListaAtletasDO listaatletasaux = tn.busca_listaatleta_por_ID_user_ID_prova(Atleta.getID_ATLETA(), Prova.getId());
                    //Busca uma listaatleta com o id do usuario e id de prova
                            if(null != listaatletasaux){                        //Caso já exista uma atleta naquela prova                            
                            nome_sobrenome = Atleta.getNOME_ATLETA()+ " " + Atleta.getSOBRENOME_ATLETA(); //Pega seu nome e sobrenome
                            naoinscritos.add(nome_sobrenome);                   //Coloca na lista de nao inscritos
                            }                                                   
                            else{                                               //Qualquer outro caso ele cria a lista
                                ListaAtletasDO listaatletas = new data.ListaAtletasDO();//Cria uma classe tipo Lista atletas
                                listaatletas.setId_ATLETA(Atleta.getID_ATLETA());//Grava o valor do Id do atleta
                                listaatletas.setId_CLUBE(id_clube);             //Grava o valor do Id do clube
                                listaatletas.setId_PROVA(Prova.getId());        //Grava o valor do Id da prova
                                listaatletas.setInscricao_Aprovada(false);      //Gravar inscricao nao aprovadas
                                tn.criar_lista_atleta(listaatletas);            //Cria a listaatletas nova
                                nome_sobrenome = Atleta.getNOME_ATLETA()+" "+Atleta.getSOBRENOME_ATLETA();//Pega seu nome e sobrenome
                                inscritos.add(nome_sobrenome);                  //Coloca na lista de inscritos
                            }    
                }
            }
            session.removeAttribute("prova");                                   //Retira da sessão os atributos
            session.removeAttribute("evento");%>                                
            <td height="400" width:="250" align = "Left" valign="Top">
            <%
            if(inscritos.size() != 0){%>
                <h3>O(s) seguinte(s) atleta(s) foi(ram) inscrito(s) com sucesso:</h3>
                <%for(int i = 0; i < inscritos.size(); i++){%>
                    <%= inscritos.elementAt(i) %><br>
                <%}
            }
            if(naoinscritos.size() != 0){%>
                <h3>O(s) seguinte(s) atleta(s) JÁ ESTAVA(M) inscrito(s):</h3>
                <%for(int i = 0; i < naoinscritos.size(); i++){%>
                    <%= naoinscritos.elementAt(i) %><br>
                <%}                
            }
}
            
else {  //O caso de uso começa aqui. Nenhum botao come;a apertado
            transacoes.EVNT tn = new transacoes.EVNT();           //Cria uma transacao auxiliar
            Vector eventos = tn.todos_eventos_();%>
            <td height="400" width:="250" align = "Left" valign="Top">
            <h3>Alocar Atletas</h3>
            <%
            if(eventos.size() == 0){%>
                <h3>Não há eventos disponíveis</h3>
                <%}
            else{%>
                <select class = "selecao" name="evento">
                <%for(int i=0; i<eventos.size(); i++){                              //Percorre todos os eventos
                    EventoDO Evento = (EventoDO)eventos.elementAt(i);               //Cria uma classe evento
                    if(null != Evento && Evento.getFlag_Inscricao() == true){       //Caso tenha o flag de inscricao ativo
                %><option value=<%=i+1%>><%= Evento.getNome_Do_Evento() %></option>                                    
                   <%}//Crio opçoes pra escolha
                }%>
                </select>
                <input type="submit" name="escolher" class="botao3" value="Escolher Provas"><br><br>
                <input type="submit" name="cancelar" class="botao3" value="Cancelar"><br><br>
<%} }%>
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