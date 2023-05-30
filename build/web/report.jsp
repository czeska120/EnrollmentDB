<%-- 
    Document   : report
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Generated</title>
    </head>
    <body>
        <jsp:useBean id="reportBean" class="enrollment.report" scope="session" />
        <h1>Generated Report</h1>
        
            <%
                reportBean.term = Integer.parseInt(request.getParameter("term"));
                reportBean.schoolyear = Integer.parseInt(request.getParameter("schoolyear"));
            %>
            <%int generate=reportBean.generate_report();%>
            
            
            <table style="border: 1px solid black; border-collapse: collapse">
                <caption style="border: 1px solid black; border-collapse: collapse"><b>School Year: <%=reportBean.schoolyear%> Term: <%=reportBean.term%> </b></caption>
                <tr>
                    <th style="border: 1px solid black; border-collapse: collapse">Course Name</th>
                    <th style="border: 1px solid black; border-collapse: collapse">Course ID</th>
                    <th style="border: 1px solid black; border-collapse: collapse">Department</th>
                    <th style="border: 1px solid black; border-collapse: collapse">Number of Students</th>
                </tr>
                <% for(int i = 0; i < reportBean.courseList.size(); i++){                   %>
                <%    enrollment.courses c = new enrollment.courses();           %>
                <%    c.courseid = reportBean.courseList.get(i).courseid;                  %>
                <%    int viewC = c.viewRecord();                                       %>
                <%    int count = reportBean.countList.get(i);                                       %>
                <tr>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=c.courseid%></td>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=c.coursename%></td>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=c.department%></td>
                    <td style="text-align: center; border: 1px solid black; border-collapse: collapse"><%=count%></td>
                </tr>
                <%}%>
            </table><br>
            <a href="index.html"><button>Return to Main Menu</button></a>
    </body>
</html>
