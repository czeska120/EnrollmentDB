<%-- 
    Document   : addcourse
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Course Record</title>
    </head>
    <body>
        <div style="font-family:arial">
            <h2>Add Course Record</h2>
            
            <form name="addcourse" action="submitcourseadd.jsp" method="POST">
                <!--Course ID-->
                <label for="courseid">Enter Course ID: </label>
                <input type="text" minlength="7" maxlength="7" name="courseid" id="courseid" placeholder="Must be 7 characters" required><br>
                
                <!--Course Name-->
                <label for="coursename">Enter Course Name: </label>
                <input type="text" name="coursename" id="coursename" placeholder="Must be full name" required><br>
                
                <!--Department-->
                <label for="dept">Enter Department Name: </label>
                <input type="text" name="dept" id="dept" placeholder="Must be full name" required><br>
                
                <!--Submit-->
                <input type="submit" value="Add Record">
            </form>
        </div>
    </body>
</html>
