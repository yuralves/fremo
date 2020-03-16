<%-- 
    Document   : index
    Created on : 07/11/2016, 10:10:10
    Author     : Yuri
--%>

<!Isso eh tipo os imports>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
if (!is_federacao) {
    //verificacao manual de login
    pageContext.forward("main.jsp");
}%>
<html>
    <form action="./evnt004.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
else if(null != request.getParameter("Federacao")){
    session.removeAttribute("prova");
    session.removeAttribute("evento");
    pageContext.forward("./Federecao.jsp");
}
else if(null != request.getParameter("escolher")){                              //Segunda parte, após escolher o evento. Deve aparecr os tipos de evento
            transacoes.EVNT tn = new transacoes.EVNT();           //Cria uma transacao auxiliar
            String evento = request.getParameter("evento");                     //Cria uma string com o valor do id do evento
            session.setAttribute("evento", evento);                             //Grava o valor selecionado no sessão pois precisaremos usá-lo depois
            int id_evento = Integer.parseInt(evento, 10);                       //Transforma string do id do evento em valor inteiro
            EventoDO eventoaux = tn.busca_evento_por_ID(id_evento);             //Cria um evento pelo id do evento selecionado%>                            
            <td height="400" width:="250" align = "Left" valign="Top">
            <h3>Atualizar resultado:</h3>            
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
            <input type="submit" name="inscrever" class="botao3" value="Atualizar Tempo"><br><br>
            <input type="submit" name="cancelar" class="botao3" value="Cancelar"><br><br>
<%}

else if(null != request.getParameter("inscrever")){                             //Terceira tela, quando aperta o botao inscrever. Deve aparecer os atletas
            transacoes.EVNT tn = new transacoes.EVNT();           //Cria uma transacao auxiliar
            String provas = request.getParameter("provas");                     //Cria uma string com o valor do id do tipo de prova
            session.setAttribute("prova", provas);                              //Grava o valor selecionado ns sessão pos sera usado depos
            int id_tipo_prova = Integer.parseInt(provas, 10);                   //Transforma string em valor inteiro
            TipoProvaDO Tipo_prova = tn.busca_tipo_prova_por_ID(id_tipo_prova); //Busca o tipo de prova pelo id escolhido
            String evento = (String)session.getAttribute("evento");             //Pega o valor do evento escolhido que está na sessão
            ProvasDO Prova = tn.busca_prova_por_ID_evento_ID_tiporpova(Integer.parseInt(evento, 10), Integer.parseInt(provas, 10));
            %>
            <tr>
                <td>
                <div style="float:left;width:25%;">
                    <h3>Atualizar resultado:</h3>
                    <h4>Prova: <%= Tipo_prova.getNome_Da_Prova()%></h4>
                </div>
                </td>
            </tr>
            <tr>
                <td>
                <div style="float:left;width:25%;">
                    <h3>Nome</h3>
                </div>
                <div style="float:left;width:25%;">
                    <h3>Tempo (min/seg/milésimos)</h3>
                </div>
                <div style="float:left;width:10%;">
                    <h3>Colocacao:</h3>
                </div>
                <div style="float:left;width:10%;">
                    <h3>Pontuacao</h3>
                </div>                
                </td>
            </tr>
            <%
            Vector lista_atletas = tn.buscar_lista_atleta_por_IDProvas(Prova.getId());//Pega todos os atletas daquela prova
            for(int i=0; i<lista_atletas.size(); i++){                          //Percorre todo vetor
                ListaAtletasDO ListaAtletas = (ListaAtletasDO)lista_atletas.elementAt(i);//Cria os objetos Lista atleta
                AtletaDO Atleta = tn.busca_atleta_por_ID_atleta(ListaAtletas.getId_ATLETA());//Cria os objetos atleta
                %>
                <tr>
                    <td>
                    <div style="float:left;width:25%;">
                        <%= Atleta.getNOME_ATLETA()%> <%= Atleta.getSOBRENOME_ATLETA()%>:
                    </div>
                    <div style="float:left;width:25%;">
                        <input class="e" type="number" placeholder="Minutos" name=<%= "min" + Atleta.getID_ATLETA()%>  size="2"  min="00">
                        <input class="e" type="number" placeholder="Segundos" name=<%= "seg" + Atleta.getID_ATLETA()%> size="2"  min="00" max="59">
                        <input class="e" type="number" placeholder="Milesimos" name=<%= "mil" + Atleta.getID_ATLETA()%> size="2"  min="00" max="1000">
                    </div>
                    <div style="float:left;width:10%;">
                        <input class="e" type="number" placeholder="Colocacao" name=<%= "col" + Atleta.getID_ATLETA()%>  size="2"  min="00">
                    </div>
                    <div style="float:left;width:10%;">
                        <input class="e" type="number" placeholder="Pontuacao" name=<%= "pon" + Atleta.getID_ATLETA()%>  size="2"  min="00">
                    </div>
                    
                    </td>
                </tr>  
            <%//Crio uma checkbox com todos os atletas do clube
            }%>  
            <%
            if(lista_atletas.size() == 0){%>
            <tr>
                <div style="float:left;width:25%;">
                    <td><h4>Nao existem atletas cadastrados na prova selecionada</h4>
                    </td>
                </div>
            </tr>
            <%}
            else{%>
                <tr>
                    <td>
                    <div style="float:left;width:25%;">
                        <input type="submit" name="confirmar" class="botao3" value="Confirmar">
                    </div>
                    <div style="float:left;width:25%;">
                        <input type="submit" name="cancelar" class="botao3" value="Cancelar">
                    </div>
                    </td>
                </tr>
            <%}
}

