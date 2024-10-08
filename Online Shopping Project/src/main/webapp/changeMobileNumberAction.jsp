<%@ page import="project.ConnectionProvider" %>
<%@ page import = "java.sql.*"%>
<%
    String email = session.getAttribute("email").toString();
    String mobileNumber = request.getParameter("mobileNumber");
    String password = request.getParameter("password");
    int check = 0;
    try {
        Connection con = ConnectionProvider.getCon();
        
        String selectQuery = "SELECT * FROM users WHERE email = ? AND password = ?";
        PreparedStatement selectStatement = con.prepareStatement(selectQuery);
        selectStatement.setString(1, email);
        selectStatement.setString(2, password);
        ResultSet rs = selectStatement.executeQuery();
        
        if (rs.next()) {
            check = 1;
            
            String updateQuery = "UPDATE users SET mobileNumber = ? WHERE email = ?";
            PreparedStatement updateStatement = con.prepareStatement(updateQuery);
            updateStatement.setString(1, mobileNumber);
            updateStatement.setString(2, email);
            updateStatement.executeUpdate();
            updateStatement.close();
            
            response.sendRedirect("changeMobileNumber.jsp?msg=done");
        } else {
            response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
        }

        rs.close();
        selectStatement.close();
        con.close();
        
    } catch (Exception e) {
        System.out.println(e);
    }
%>
