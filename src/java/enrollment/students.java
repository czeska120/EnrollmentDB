package enrollment;
import java.sql.*;

/**
 * Data Management Class for Table Students
 * @author ANG, Elliamae
 * @author CHENG, Jhervey
 * @author DOBLE, Francis
 * @author SILVESTRE, Franczeska
 */

public class students {
    
    public int studentid;
    public String completename;
    public String degreeid;
    
    public students () 
    {
        studentid = 00000000;
        completename = "";
        degreeid = "";
    };
    
    public int addRecord()  
    { 
        try
        {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");

            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO students (studentid,completename,degreeid) VALUES (?,?,?)");
            pstmt.setInt(1,studentid);
            pstmt.setString(2,completename);
            pstmt.setString(3,degreeid);
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

            PreparedStatement pstmt = conn.prepareStatement("UPDATE students SET completename=?,degreeid=?" +
                                                            " WHERE studentid=?");
            
            pstmt.setString(1,completename);
            pstmt.setString(2,degreeid);
            pstmt.setInt(3,studentid);
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

            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM students WHERE studentid=?");
            pstmt.setInt(1,studentid);
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

            PreparedStatement pstmt = conn.prepareStatement("SELECT studentid,completename,degreeid" +
                                                            " FROM students WHERE studentid=?");
            pstmt.setInt(1,studentid);
            
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                studentid = rs.getInt("studentid");
                completename = rs.getString("completename");
                degreeid = rs.getString("degreeid");
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
       students STUDENT = new students();
       
//       STUDENT.studentid = 10100000;
//       STUDENT.completename = "Juan Cruz";
//       STUDENT.degreeid = "BSIT";
//       STUDENT.addRecord();

//       STUDENT.studentid = 10100000;
//       STUDENT.completename = "Maria Clara";
//       STUDENT.degreeid = "BSCS";
//       STUDENT.modRecord();

//       STUDENT.studentid = 10100000;
//       STUDENT.viewRecord();
//       System.out.println(STUDENT.studentid);
//       System.out.println(STUDENT.completename);
//       System.out.println(STUDENT.degreeid);

//       STUDENT.studentid = 10100000;
//       STUDENT.delRecord();
    }
}
