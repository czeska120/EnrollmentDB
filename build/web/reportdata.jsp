<%-- 
    Document   : records
    Author     : ANG, Elliamae; CHENG, Jhervey; DOBLE, Francis; SILVESTRE, Franczeska
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generate Report</title>
    </head>
    <body>
        <h1>Generate Report</h1>
                
                <form name="recordsdata" action="report.jsp" method="POST">
                <!--Term-->
                <label for="term">Enter Term (1-3): </label>
                <input type="text" minlength="1" maxlength="1" pattern="^[0-9]+$" name="term" id="term" placeholder="1" required><br>
                
                <!--School Year-->
                <label for="schoolyear">Enter School Year: </label>
                <input type="text" minlength="8" maxlength="8" pattern="^[0-9]+$" name="schoolyear" id="schoolyear" placeholder="20192020" required><br>
                <input type="submit" value="Proceed to Records">
            </form>
    </body>
</html>
