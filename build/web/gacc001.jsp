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
    if (!is_admin) {
        //verificacao manual de login
        pageContext.forward("main.jsp");
    }%>
<html>
    <form action="./gacc001.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
                <li><a href="./Ranking.jsp">Ranking</a>
                <li><a href="./gacc001.jsp">Adicionar Conta</a>
                <li><a href="./gacc006.jsp">Remover Conta</a>
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
                        data.FederacaoDO federacao = new data.FederacaoDO();
                        utils.Transacao tr = new utils.Transacao();
                        data.FederacaoData f = new data.FederacaoData();
                        data.UsuarioData u = new data.UsuarioData();
                        tr.begin();
                        
                        transacoes.GACC tn1 = new transacoes.GACC();
                        String email_usuario = request.getParameter("Email");
                        String senha_usuario = request.getParameter("Senha");
                        usuario.setEmail_User(email_usuario);
                        usuario.setPassword(senha_usuario);
                        usuario.setHabilitado_ADMIN(false);
                        usuario.setHabilitado_FEDERACAO(true);
                        usuario.setHabilitado_CLUBE(false);
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
                                int id_federacao = usuario_criado.getID_USER();
                                
                                //Agora, criamos um objeto FederacaoDO e o incluimos
                                //na base de dados:
                                transacoes.GACC tn2 = new transacoes.GACC();
                                String nome_federacao = request.getParameter("Nome Federacao");
                                String endereco_federacao = request.getParameter("Endereco Federacao");
                                String site_federacao = request.getParameter("Site Federacao");
                                String logo_url_federacao = request.getParameter("Logo URL Federacao");
                                federacao.setIdFEDERACAO(id_federacao);
                                federacao.setNomeFEDERACAO(nome_federacao);
                                federacao.setEnderecoFederacao(endereco_federacao);
                                federacao.setSiteFederacao(site_federacao);
                                federacao.setImgUrl(logo_url_federacao);
                                boolean bool2 = tn2.criar_federacao(federacao);%>
                                <h3>Conta criada com sucesso!</h3>
                                <%
                                
                                
                            }else if(usuario_existente != null){%>
                            Este email já está cadastrado!
                            <%}
                        
                        
                    } else {%>
                    <form action="demo_form.asp">
                        Nome da federação:<br>
                        <input type="text" name="Nome Federacao" required><br>
                        Endereço:<br>
                        <input type="text" name="Endereco Federacao" required><br>
                        Site:<br>
                        <input type="text" name="Site Federacao" required><br>
                        URL do logo:<br>
                        <input type="text" name="Logo URL Federacao" required><br>
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