<%-- 
    Document   : adddoctor
    Created on : 19-Jul-2024, 8:49:45 pm
    Author     : rhita
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add ambulance</title>
    </head>
    <body>
        <form method="post">
        <h1 align="center">ADD DOCTOR</h1>
        <table align="center">
            <tr>
                <td>
                    <input type="text" name="dn" placeholder="Enter DOCTOR NAME" required />
                </td>
            </tr>    
            <tr>
                <td>
                    <input type="text" name="da" placeholder="Enter DOCTOR address" required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="dcn" placeholder="Enter DOCTOR CITY" required />
                </td>
            </tr>
             <tr>
                <td>
                    <input type="text" name="dch" placeholder="Enter DOCTOR CHAMBER " required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="dsp" placeholder="Enter DOCTOR SPECIALIZATION " required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="dd" placeholder="Enter DOCTOR DEGREE " required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="dco" placeholder="Enter DOCTOR contact " required />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="dm" placeholder="Enter DOCTOR MAIL " required />
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
            String name=request.getParameter("dn");
            String addr=request.getParameter("da");
            String city=request.getParameter("dcn");
            String cham=request.getParameter("dch");
            String spec=request.getParameter("dsp");
            String degr=request.getParameter("dd");
            String dcnt=request.getParameter("dco");
            String mail=request.getParameter("dm");
            try
            {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical", "root", "rhitam123");
            String ins="insert into doctor(dname,daddr,dcity,dchamber,dspecialization,ddgree,dcontact,dmail) values(?,?,?,?,?,?,?,?)";
            PreparedStatement p=con.prepareStatement(ins);
            p.setString(1,name);
            p.setString(2,addr);
            p.setString(3,city);
            p.setString(4,cham);
            p.setString(5,spec);
            p.setString(6,degr);
            long cont=Long.parseLong(dcnt);
            p.setLong(7,cont);
            p.setString(8,mail);
            int r=p.executeUpdate();
            if(r>0)
            out.println("one record inserted");
        }
        catch(Exception e)
        {}
            %>
    </body>
</html>
