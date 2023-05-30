<%-- 
    Document   : selectcoursestoenroll
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*, enrollment.courses, enrollment.coursedegree" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Data</title>
    </head>
    <body>
        
        <jsp:useBean id="enrollBean" class="enrollment.enroll" scope="session"/>
        <h1>Student Data</h1>
        <%
            if (request.getParameter("studentid") != null)
                enrollBean.setStudent(Integer.parseInt(request.getParameter("studentid")));
            if (request.getParameter("term") != null)
                enrollBean.setTerm(Integer.parseInt(request.getParameter("term")));
            if (request.getParameter("schoolyear") != null)
                enrollBean.setYear(Integer.parseInt(request.getParameter("schoolyear")));
            %>  
            
            <b>Student ID:</b> <% out.print(enrollBean.Student.studentid); %><br>
            <b>Name:</b> <% out.print(enrollBean.Student.completename); %><br>
            <b>Degree ID:</b> <% out.print(enrollBean.Student.degreeid); %><br><br>
            <b>Term:</b> <% out.print(enrollBean.getTerm()); %><br>
            <b>School Year:</b> <% out.print(enrollBean.getSchoolYear()); %><br><br>
            
            
           <form name="addcourse" action="addtoenroll.jsp" method="POST">
                <% int load = enrollBean.loadCourses();                                    %>
                <label for="coursetoenroll">Select a course to enroll: </label>
                
                <select name="coursetoenroll" id="coursetoenroll" required>                 
                    <% for(int i = 0; i < enrollBean.CourseList.size(); i++){             %>
                    <%    coursedegree c = new coursedegree();            %>
                    <%    c = enrollBean.CourseList.get(i);                               %>
                            
                    <option value="<%=c.courseid%>"><%=c.courseid%></option>
                    <%}%>
                </select><br><br>
                
                <!--Submit-->
                <input type="submit" value="Add to Course Cart" name="addcourse">
            </form>  
                        
                    
    </body>
</html>
