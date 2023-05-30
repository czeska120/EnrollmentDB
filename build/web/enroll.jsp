<%-- 
    Document   : enroll
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:useBean id="enrollBean" class="enrollment.enroll" scope="session"/>
        <title>Enroll Courses</title>
    </head>
    <body>
            <h3>Enter Student Data</h3>  
                    
            <form name="studentdata" action="selectcoursestoenroll.jsp" method="POST">
                <!--Student ID-->
                <label for="studentid">Enter ID Number: </label>
                <input type="text" minlength="8" maxlength="8" pattern="^[0-9]+$" name="studentid" id="studentid" required><br>
                
                <!--Term-->
                <label for="term">Enter Term (1-3): </label>
                <input type="text" minlength="1" maxlength="1" pattern="^[0-9]+$" name="term" id="term" placeholder="1" required><br>
                
                <!--School Year-->
                <label for="schoolyear">Enter School Year: </label>
                <input type="text" minlength="8" maxlength="8" pattern="^[0-9]+$" name="schoolyear" id="schoolyear" placeholder="20192020" required><br>
                
                 
                <input type="submit" value="Proceed to Enroll" name="Load Student Data">
            </form>
           
           
        
    </body>
</html>
