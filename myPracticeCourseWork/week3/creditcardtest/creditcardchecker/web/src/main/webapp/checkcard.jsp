<%-- 
    Document   : checkcard
    Created on : 28 Jul 2021, 17:13:43
    Author     : lbholmes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="solent.ac.uk.ood.examples.cardcheck.CardValidationResult" %>
<%@ page import="solent.ac.uk.ood.examples.cardcheck.RegexCardValidator" %>

<%
    // String creditcardno = request.getParameter("creditcardno");
    
    String number = request.getParameter("cardNo");
    // TODO CREATE LOGIC TO CHECK A CARD HERE
    // TIP - LOOK AT THE CODE IN TestRegexCardValidator.java
    
    CardValidationResult result = RegexCardValidator.isValid(number);
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Check Card</title>
    </head>
    <body>
        <h1>Check Credit Card</h1>

        TODO CREATE A PAGE WHICH CHECKS CARD HERE

        <form action="./checkcard.jsp" method="post">
            <input type="text" name="cardNo" value="<%=number%>">
            <input type="hidden" name="action" value="checkCard">
            <button type="submit"> Check Card </button>
        </form>

        <% if (result.isValid()) {%>
        <p>"<%= result.getCardNo()%>" is a valid card number issued by  <%= result.getCardType()%> </p>
        <%
        } else {
        %>
        <p>"<%= result.getCardNo()%>" is an invalid card : <%= result.getError()%> </p>
        <%
            }
        %>
    </body>
</html>
