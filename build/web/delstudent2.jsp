<%-- 
    Document   : delstudent2
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
            
            <%
            enrollment.students S = new enrollment.students();
            S.studentid = Integer.parseInt(request.getParameter("studentid"));
            int view = S.viewRecord();
            %>
            
            The following record will be deleted: <br>
            
            <form name="delstudent" action="submitstudentdel.jsp" method="POST">
                <!--Student ID-->
                <label for="studentid">ID Number: </label>
                <input type="text" name="studentid" id="studentid" value="<%=S.studentid%>" readonly><br>
                
                <!--Complete Name-->
                <label for="completename">Complete Name: </label>
                <input type="text" name="completename" id="completename" value="<%=S.completename%>" readonly><br>
                
                <!--Degree ID-->
                <label for="degreeid">Degree ID: </label>
                <input type="text" name="degreeid" id="degreeid" value="<%=S.degreeid%>" readonly><br>
                
                <!--Submit-->
                <input type="submit" value="Delete">
            </form>
        </div>
    </body>
</html>
