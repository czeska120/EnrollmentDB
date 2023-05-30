<%-- 
    Document   : updatecourse
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Course Record</title>
    </head>
    <body>
        <div style="font-family:arial">
            <h2>Update Course Record</h2>
            
            <form name="courseidform" action="updatecourse2.jsp" method="POST">
                <!--Student ID-->
                <label for="courseid">Enter ID of record to update: </label>
                <input type="text" minlength="7" maxlength="7" name="courseid" id="courseid" required><br>
                
                <!--Submit-->
                <input type="submit">
            </form>
        </div>
    </body>
</html>
