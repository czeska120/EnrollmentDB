<%-- 
    Document   : delcourse2
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Course Record</title>
    </head>
    <body>
        <div style="font-family:arial">
            <h2>Delete Course Record</h2>
            
            <%
            enrollment.courses C = new enrollment.courses();
            C.courseid = request.getParameter("courseid");
            int view = C.viewRecord();
            %>
            
            The following record will be deleted: <br>
            
            <form name="delcourse" action="submitcoursedel.jsp" method="POST">
                <!--Course ID-->
                <label for="courseid">Course ID: </label>
                <input type="text" name="courseid" id="courseid" value="<%=C.courseid%>" readonly><br>
                
                <!--Course Name-->
                <label for="coursename">Course Name: </label>
                <input type="text" name="coursename" id="coursename" value="<%=C.coursename%>" readonly><br>
                
                <!--Department-->
                <label for="dept">Department Name: </label>
                <input type="text" name="dept" id="dept" value="<%=C.department%>" readonly><br>
                
                <!--Submit-->
                <input type="submit" value="Delete">
            </form>
        </div>
    </body>
</html>
