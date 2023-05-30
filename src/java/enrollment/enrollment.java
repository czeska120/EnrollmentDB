package enrollment;
import java.sql.*;

/**
 * Data Management Class for Table Enrollment
 * @author ANG, Elliamae
 * @author CHENG, Jhervey
 * @author DOBLE, Francis
 * @author SILVESTRE, Franczeska
 */

public class enrollment {
    
    public int studentid;
    public String courseid;
    public int term;
    public int schoolyear;
    
    public enrollment () 
    {
        studentid = 00000000;
        courseid = "";
        term = 0;
        schoolyear = 00000000;
    };
    
    
    public int addRecord()  
    { 
        try
        {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");

            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO enrollment (studentid,courseid,term,schoolyear) VALUES (?,?,?,?)");
            pstmt.setInt(1,studentid);
            pstmt.setString(2,courseid);
            pstmt.setInt(3,term);
            pstmt.setInt(4,schoolyear);
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
   
    public int modRecord(String newcourseid)  
    { 
        try
        {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");

            PreparedStatement pstmt = conn.prepareStatement("UPDATE enrollment SET courseid=?" +
                                                            " WHERE studentid=? AND courseid=? AND term=? AND schoolyear=?");
            
            pstmt.setString(1,newcourseid);
            pstmt.setInt(2,studentid);
            pstmt.setString(3,courseid);
            pstmt.setInt(4,term);
            pstmt.setInt(5,schoolyear);
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

            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM enrollment WHERE studentid=? AND courseid=? AND term=? AND schoolyear=?");
            pstmt.setInt(1,studentid);
            pstmt.setString(2,courseid);
            pstmt.setInt(3,term);
            pstmt.setInt(4,schoolyear);
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

            PreparedStatement pstmt = conn.prepareStatement("SELECT *" +
                                                            "FROM enrollment WHERE studentid=? AND courseid=?");
            pstmt.setInt(1,studentid);
            pstmt.setString(2,courseid);
            
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                studentid = rs.getInt("studentid");
                courseid = rs.getString("courseid");
                term = rs.getInt("term");
                schoolyear = rs.getInt("schoolyear");
                
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
       enrollment ENROLL = new enrollment();
       
//       ENROLL.studentid = 10100001;
//       ENROLL.courseid = "CCICOMP";
//       ENROLL.term = 1;
//       ENROLL.schoolyear = 20192020;
//       ENROLL.addRecord();

//       ENROLL.studentid = 10100001;
//       ENROLL.courseid = "ITISORG";
//       ENROLL.term = 1;
//       ENROLL.schoolyear = 20192020;
//       ENROLL.modRecord("CCPROG1");

//       ENROLL.studentid = 10100001;
//       ENROLL.courseid = "CCICOMP";
//       ENROLL.term = 1;
//       ENROLL.schoolyear = 20192020;
//       ENROLL.viewRecord();
//       System.out.println(ENROLL.studentid);
//       System.out.println(ENROLL.courseid);
//       System.out.println(ENROLL.term);
//       System.out.println(ENROLL.schoolyear);

//       ENROLL.studentid = 10100001;
//       ENROLL.courseid = "CCICOMP";
//       ENROLL.term = 1;
//       ENROLL.schoolyear = 20192020;
//       ENROLL.delRecord();
    }
}
