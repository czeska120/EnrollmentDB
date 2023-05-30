<%-- 
    Document   : addtoenroll
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <jsp:useBean id="enrollBean" class="enrollment.enroll" scope="session"/>
        <title>Add To Cart</title>
    </head>
    <body>
        <h1>Add to Cart</h1>
       
        <% enrollment.enrollment e = new enrollment.enrollment(); %>
        <% e.studentid = enrollBean.Student.studentid;
           e.courseid = request.getParameter("coursetoenroll");
           e.term = enrollBean.getTerm();
           e.schoolyear = enrollBean.getSchoolYear();
           e.viewRecord();
         %>
         <% boolean inEnrollment = false; %>
         <%for(int i = 0; i < enrollBean.EnrollmentList.size(); i++)
         {
             enrollment.enrollment temp = new enrollment.enrollment();
             temp = enrollBean.EnrollmentList.get(i);
             if(temp.courseid.equals(e.courseid))
             {
                 inEnrollment = true;
                 break;
             }
         }%>
         
            <% if (!inEnrollment){ %>
                The following course has been added to cart: <br> 
                <%  enrollBean.EnrollmentList.add(e); %>
            <% }else{ %>
                The following course is already in the cart: <br>
            <% } %>
            
         <%=enrollBean.Student.completename%><br> <%=e.studentid%><br>
         <table style="border: 1px solid black; border-collapse: collapse">
                <caption style="border: 1px solid black; border-collapse: collapse"><b>Course List</b></caption>
                
                <tr>
                    <th style="border: 1px solid black; border-collapse: collapse">Course ID</th>
                    <th style="border: 1px solid black; border-collapse: collapse">Course Name</th>
                    <th style="border: 1px solid black; border-collapse: collapse">Term</th>
                    <th style="border: 1px solid black; border-collapse: collapse">School Year</th>
                </tr>
                <% for(enrollment.enrollment en : enrollBean.EnrollmentList){                   %>
                <%    enrollment.courses C = new enrollment.courses();                  %>
                <%    C.courseid = en.courseid;                                          %>
                <%    int viewC = C.viewRecord();                                       %>
                <tr>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=en.courseid%></td>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=C.coursename%></td>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=en.term%></td>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=en.schoolyear%></td>
                </tr>
                <%}%>
            </table><br>
            
            <a href="selectcoursestoenroll.jsp"><button> Add another course to enroll</button></a>
            <br> <a href="submitenroll.jsp"><button>Submit enroll</button></a>
    </body>
</html>
