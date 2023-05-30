<%-- 
    Document   : submitenroll
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <title>Enroll Complete</title>
        <jsp:useBean id="enrollBean" class="enrollment.enroll" scope="session"/>
    </head>
    <body>
        <h1>Courses Have Been Enrolled</h1>
        <%enrollBean.confirmEnrollment();%>
        <%= enrollBean.Student.completename%> <br> <%=enrollBean.Student.studentid%><br>
        <table style="border: 1px solid black; border-collapse: collapse">
                <caption style="border: 1px solid black; border-collapse: collapse"><b>Course List</b></caption>
                <tr>
                    <th style="border: 1px solid black; border-collapse: collapse">Course ID</th>
                    <th style="border: 1px solid black; border-collapse: collapse">Course Name</th>
                    <th style="border: 1px solid black; border-collapse: collapse">Term</th>
                    <th style="border: 1px solid black; border-collapse: collapse">School Year</th>
                </tr>
                <% for(enrollment.enrollment E : enrollBean.EnrollmentList){                   %>
                <%    enrollment.courses C = new enrollment.courses();                  %>
                <%    C.courseid = E.courseid;                                          %>
                <%    int viewC = C.viewRecord();                                       %>
                <tr>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=E.courseid%></td>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=C.coursename%></td>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=E.term%></td>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=E.schoolyear%></td>
                </tr>
                <%}%>
            </table><br>
       <%enrollBean.clearEnrollment();%>
       <a href="index.html"><button>Return to Main Menu</button></a>
    </body>
</html>
