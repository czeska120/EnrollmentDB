<%-- 
    Document   : submitcourseadd
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Course Complete</title>
    </head>
    <body>
        <div style="font-family:arial">
            <h2>Course Record Added</h2>

            <!--Add record-->
            <%
            enrollment.courses C = new enrollment.courses();
            C.courseid = request.getParameter("courseid");
            C.coursename = request.getParameter("coursename");
            C.department = request.getParameter("dept");
            
            int add = C.addRecord();
            
            if(add == 1){
            %>
                <!--List changes-->
                New record added successfully. Record details are as follows: <br>
                <% int view = C.viewRecord(); %>

                <b>Course ID:</b> <%=C.courseid%><br>
                <b>Course Name:</b> <%=C.coursename%><br>
                <b>Department:</b> <%=C.department%><br><br>
            
            <% } else { %>
                ERROR: Record was not added successfully.<br><br>
            <% } %>
            
            
            <!--Return Button-->
            <a href="index.html"><button>Return to Main Menu</button></a>
            
        </div>
    </body>
</html>
