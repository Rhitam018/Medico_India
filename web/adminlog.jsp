<%-- 
    Document   : adminlog
    Created on : 03-Mar-2024, 7:48:33 pm
    Author     : rhita
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="pink">
        <form method="post">
            <h1 align="center">ADMINISTRATION LOGIN PAGE</h1>
            <table align="center">
                <tr>
                    <td>
                        <input type="text" name="al" placeholder="Enter login id" required />
                    </td>
                </tr>
                <tr>
                    <td>
                       <input type="password" name="ap" placeholder="Enter password" required />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="LOGIN" />
                    </td>
                </tr>
            </table>
        </form>
        <%
            String alog=request.getParameter("al");
            String apass=request.getParameter("ap");
            try
            {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","rhitam123");
            String ins="select * from admin where alogid=? and apass=?";
            PreparedStatement p=con.prepareStatement(ins);
            p.setString(1,alog);
            p.setString(2,apass);
            ResultSet r=p.executeQuery();
            if(r.next())
            {
            response.sendRedirect("admin.jsp");
        }
        }
        catch(Exception e)
        {}
            %>
    </body>
</html>
