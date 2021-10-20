<%-- 
    Document   : jspexample3
    Created on : 22-Jul-2021, 11:16:28
    Author     : admin
    THIS EXAMPLE SHOWS HOW OBJECTS CAN BE STORED IN THE SESSION
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.lbholmes.oodd.webexercise1.model.User" %>

<%
    // retrieve the stored users list from the session
    List<User> users = (List<User>) session.getAttribute("usersList");
    if (users == null) {
        users = new ArrayList<User>();
        session.setAttribute("usersList", users);
    }

    String name = request.getParameter("userName");
    String address = request.getParameter("userAddress");
    String index = request.getParameter("index");

    // find what action to perform on the page
    String action = request.getParameter("action");

    if ("removeUser".equals(action)) {
        int i = Integer.parseInt(index);
        users.remove(name);
    } else if ("addUser".equals(action)) {
        User user = new User();
        user.setName(name);
        user.setAddress(address);
        users.add(user);
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Example 3</title>
    </head>
    <body>
        <h1>JSP Example 3: User list</h1>

        <h2>user list</h2>
        <table>
            <tr>
                <th>No</th>
                <th>Name</th>
                <th>Address</th>
            </tr>

            <% for (int idx = 0; idx < users.size(); idx++) {
                    User user = users.get(idx);
                    %>
            <tr>
                <td> <%=idx + 1%> </td>
                <td> <%=user.getName()%> </td>
                <td> <%=user.getAddress()%> </td>
                <td>
                    <form action="./jspexample3d.jsp" method="get">
                        <input type="hidden" name="userName" value="<%=user%>">
                        <input type="hidden" name="action" value="removeUser">
                        <button type="submit">Remove </button>
                        <input type="hidden" name="action" value="modifyUser">
                        <button type ="submit">Modify</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <h2>commands</h2>
        <form action="./jspexample3c.jsp" method="get">
            <p>User name <input type="text" name="userName" value=""></p>
            <input type="hidden" name="action" value="addUser">
            
            <br>
            <p>Address <input type="text" name="address" value=""></p>
            <input type="hidden" name="action" value="addUser">
            <button type="submit"> Add name and address to list </button>
        </form>
        <br>
    </body>
</html>