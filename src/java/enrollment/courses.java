package enrollment;
import java.sql.*;

/**
 * Data Management Class for Table Courses
 * @author ANG, Elliamae
 * @author CHENG, Jhervey
 * @author DOBLE, Francis
 * @author SILVESTRE, Franczeska
 */

public class courses {
    
    public String courseid;
    public String coursename;
    public String department;
    
    public courses () 
    {
        courseid = "";
        coursename = "";
        department = "";
    };
    
    public int addRecord()  
    { 
        try
        {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");

            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO courses (courseid, coursename, department) VALUES (?,?,?)");
            pstmt.setString(1,courseid);
            pstmt.setString(2,coursename);
            pstmt.setString(3,department);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1; 
        } catch (SQLException e)
        {
            System.out.println(e.getMessage());
            return 0;
        }
    };
   
    public int modRecord()  
    { 
        try
        {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");

            PreparedStatement pstmt = conn.prepareStatement("UPDATE courses SET coursename=?, department=? WHERE courseid=?");
            pstmt.setString(3,courseid);
            pstmt.setString(1,coursename);
            pstmt.setString(2,department);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1; 
        } catch (SQLException e)
        {
            System.out.println(e.getMessage());
            return 0;
        }
    };
    
    public int delRecord()
    { 
        try
        {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");

            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM courses WHERE courseid=?");
            pstmt.setString(1,courseid);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return 1; 
        } catch (SQLException e)
        {
            System.out.println(e.getMessage());
            return 0;
        }
    };
    
    
    public int viewRecord()
     { 
        try
        {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");

            PreparedStatement pstmt = conn.prepareStatement("SELECT courseid, coursename, department" +
                                                            " FROM courses WHERE courseid=?");
            pstmt.setString(1,courseid);
            
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                courseid = rs.getString("courseid");
                coursename = rs.getString("coursename");
                department = rs.getString("department");
            }
            
            rs.close();
            pstmt.close();
            conn.close();

            return 1; 
        } catch (SQLException e)
        {
            System.out.println(e.getMessage());
            return 0;
        }
    };
    
    public static void main(String args[]) {
        //FOR TESTING
       courses COURSES = new courses();

//       COURSES.courseid = "ITNET01";
//       COURSES.coursename = "Intro to Networking";
//       COURSES.department = "Info Tech";
//       COURSES.addRecord();

//        COURSES.courseid = "ITNET01";
//        COURSES.coursename = "Introduction 2 Networking";
//        COURSES.department = "Information Technologies";
//        COURSES.modRecord();

//       COURSES.courseid = "ITNET01";
//       COURSES.delRecord();

//        COURSES.courseid = "CCICOMP";
//        COURSES.viewRecord();
//        System.out.println(COURSES.courseid);
//        System.out.println(COURSES.coursename);
//        System.out.println(COURSES.department);
    }
}
