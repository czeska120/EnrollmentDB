package enrollment;
import java.sql.*;

/**
 * Data Management Class for Table Coursedegree
 * @author ANG, Elliamae
 * @author CHENG, Jhervey
 * @author DOBLE, Francis
 * @author SILVESTRE, Franczeska
 */

public class coursedegree {
    
    public String courseid;
    public String degree;
    
    public coursedegree () 
    {
        courseid = "";
        degree = "";
    };
    
    public int addRecord()  
    { 
        try
        {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");

            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO coursedegree (courseid, degree) VALUES (?,?)");
            pstmt.setString(1,courseid);
            pstmt.setString(2,degree);
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
   
    public int modRecord(String newdegree)  
    { 
        try
        {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");

            PreparedStatement pstmt = conn.prepareStatement("UPDATE coursedegree SET degree=? WHERE courseid=? AND degree=?");
            pstmt.setString(1,newdegree);
            pstmt.setString(2,courseid);
            pstmt.setString(3,degree);
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

            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM coursedegree WHERE courseid=? and degree=?");
            pstmt.setString(1,courseid);
            pstmt.setString(2,degree);
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

            PreparedStatement pstmt = conn.prepareStatement("SELECT courseid, degree" +
                                                            " FROM coursedegree WHERE courseid=? AND degree=?");
            pstmt.setString(1,courseid);
            pstmt.setString(2,degree);
            
            ResultSet rs = pstmt.executeQuery();
            while(rs.next())
            {
                courseid = rs.getString("courseid");
                degree = rs.getString("degree");
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
       coursedegree CDEGREES = new coursedegree();
       
//       CDEGREES.courseid = "ITISORG";
//       CDEGREES.degree = "BSCS";
//       CDEGREES.addRecord();

//       CDEGREES.courseid = "ITSECUR";
//       CDEGREES.degree = "BSCS";
//       CDEGREES.modRecord("BSIT");

//       CDEGREES.courseid = "ITSECUR";
//       CDEGREES.degree = "BSIT";
//       CDEGREES.viewRecord();
//       System.out.println(CDEGREES.courseid);
//       System.out.println(CDEGREES.degree);

//       CDEGREES.courseid = "ITISORG";
//       CDEGREES.degree = "BSCS";
//       CDEGREES.delRecord();
//
//       CDEGREES.courseid = "ITISORG";
//       CDEGREES.degree = "BSCS";
//       CDEGREES.delRecord();
       
    }
}
