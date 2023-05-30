<%-- 
    Document   : datafordrop
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Drop Courses</title>
    </head>
    <body>
        <jsp:useBean id="dropBean" class="enrollment.drop" scope="session" />
        <div style="font-family:arial">
            <h2>Enter Student Data</h2>
            
            <!--Student enters his/her ID no and current term and school year-->
            <form name="studentdata" action="drop.jsp" method="POST">
                <!--Student ID-->
                <label for="studentid">Enter ID Number: </label>
                <input type="text" minlength="8" maxlength="8" pattern="^[0-9]+$" name="studentid" id="studentid" required><br>
                
                <!--Term-->
                <label for="term">Enter Term (1-3): </label>
                <input type="text" minlength="1" maxlength="1" pattern="^[0-9]+$" name="term" id="term" placeholder="1" required><br>
                
                <!--School Year-->
                <label for="schoolyear">Enter School Year: </label>
                <input type="text" minlength="8" maxlength="8" pattern="^[0-9]+$" name="schoolyear" id="schoolyear" placeholder="20192020" required><br>
                
                <!--Submit-->
                <input type="submit" value="Proceed to Drop">
            </form>
        </div>
    </body>
</html>
