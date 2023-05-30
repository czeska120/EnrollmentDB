<%-- 
    Document   : updatestudent2
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Student Record</title>
    </head>
    <body>
        <div style="font-family:arial">
            <h2>Update Student Record</h2>
            
            <%
            enrollment.students S = new enrollment.students();
            S.studentid = Integer.parseInt(request.getParameter("studentid"));
            int view = S.viewRecord();
            %>
            
            <b>Student ID:</b> <%=S.studentid%><br>
            <b>Name:</b> <%=S.completename%><br>
            <b>Degree ID:</b> <%=S.degreeid%><br><br>
            
            <form name="updatestudent" action="submitstudentupdate.jsp" method="POST">
                <!--Student ID-->
                <label for="studentid">ID Number: </label>
                <input type="text" name="studentid" id="studentid" value="<%=S.studentid%>" readonly><br>
                
                <!--Complete Name-->
                <label for="completename">Enter Complete Name: </label>
                <input type="text" name="completename" id="completename" value="<%=S.completename%>" required><br>
                
                <!--Degree ID-->
                <label for="degreeid">Enter Degree ID: </label>
                <input type="text" minlength="4" maxlength="4" pattern="^[A-Z]+$" name="degreeid" id="degreeid" value="<%=S.degreeid%>" required><br>
                
                <!--Submit-->
                <input type="submit" value="Update">
            </form>
        </div>
    </body>
</html>
