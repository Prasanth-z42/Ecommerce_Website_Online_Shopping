<%@ page import="project.ConnectionProvider" %>
<%@ page import = "java.sql.*"%>
<%
    String email = session.getAttribute("email").toString();
    String securityQuestion = request.getParameter("securityQuestion");
    String newAnswer = request.getParameter("newAnswer");
    String password = request.getParameter("password");
    int check = 0;
    try {
        Connection con = ConnectionProvider.getCon();
        Statement selectStatement = con.createStatement();
        ResultSet rs = selectStatement.executeQuery("SELECT * FROM users WHERE email='" + email + "' AND password='" + password + "'");
        
        if (rs.next()) { 
            check = 1;
            Statement updateStatement = con.createStatement();
            updateStatement.executeUpdate("UPDATE users SET securityQuestion='" + securityQuestion + "', answer='" + newAnswer + "' WHERE email='" + email + "'");
            updateStatement.close();
            response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
        } else {
            response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
        }

        rs.close();
        selectStatement.close();
        con.close();
    } catch (Exception e) {
        System.out.println(e);
    }
%>
