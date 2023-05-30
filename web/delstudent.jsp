<%-- 
    Document   : delstudent
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Student Record</title>
    </head>
    <body>
        <div style="font-family:arial">
            <h2>Delete Student Record</h2>
            
            <form name="studentidform" action="delstudent2.jsp" method="POST">
                <!--Student ID-->
                <label for="studentid">Enter ID Number of record to delete: </label>
                <input type="text" minlength="8" maxlength="8" pattern="^[0-9]+$" name="studentid" id="studentid" required><br>
                
                <!--Submit-->
                <input type="submit">
            </form>
        </div>
    </body>
</html>
