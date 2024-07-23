<%-- 
    Document   : addbloodbank
    Created on : 19-Mar-2024, 11:56:24 am
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
        <h1 align="center">ADD NEW bloodblank</h1>
        <table align="center">
            <tr>
                <td>
                    <input type="text" name="bn" placeholder="Enter Bloodbank name" required />
                </td>
            </tr>    
            <tr>
                <td>
                    <input type="text" name="ba" placeholder="Enter Bloodbank address" required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="bci" placeholder="Enter bloodbank city" required />
                </td>
            </tr>
             <tr>
                <td>
                    <input type="text" name="bcn" placeholder="Enter Bloodbank contact " required />
                </td>
            </tr>
             <tr>
                <td>
                    <input type="text" name="bm" placeholder="Enter Bloodbank mail id " required />
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
        String name=request.getParameter("bn");
        String address=request.getParameter("ba");
        String city=request.getParameter("bci");
        String contact=request.getParameter("bcn");
        String mail=request.getParameter("bm");
         try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","rhitam123");	
	String ins="insert into addbloodbank(bname,baddress,bcity,bcontact,bmail) values(?,?,?,?,?)";
        PreparedStatement p=con.prepareStatement(ins);
        p.setString(1,name);
	p.setString(2,address);
        p.setString(3,city);
        p.setString(4,contact);
        p.setString(5,mail);
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

