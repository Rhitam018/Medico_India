<%-- 
    Document   : medicineshop
    Created on : 19-Mar-2024, 12:04:54 pm
    Author     : rhita
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>hospital add</title>
    </head>
    <body>
        <form method="post">
        <h1 align="center">ADD NEW MEDICINESHOP</h1>
        <table align="center">
            <tr>
                <td>
                    <input type="text" name="mn" placeholder="Enter Medicineshop name" required />
                </td>
            </tr>    
            <tr>
                <td>
                    <input type="text" name="ma" placeholder="Enter Medicineshop address" required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="mci" placeholder="Enter Medicineshop city" required />
                </td>
            </tr>
             <tr>
                <td>
                    <input type="text" name="mcn" placeholder="Enter Medicineshop contact " required />
                </td>
            </tr>
             <tr>
                <td>
                    <input type="text" name="md" placeholder="Enter Medicineshop days " required />
                </td>
            </tr>
              <tr>
                <td>
                    <input type="text" name="mh" placeholder="Enter Medicineshop hour " required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="Add"/>
                </td>
            </tr>
        </table>
    </form>
        <%
        String name=request.getParameter("mn");
        String address=request.getParameter("ma");
        String city=request.getParameter("mci");
        String contact=request.getParameter("mcn");
        String days=request.getParameter("md");
         String hour=request.getParameter("mh");
         try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","rhitam123");	
	String ins="insert into medicineshop(shopname,shopaddress,shopcity,shopcontact,shopdays,shophour) values(?,?,?,?,?,?)";
        PreparedStatement p=con.prepareStatement(ins);
        p.setString(1,name);
	p.setString(2,address);
        p.setString(3,city);
        p.setString(4,contact);
        p.setString(5,days);
        p.setString(6,hour);
        p.executeUpdate();
        out.println("Record added!");
        p.close();
        con.close();
        } 
        catch(Exception e)
           {}
        %>
    </body>
</html>

