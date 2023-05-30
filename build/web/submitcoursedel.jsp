<%-- 
    Document   : submitcoursedel
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Course Complete</title>
    </head>
    <body>
        <div style="font-family:arial">
            <h2>Course Record Deleted</h2>

            <!--Delete record-->
            <%
            enrollment.courses C = new enrollment.courses();
            C.courseid = request.getParameter("courseid");
            
            int del = C.delRecord();
            %>
            
            <!--List changes-->
            <% if(del == 1){ %>
                Record deleted successfully.<br><br>
            <% } else { %>
                ERROR: Record was not deleted successfully.<br><br>
            <% } %>
            
            <!--Return Button-->
            <a href="index.html"><button>Return to Main Menu</button></a>
            
        </div>
    </body>
</html>
