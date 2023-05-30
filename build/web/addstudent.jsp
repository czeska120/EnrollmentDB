<%-- 
    Document   : addstudent
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Student Record</title>
    </head>
    <body>
        <div style="font-family:arial">
            <h2>Add Student Record</h2>
            
            <form name="addstudent" action="submitstudentadd.jsp" method="POST">
                <!--Student ID-->
                <label for="studentid">Enter ID Number: </label>
                <input type="text" minlength="8" maxlength="8" pattern="^[0-9]+$" name="studentid" id="studentid" placeholder="Must be 8 digits" required><br>
                
                <!--Complete Name-->
                <label for="completename">Enter Complete Name: </label>
                <input type="text" name="completename" id="completename" placeholder="FirstName LastName" required><br>
                
                <!--Degree ID-->
                <label for="degreeid">Enter Degree ID: </label>
                <input type="text" minlength="4" maxlength="4" pattern="^[A-Z]+$" name="degreeid" id="degreeid" placeholder="BSxx" required><br>
                
                <!--Submit-->
                <input type="submit" value="Add Record">
            </form>
        </div>
    </body>
</html>
