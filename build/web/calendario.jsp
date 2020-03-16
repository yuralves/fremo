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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<!Inicio do codigo HTML/JS>
<%if ( session.getAttribute("user_email") == null) {
    //verificacao manual de login
}
String email = (String)session.getAttribute("user_email");
boolean is_admin = (Boolean)session.getAttribute("is_admin");
boolean is_federacao = (Boolean)session.getAttribute("is_federacao");
boolean is_clube = (Boolean)session.getAttribute("is_clube");
boolean is_tecnico = (Boolean)session.getAttribute("is_tecnico");
boolean is_atleta = (Boolean)session.getAttribute("is_atleta");

String action = request.getParameter("action");
if (null == action){
    action = "showEvents";
}

%>
<html>
    <form action="./calendario.jsp" method="post"><!mantem na mesma pagina e gera o request nos botoes)>
        <head>
            <link rel="stylesheet" type="text/css" href="EstilosCalendar.css">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>FREMO</title>
        </head>
        
        <!Tabela superior>
        <table style="width:100%" border=1 cellpadding="0" cellspacing="0" bgcolor="">
            <td align="Left" valign="top" height = "70">
                
                <br>
                <div style="float:left;width:50%;"><h3><input type="submit" class = "botao3" name="Home" value="Home"></h3></div>
                <div style="float:left;width:39%;"><h3>Header</h3></div>
                <%if (null != email) {
                %><div style="float:left;width:0%;"><h3><input type="submit" class = "botao3" name="Sair" value="Sair"</h3></div><%                    
                } else {%>
                <div style="float:left;width:0%;"><h3><input type="submit" class = "botao3" name="Entrar" value="Entrar"</h3></div>
                <%}%>
        </table>
        
        <!Miolo contendo menu e navegacao>
        <table style="width:100%" border=1 cellpadding="0" cellspacing="0">
            <td width="300" bgcolor="lightblue" align="left" valign="top">
                <br><br><br>
                <ul>
                <li><a class ="one" href="./calendario.jsp">Calendario</a>
                <li><a class ="one" href="./resultados.jsp">Resultados</a>
                <li><a class ="one" href="./ranking.jsp">Ranking</a>
                <li><a class ="one" href="./clubes.jsp">Clubes</a>
                <li><a class ="one" href="./contato.jsp">Contato</a>
                <li><a class ="one" href="./newsletter.jsp">Newsletter</a>
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
else if(null != request.getParameter("Entrar")){
    pageContext.forward("./index.jsp");
}