else if(null != request.getParameter("confirmar")){                             //Terceira tela, quando aperta o botao inscrever. Deve aparecer os atletas
            transacoes.EVNT tn = new transacoes.EVNT();           //Cria uma transacao auxiliar
            String provas = (String)session.getAttribute("prova");              //Pega o valor da prova escolhido que está na sessão
            String evento = (String)session.getAttribute("evento");             //Pega o valor do evento escolhido que está na sessão
            ProvasDO Prova = tn.busca_prova_por_ID_evento_ID_tiporpova(Integer.parseInt(evento, 10), Integer.parseInt(provas, 10));
            Vector lista_atletas = tn.buscar_lista_atleta_por_IDProvas(Prova.getId());//Pega todos os atletas daquela prova
            Vector atualizado = new Vector();
            Vector nao_atualizado = new Vector();
            for(int i = 0; i < lista_atletas.size(); i++){                      //Percorre vetor
                float min = 0; float seg = 0; float mil = 0;  String col = new String(); int pon = 0;//Carrega valores de min seg e mil
                ListaAtletasDO ListaAtletas = (ListaAtletasDO)lista_atletas.elementAt(i);//Cria os objetos Lista atleta
                AtletaDO Atleta = tn.busca_atleta_por_ID_atleta(ListaAtletas.getId_ATLETA());//Cria os objetos atleta
                String parametro_min = "min" + Integer.toString(Atleta.getID_ATLETA());
                String parametro_seg = "seg" + Integer.toString(Atleta.getID_ATLETA());
                String parametro_mil = "mil" + Integer.toString(Atleta.getID_ATLETA());
                String parametro_col = "col" + Integer.toString(Atleta.getID_ATLETA());
                String parametro_pon = "pon" + Integer.toString(Atleta.getID_ATLETA());
                if(request.getParameter(parametro_min).equals("") == false || request.getParameter(parametro_seg).equals("") == false || request.getParameter(parametro_mil).equals("") == false || request.getParameter(parametro_col).equals("") == false || request.getParameter(parametro_pon).equals("") == false){
                //Caso algum input daquele atleta for preenchido
                    min = Integer.parseInt(request.getParameter(parametro_min));
                    seg = Integer.parseInt(request.getParameter(parametro_seg));
                    mil = Integer.parseInt(request.getParameter(parametro_mil));
                    col = request.getParameter(parametro_col);
                    pon = Integer.parseInt(request.getParameter(parametro_pon));
                    float tempo = min + (seg/60) + ((mil/1000)/60);
                    ListaAtletas.setResultado(tempo);
                    ListaAtletas.setColocacao(col);
                    ListaAtletas.setPontuacao(pon);
                    if(tn.atualizar_resultado_ListaAtletas(ListaAtletas) != true){
                        nao_atualizado.add(Atleta.getNOME_ATLETA() + " " + Atleta.getSOBRENOME_ATLETA());
                        }
                    else{
                        atualizado.add(Atleta.getNOME_ATLETA() + " " + Atleta.getSOBRENOME_ATLETA());
                    }    
                }           
            }
            if(nao_atualizado.size() != 0){%>
            <h3>Houve um erro na inclusao dos seguintes atletas</h3>
            <%for(int i = 0; i < nao_atualizado.size(); i++){%>
                <%= nao_atualizado.elementAt(i)%><br>
            <%}
            }
            else{%>
            <h3>Os seguintes atletas foram atualizados com sucesso</h3>
            <%for(int i = 0; i < atualizado.size(); i++){%>
                <%= atualizado.elementAt(i)%><br>
            <%}
            }
            session.removeAttribute("prova");
            session.removeAttribute("evento");
}

else {  //O caso de uso começa aqui. Nenhum botao comeca apertado
            transacoes.EVNT tn = new transacoes.EVNT();           //Cria uma transacao auxiliar
            UsuarioDO usuario = tn.buscar_usuario_email(email);                 //Busca o usuario logado
            Vector eventos = tn.eventos_por_ID_federacao(usuario.getID_USER());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");          //Usaremos isso para formatar a data do evento a partir da string recebida
            Date data_atual = new Date();                                       //Pega a data atual
            %>
            <td height="400" width:="250" align = "Left" valign="Top">
            <h3>Atualizar resultado:</h3>
            <%
            if(eventos.size() == 0){%>
            <h3>Não há eventos disponíveis</h3>
            <%}
            else{%>
                <select class = "selecao" name="evento">
                <%for(int i=0; i<eventos.size(); i++){                              //Percorre o evento
                    EventoDO Evento = (EventoDO)eventos.elementAt(i);               //Cria classe com evento
                    Date data_evento = sdf.parse(Evento.getData_Inicio());          //Cria a data do evento com a String recebida
                    if(null != Evento && (data_evento.compareTo(data_atual)) <= 0){ //Caso exista evento e a da de inicio for menor que o data atual
                            %><option value=<%= Evento.getId() %>><%= Evento.getNome_Do_Evento() %></option><%
                    }
                    //Crio opçoes pra escolha
                }%>
                </select>
                <input type="submit" name="escolher" class="botao3" value="Escolher Provas"><br><br>
                <input type="submit" name="cancelar" class="botao3" value="Cancelar"><br><br>
            <%}
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