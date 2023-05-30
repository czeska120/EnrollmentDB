<%-- 
    Document   : submitstudentadd
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Student Complete</title>
    </head>
    <body>
        <div style="font-family:arial">
            <h2>Student Record Added</h2>

            <!--Add record-->
            <%
            enrollment.students S = new enrollment.students();
            S.studentid = Integer.parseInt(request.getParameter("studentid"));
            S.completename = request.getParameter("completename");
            S.degreeid = request.getParameter("degreeid");
            
            int add = S.addRecord();
            
            if(add == 1){ 
            %>
            
            <!--List changes-->
                New record added successfully. Record details are as follows: <br>
                <% int view = S.viewRecord(); %>
            
                <b>Student ID:</b> <%=S.studentid%><br>
                <b>Name:</b> <%=S.completename%><br>
                <b>Degree ID:</b> <%=S.degreeid%><br><br>
                
            <% } else { %>
                ERROR: Record was not added successfully.<br><br>
            <% } %>
            
            
            <!--Return Button-->
            <a href="index.html"><button>Return to Main Menu</button></a>
            
        </div>
    </body>
</html>
