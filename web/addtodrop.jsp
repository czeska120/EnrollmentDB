<%-- 
    Document   : addtodrop
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add to Drop</title>
    </head>
    <body>
        <jsp:useBean id="dropBean" class="enrollment.drop" scope="session" />
        <div style="font-family:arial">
            <h2>Add to Drop</h2>
            
            <!--Load data about the enrollment record to be dropped--> 
            <% 
            enrollment.enrollment E = new enrollment.enrollment();    
            E.studentid = dropBean.getStudentID();                    
            E.courseid = request.getParameter("coursetodrop");        
            E.term = dropBean.getTerm();                              
            E.schoolyear = dropBean.getSY();                          
            %>
            
            <!--Check if already in drop list-->
            <% 
            boolean in = false;
            enrollment.enrollment D = new enrollment.enrollment();
            for (int i = 0; i < dropBean.DropList.size(); i++){ 
                D = dropBean.DropList.get(i);
                if(E.studentid == D.studentid && E.term == D.term && E.schoolyear == D.schoolyear && E.courseid.equals(D.courseid) == true){
                    in = true;
                    break;
                }
            }
            %>
            
            <!--Add to drop list-->
            <% if (in == true){ %>
                The following enrollment record is already in the drop list: <br>   
            <% }else{ %>
                The following enrollment record has been added to drop list: <br>
            <%  int add = dropBean.addDrop(request.getParameter("coursetodrop"));
               } %>
                      
            <b>Student ID: </b> <%=E.studentid%><br>
            <b>Course Code: </b> <%=E.courseid%><br>
            <b>Term:</b> <%=E.term%><br>
            <b>School Year:</b> <%=E.schoolyear%><br><br>
            
            <!--List records inside the drop list-->
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
            
            <!--Add More to Drop Button-->
            <a href="drop.jsp"><button>Add More Courses to Drop List</button></a>
            
            <!--Submit Drop List Button-->
            <a href="submitdrop.jsp"><button>Submit Drop List</button></a>
            
        </div>
    </body>
</html>
