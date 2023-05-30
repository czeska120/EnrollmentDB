<%-- 
    Document   : submitstudentupdate
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Student Complete</title>
    </head>
    <body>
        <div style="font-family:arial">
            <h2>Student Record Updated</h2>

            <!--Update record-->
            <%
            enrollment.students S = new enrollment.students();
            S.studentid = Integer.parseInt(request.getParameter("studentid"));
            S.completename = request.getParameter("completename");
            S.degreeid = request.getParameter("degreeid");
            
            int update = S.modRecord();
            
            if(update == 1){
            %>
            
            <!--List changes-->
            New details are as follows: <br>
            <% int view = S.viewRecord(); %>
            
            <b>Student ID:</b> <%=S.studentid%><br>
            <b>Name:</b> <%=S.completename%><br>
            <b>Degree ID:</b> <%=S.degreeid%><br><br>
            
            <% } else { %>
                ERROR: Record was not updated successfully.<br><br>
            <% } %>
            
            <!--Return Button-->
            <a href="index.html"><button>Return to Main Menu</button></a>
            
        </div>
    </body>
</html>