else if (action.equals("showDates")){
%>

<td align = "left" valign="top">

    <center>
    <script language="javascript" type="text/javascript">
    var day_of_week = new Array('Dom','Seg','Ter','Qua','Qui','Sex','Sab');
    var month_of_year = new Array('Janeiro','Fevereiro','Marco','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');

    //  DECLARE AND INITIALIZE VARIABLES
    var Calendar = new Date();

    var year = Calendar.getFullYear();     // Returns year
    var month = Calendar.getMonth();    // Returns month (0-11)
    var today = Calendar.getDate();    // Returns day (1-31)
    var weekday = Calendar.getDay();    // Returns day (1-31)

    var DAYS_OF_WEEK = 7;    // "constant" for number of days in a week
    var DAYS_OF_MONTH = 31;    // "constant" for number of days in a month
    var cal;    // Used for printing

    Calendar.setDate(1);    // Start the calendar day at '1'
    Calendar.setMonth(month);    // Start the calendar month at now


    /* VARIABLES FOR FORMATTING
    NOTE: You can format the 'BORDER', 'BGCOLOR', 'CELLPADDING', 'BORDERCOLOR'
          tags to customize your caledanr's look. */

    var TR_start = '<TR>';
    var TR_end = '</TR>';
    var highlight_start = '<TD WIDTH="30"><TABLE CELLSPACING=0 BORDER=1 BGCOLOR=DEDEFF BORDERCOLOR=CCCCCC><TR><TD WIDTH=20><B><CENTER>';
    var highlight_end   = '</CENTER></TD></TR></TABLE></B>';
    var TD_start = '<TD WIDTH="40"><CENTER>';
    var TD_end = '</CENTER></TD>';

    /* BEGIN CODE FOR CALENDAR
    NOTE: You can format the 'BORDER', 'BGCOLOR', 'CELLPADDING', 'BORDERCOLOR'
    tags to customize your calendar's look.*/

    cal =  '<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=0 BORDERCOLOR=BBBBBB><TR><TD>';
    cal += '<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=2>' + TR_start;
    cal += '<TD COLSPAN="' + DAYS_OF_WEEK + '" BGCOLOR="#EFEFEF"><CENTER><B>';
    cal += month_of_year[month]  + '   ' + year + '</B>' + TD_end + TR_end;
    cal += TR_start;

    //   DO NOT EDIT BELOW THIS POINT  //

    // LOOPS FOR EACH DAY OF WEEK
    for(index=0; index < DAYS_OF_WEEK; index++)
    {

    // BOLD TODAY'S DAY OF WEEK
    if(weekday == index)
    cal += TD_start + '<B>' + day_of_week[index] + '</B>' + TD_end;

    // PRINTS DAY
    else
    cal += TD_start + day_of_week[index] + TD_end;
    }

    cal += TD_end + TR_end;
    cal += TR_start;

    // FILL IN BLANK GAPS UNTIL TODAY'S DAY
    for(index=0; index < Calendar.getDay(); index++)
    cal += TD_start + '  ' + TD_end;

    // LOOPS FOR EACH DAY IN CALENDAR
    for(index=0; index < DAYS_OF_MONTH; index++)
    {
    if( Calendar.getDate() > index )
    {
      // RETURNS THE NEXT DAY TO PRINT
      week_day =Calendar.getDay();

      // START NEW ROW FOR FIRST DAY OF WEEK
      if(week_day == 0)
      cal += TR_start;

      if(week_day != DAYS_OF_WEEK)
      {

      // SET VARIABLE INSIDE LOOP FOR INCREMENTING PURPOSES
//      //var day  = Calendar.getDate();
//      var day_info = Calendar.getDate();
//      var day = '<input type="submit" class="botaocalendar" name="' + "button" + day_info + '" value="' + day_info +  '" style="float: left;">'
//
//      // HIGHLIGHT TODAY'S DATE
//      if( today==Calendar.getDate() )
//      cal += highlight_start + day + highlight_end + TD_end;

      //var day  = Calendar.getDate();
      var day_info = Calendar.getDate();
      var real_month = month+1;
      
      // HIGHLIGHT TODAY'S DATE
      if( today==Calendar.getDate() )
      var day = '<a class = "three" href=calendario.jsp?action=showDates&idDate=' + year + '-' + real_month + '-' + day_info + '>' + day_info + '</a>'
  
      else
      var day = '<a class = "two" href=calendario.jsp?action=showDates&idDate=' + year + '-' + real_month + '-' + day_info + '>' + day_info + '</a>'
      }

      // PRINTS DAY
      cal += TD_start + day + TD_end;

      // END ROW FOR LAST DAY OF WEEK
      if(week_day == DAYS_OF_WEEK)
      cal += TR_end;
      }

      // INCREMENTS UNTIL END OF THE MONTH
            Calendar.setDate(Calendar.getDate() + 1);

        }// end for loop

        cal += '</TD></TR></TABLE></TABLE>';

        //  PRINT CALENDAR
        document.write(cal);

        //  End -->
    </script>
</center>

</td>
    
<td align = "center" valign="center">
        <% 
        String id_Date = request.getParameter("idDate");
        transacoes.EVNT tr = new transacoes.EVNT();
        Vector eventos = tr.eventos_por_data(id_Date);
        for (int j = 0; j < eventos.size(); j++) {
            data.EventoDO eventoaux = ((EventoDO)eventos.elementAt(j));
            if (j==0){
        %>
        <font face = "Verdana" size = "5">Eventos do dia <%=id_Date%>:</font><br><br>
        
        <%}%>
        
        <font face = "Verdana" size = "3"><%=eventoaux.getNome_Do_Evento()%></font><br><br>
        <%}%>
</td>


<%
}
else {%>

<td align = "left" valign="top">

<center>
    <script language="javascript" type="text/javascript">
    var day_of_week = new Array('Dom','Seg','Ter','Qua','Qui','Sex','Sab');
    var month_of_year = new Array('Janeiro','Fevereiro','Marco','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro');

    //  DECLARE AND INITIALIZE VARIABLES
    var Calendar = new Date();

    var year = Calendar.getFullYear();     // Returns year
    var month = Calendar.getMonth();    // Returns month (0-11)
    var today = Calendar.getDate();    // Returns day (1-31)
    var weekday = Calendar.getDay();    // Returns day (1-31)

    var DAYS_OF_WEEK = 7;    // "constant" for number of days in a week
    var DAYS_OF_MONTH = 31;    // "constant" for number of days in a month
    var cal;    // Used for printing

    Calendar.setDate(1);    // Start the calendar day at '1'
    Calendar.setMonth(month);    // Start the calendar month at now


    /* VARIABLES FOR FORMATTING
    NOTE: You can format the 'BORDER', 'BGCOLOR', 'CELLPADDING', 'BORDERCOLOR'
          tags to customize your caledanr's look. */

    var TR_start = '<TR>';
    var TR_end = '</TR>';
    var highlight_start = '<TD WIDTH="30"><TABLE CELLSPACING=0 BORDER=1 BGCOLOR=DEDEFF BORDERCOLOR=CCCCCC><TR><TD WIDTH=20><B><CENTER>';
    var highlight_end   = '</CENTER></TD></TR></TABLE></B>';
    var TD_start = '<TD WIDTH="40"><CENTER>';
    var TD_end = '</CENTER></TD>';

    /* BEGIN CODE FOR CALENDAR
    NOTE: You can format the 'BORDER', 'BGCOLOR', 'CELLPADDING', 'BORDERCOLOR'
    tags to customize your calendar's look.*/

    cal =  '<TABLE BORDER=1 CELLSPACING=0 CELLPADDING=0 BORDERCOLOR=BBBBBB><TR><TD>';
    cal += '<TABLE BORDER=0 CELLSPACING=0 CELLPADDING=2>' + TR_start;
    cal += '<TD COLSPAN="' + DAYS_OF_WEEK + '" BGCOLOR="#EFEFEF"><CENTER><B>';
    cal += month_of_year[month]  + '   ' + year + '</B>' + TD_end + TR_end;
    cal += TR_start;

    //   DO NOT EDIT BELOW THIS POINT  //

    // LOOPS FOR EACH DAY OF WEEK
    for(index=0; index < DAYS_OF_WEEK; index++)
    {

    // BOLD TODAY'S DAY OF WEEK
    if(weekday == index)
    cal += TD_start + '<B>' + day_of_week[index] + '</B>' + TD_end;

    // PRINTS DAY
    else
    cal += TD_start + day_of_week[index] + TD_end;
    }

    cal += TD_end + TR_end;
    cal += TR_start;

    // FILL IN BLANK GAPS UNTIL TODAY'S DAY
    for(index=0; index < Calendar.getDay(); index++)
    cal += TD_start + '  ' + TD_end;

    // LOOPS FOR EACH DAY IN CALENDAR
    for(index=0; index < DAYS_OF_MONTH; index++)
    {
    if( Calendar.getDate() > index )
    {
      // RETURNS THE NEXT DAY TO PRINT
      week_day =Calendar.getDay();

      // START NEW ROW FOR FIRST DAY OF WEEK
      if(week_day == 0)
      cal += TR_start;

      if(week_day != DAYS_OF_WEEK)
      {

      // SET VARIABLE INSIDE LOOP FOR INCREMENTING PURPOSES
//      //var day  = Calendar.getDate();
//      var day_info = Calendar.getDate();
//      var day = '<input type="submit" class="botaocalendar" name="' + "button" + day_info + '" value="' + day_info +  '" style="float: left;">'
//
//      // HIGHLIGHT TODAY'S DATE
//      if( today==Calendar.getDate() )
//      cal += highlight_start + day + highlight_end + TD_end;

      //var day  = Calendar.getDate();
      var day_info = Calendar.getDate();
      var real_month = month+1;
      
      // HIGHLIGHT TODAY'S DATE
      if( today==Calendar.getDate() )
      var day = '<a class = "three" href=calendario.jsp?action=showDates&idDate=' + year + '-' + real_month + '-' + day_info + '>' + day_info + '</a>'
  
      else
      var day = '<a class = "two" href=calendario.jsp?action=showDates&idDate=' + year + '-' + real_month + '-' + day_info + '>' + day_info + '</a>'
      }

      // PRINTS DAY
      cal += TD_start + day + TD_end;

      // END ROW FOR LAST DAY OF WEEK
      if(week_day == DAYS_OF_WEEK)
      cal += TR_end;
      }

      // INCREMENTS UNTIL END OF THE MONTH
            Calendar.setDate(Calendar.getDate() + 1);

        }// end for loop

        cal += '</TD></TR></TABLE></TABLE>';

        //  PRINT CALENDAR
        document.write(cal);

        //  End -->
    </script>
</center>

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