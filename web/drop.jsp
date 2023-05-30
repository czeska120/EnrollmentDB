<%-- 
    Document   : drop
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
            <h2>Drop Courses</h2>
                        
            <!--Load data about the student (i.e. name, degree, etc.)-->
            <%
            if (request.getParameter("studentid") != null)
                dropBean.setStudentInfo(Integer.parseInt(request.getParameter("studentid")));
            if (request.getParameter("term") != null)
                dropBean.setTerm(Integer.parseInt(request.getParameter("term")));
            if (request.getParameter("schoolyear") != null)
                dropBean.setSY(Integer.parseInt(request.getParameter("schoolyear")));
            %>
            
            <b>Student ID:</b> <% out.print(dropBean.getStudentID()); %><br>
            <b>Name:</b> <% out.print(dropBean.getStudentName()); %><br>
            <b>Degree Code:</b> <% out.print(dropBean.getStudentDegree()); %><br><br>
            <b>Term:</b> <% out.print(dropBean.getTerm()); %><br>
            <b>School Year:</b> <% out.print(dropBean.getSY()); %><br><br>
            
            <!--Reset enrollment list-->
            <% int clear = dropBean.clearEnrollmentList(); %>
            
            <!--Load enrollment data of the student-->
            <% int load = dropBean.loadEnrollment();                                    %>
            
            <!--List courses the student can drop-->
            <table style="border: 1px solid black; border-collapse: collapse">
                <caption style="border: 1px solid black; border-collapse: collapse"><b>Currently Enrolled Courses</b></caption>
                <tr>
                    <th style="border: 1px solid black; border-collapse: collapse">Code</th>
                    <th style="border: 1px solid black; border-collapse: collapse">Name</th>
                </tr>
                <% for(int i = 0; i < dropBean.EnrollmentList.size(); i++){             %>
                <%    enrollment.enrollment E = new enrollment.enrollment();            %>
                <%    enrollment.courses C = new enrollment.courses();                  %>
                <%    E = dropBean.EnrollmentList.get(i);                               %>
                <%    C.courseid = E.courseid;                                          %>
                <%    int view = C.viewRecord();                                        %>
                <tr>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=E.courseid%></td>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=C.coursename%></td>
                </tr>
                <%}%>
            </table><br>
            
            <!--Student selects courses and adds it to dropping cart-->
            <form name="dropcourse" action="addtodrop.jsp" method="POST">               
                <label for="coursetodrop">Select a class to drop: </label>
                
                <select name="coursetodrop" id="coursetodrop" required>                 
                    <% for(int i = 0; i < dropBean.EnrollmentList.size(); i++){             %>
                    <%    enrollment.enrollment E = new enrollment.enrollment();            %>
                    <%    E = dropBean.EnrollmentList.get(i);                               %>
                          <option value="<%=E.courseid%>"><%=E.courseid%></option>
                    <%}%>
                </select><br><br>
                
                <!--Submit-->
                <input type="submit" value="Add to Drop List" name="adddrop">
            </form>
        </div>
    </body>
</html>
