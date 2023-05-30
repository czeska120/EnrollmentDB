<%-- 
    Document   : submitdrop
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Drop Complete</title>
    </head>
    <body>
        <jsp:useBean id="dropBean" class="enrollment.drop" scope="session" />
        <div style="font-family:arial">
            <h2>Courses Dropped</h2>
            
            <!--Confirm drop-->
            <% int confirm = dropBean.confirmDrop(); %>
            
            <!--List records inside the drop list-->
            The following courses have been dropped: <br>
            
            <table style="border: 1px solid black; border-collapse: collapse">
                <caption style="border: 1px solid black; border-collapse: collapse"><b>Drop List</b></caption>
                <tr>
                    <th style="border: 1px solid black; border-collapse: collapse">Student ID</th>
                    <th style="border: 1px solid black; border-collapse: collapse">Student Name</th>
                    <th style="border: 1px solid black; border-collapse: collapse">Course ID</th>
                    <th style="border: 1px solid black; border-collapse: collapse">Course Name</th>
                    <th style="border: 1px solid black; border-collapse: collapse">Term</th>
                    <th style="border: 1px solid black; border-collapse: collapse">School Year</th>
                </tr>
                <% for(int i = 0; i < dropBean.DropList.size(); i++){                   %>
                <%    enrollment.enrollment E = new enrollment.enrollment();            %>
                <%    enrollment.courses C = new enrollment.courses();                  %>
                <%    enrollment.students S = new enrollment.students();                %>
                <%    E = dropBean.DropList.get(i);                                     %>
                <%    C.courseid = E.courseid;                                          %>
                <%    S.studentid = E.studentid;                                        %>
                <%    int viewC = C.viewRecord();                                       %>
                <%    int viewS = S.viewRecord();                                       %>
                <tr>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=E.studentid%></td>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=S.completename%></td>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=E.courseid%></td>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=C.coursename%></td>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=E.term%></td>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=E.schoolyear%></td>
                </tr>
                <%}%>
            </table><br>
            
            <!--Clear drop list-->
            <% int clear = dropBean.clearDrop(); %>
            
            <!--Return Button-->
            <a href="index.html"><button>Return to Main Menu</button></a>
            
        </div>
    </body>
</html>
