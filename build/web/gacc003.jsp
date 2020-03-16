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
    if (!is_clube) {
        //verificacao manual de login
        pageContext.forward("main.jsp");
    }%>
<html>
    <form action="./gacc003.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
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
                        data.TecnicoDO tecnico = new data.TecnicoDO();
                        utils.Transacao tr = new utils.Transacao();
                        data.TecnicoData t = new data.TecnicoData();
                        data.UsuarioData u = new data.UsuarioData();
                        tr.begin();
                        
                        transacoes.GACC tn1 = new transacoes.GACC();
                        String email_usuario = request.getParameter("Email");
                        String senha_usuario = request.getParameter("Senha");
                        usuario.setEmail_User(email_usuario);
                        usuario.setPassword(senha_usuario);
                        usuario.setHabilitado_ADMIN(false);
                        usuario.setHabilitado_FEDERACAO(false);
                        usuario.setHabilitado_CLUBE(false);
                        usuario.setHabilitado_TECNICO(true);
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
                                int id_tecnico = usuario_criado.getID_USER();
                                
                                //Agora, criamos um objeto TecnicoDO e o incluimos
                                //na base de dados:
                                transacoes.GACC tn2 = new transacoes.GACC();
                                transacoes.GACC tn3 = new transacoes.GACC();
                                
                                String user_email = (String) session.getAttribute("user_email");
                                UsuarioDO usuario_logado = tn3.buscar_usuario_email(user_email);
                                int id_clube = usuario_logado.getID_USER();
                                
                                String nome_tecnico = request.getParameter("Nome Tecnico");
                                String sobrenome_tecnico = request.getParameter("Sobrenome Tecnico");
                                String rg_tecnico = request.getParameter("RG Tecnico");
                                String cpf_tecnico = request.getParameter("CPF Tecnico");
                                String dia = request.getParameter("dia");
                                String mes = request.getParameter("mes");
                                String ano = request.getParameter("ano");
                                String data_nascimento = ano.concat("-");
                                data_nascimento = data_nascimento.concat(mes);
                                data_nascimento = data_nascimento.concat("-");
                                data_nascimento = data_nascimento.concat(dia);
                                
                                tecnico.setIdTecnico(id_tecnico);
                                tecnico.setIdClube(id_clube);
                                tecnico.setNomeTecnico(nome_tecnico);
                                tecnico.setSobrenomeTecnico(sobrenome_tecnico);
                                tecnico.setRgTecnico(rg_tecnico);
                                tecnico.setCpfTecnico(cpf_tecnico);
                                tecnico.setDataNascimentoTecnico(data_nascimento);
                                boolean bool2 = tn2.criar_tecnico(tecnico);%>
                                <h3>Conta criada com sucesso!</h3>
                                <%
                                
                                
                            }else if(usuario_existente != null){%>
                            Este email já está cadastrado!
                            <%}
                        
                        
                    } else {%>
                    <form action="demo_form.asp">
                        Nome do técnico:<br>
                        <input type="text" name="Nome Tecnico" required><br>
                        Sobrenome do técnico:<br>
                        <input type="text" name="Sobrenome Tecnico" required><br>
                        RG do técnico:<br>
                        <input type="text" name="RG Tecnico" required><br>
                        CPF do técnico:<br>
                        <input type="text" name="CPF Tecnico" required><br>
                        Data de nascimento:<br> 
                        <input class="b" type="number" placeholder="Dia (dd)" name="dia" size="2"  min="01" max="31" required>
                        <input class="b" type="number" placeholder="Mes (mm)" name="mes" size="2" min="01" max="12" required>
                        <input class="b" type="number" placeholder="Ano (yyyy)" name="ano" size="4" max="2016" min="1910" required><br><br> 
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