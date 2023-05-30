<%-- 
    Document   : updatecourse2
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
            
            <%
            enrollment.courses C = new enrollment.courses();
            C.courseid = request.getParameter("courseid");
            int view = C.viewRecord();
            %>
            
            <b>Course ID:</b> <%=C.courseid%><br>
            <b>Name:</b> <%=C.coursename%><br>
            <b>Department:</b> <%=C.department%><br><br>
            
            <form name="updatecourse" action="submitcourseupdate.jsp" method="POST">
                <!--Course ID-->
                <label for="courseid">Course ID: </label>
                <input type="text" name="courseid" id="courseid" value="<%=C.courseid%>" readonly><br>
                
                <!--Course Name-->
                <label for="coursename">Enter Course Name: </label>
                <input type="text" name="coursename" id="coursename" value="<%=C.coursename%>" required><br>
                
                <!--Department-->
                <label for="dept">Enter Department Name: </label>
                <input type="text" name="dept" id="dept" value="<%=C.department%>" required><br>
                
                <!--Submit-->
                <input type="submit" value="Update">
            </form>
        </div>
    </body>
</html>
