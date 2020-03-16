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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!Inicio do codigo HTML/JS>
<%String email = (String) session.getAttribute("user_email");
    boolean is_admin = (Boolean) session.getAttribute("is_admin");
    boolean is_federacao = (Boolean) session.getAttribute("is_federacao");
    boolean is_clube = (Boolean) session.getAttribute("is_clube");
    boolean is_tecnico = (Boolean) session.getAttribute("is_tecnico");
    boolean is_atleta = (Boolean) session.getAttribute("is_atleta");
    if (!is_federacao) {
        //verificacao manual de login
        pageContext.forward("main.jsp");
    }%>
<html>
    <form action="./gacc013.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
                    <% if (is_admin) {%>
                    <input type="submit" class="botao4" name="Admin" value="Admin">
                    <%}
                        if (is_federacao) {%>
                    <input type="submit" class="botao4" name="Federacao" value="Federacao">
                    <%}
                        if (is_clube) {%>
                    <input type="submit" class="botao4" name="Clube" value="Clube">
                    <%}
                        if (is_tecnico) {%>
                    <input type="submit" class="botao4" name="Tecnico" value="Tecnico">
                    <%}
                        if (is_atleta) {%>
                    <input type="submit" class="botao4" name="Atleta" value="Atleta">
                    <%}%>
                </table>
                <table>
                    <% if (null != request.getParameter("Home")) {
                            pageContext.forward("./index.jsp");
                        } else if (null != request.getParameter("Sair")) {
                            session.removeAttribute("user_email");
                            pageContext.forward("./index.jsp");
                        } else if (null != request.getParameter("Criar")) {
                        //Cria um usuário novo com as informações fornecidas:
                        data.UsuarioDO usuario = new data.UsuarioDO();
                        data.ClubeDO clube = new data.ClubeDO();
                        utils.Transacao tr = new utils.Transacao();
                        data.ClubeData c = new data.ClubeData();
                        data.UsuarioData u = new data.UsuarioData();
                        tr.begin();
                        
                        transacoes.GACC tn1 = new transacoes.GACC();
                        String email_usuario = request.getParameter("Email");
                        String senha_usuario = request.getParameter("Senha");
                        usuario.setEmail_User(email_usuario);
                        usuario.setPassword(senha_usuario);
                        usuario.setHabilitado_ADMIN(false);
                        usuario.setHabilitado_FEDERACAO(false);
                        usuario.setHabilitado_CLUBE(true);
                        usuario.setHabilitado_TECNICO(false);
                        usuario.setHabilitado_ATLETA(false);
                        
                        //Vamos verificar se o email fornecido já existe na base de dados:
                        transacoes.GACC tn1aux = new transacoes.GACC();
                        data.UsuarioDO usuario_existente = tn1aux.buscar_usuario_email(email_usuario);
                        
                        //Se o email ainda não existe, prosseguimos, e criamos na base de dados um
                        //usuário com as informações fornecidas:
                        if (usuario_existente == null) {
                                boolean bool1 = tn1.criar_usuario(usuario);
                                
                                //Precisamos, neste ponto, saber o id do usuário criado.
                                //Para isso, executa-se uma query cuja resposta é armazenada em
                                //usuario_criado:
                                transacoes.GACC tn2aux = new transacoes.GACC();
                                data.UsuarioDO usuario_criado = tn2aux.buscar_usuario_email(email_usuario);
                                int id_clube = usuario_criado.getID_USER();
                                
                                //Agora, criamos um objeto ClubeDO e o incluimos
                                //na base de dados:
                                transacoes.GACC tn2 = new transacoes.GACC();
                                transacoes.GACC tn3 = new transacoes.GACC();
                                
                                String user_email = (String) session.getAttribute("user_email");
                                UsuarioDO usuario_logado = tn3.buscar_usuario_email(user_email);
                                int id_federacao = usuario_logado.getID_USER();
                                
                                String nome_clube = request.getParameter("Nome Clube");
                                String endereco_clube = request.getParameter("Endereco Clube");
                                String site_clube = request.getParameter("Site Clube");
                                String logo_url_clube = request.getParameter("Logo URL Clube");
                                int mensalidade_clube = Integer.parseInt(request.getParameter("Mensalidade Clube"));
                                clube.setIdClube(id_clube);
                                clube.setIdFederacao(id_federacao);
                                clube.setNomeClube(nome_clube);
                                clube.setEnderecoClube(endereco_clube);
                                clube.setSiteClube(site_clube);
                                clube.setImgUrlClube(logo_url_clube);
                                clube.setMensalidadeClube(mensalidade_clube);
                                boolean bool2 = tn2.criar_clube(clube);%>
                                <h3>Conta criada com sucesso!</h3>
                                <%
                                
                                
                            }else if(usuario_existente != null){%>
                            Este email já está cadastrado!
                            <%}
                        
                        
                    } else {%>
                    <form action="demo_form.asp">
                        Nome do clube:<br>
                        <input type="text" name="Nome Clube" required><br>
                        Endereço:<br>
                        <input type="text" name="Endereco Clube" required><br>
                        URL do Logo:<br>
                        <input type="text" name="Logo URL Clube" required><br>
                        Site:<br>
                        <input type="text" name="Site Clube" required><br>
                        Mensalidade:<br>
                        <input type="text" name ="Mensalidade Clube" required>R$<br>
                        Email:<br>
                        <input type="text" name="Email" required><br>
                        Senha:<br>
                        <input type="password" name="Senha" required><br>
                        <input type="submit" class ="botao4" name = "Criar" value="Criar">
                    </form>
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