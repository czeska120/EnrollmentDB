package enrollment;
import java.sql.*;
import java.util.*;

/**
 * Report Class
 * @author ANG, Elliamae
 * @author CHENG, Jhervey
 * @author DOBLE, Francis
 * @author SILVESTRE, Franczeska
 */

public class report {
    public int                  term          = 0;
    public int                  schoolyear    = 00000000;
    public ArrayList<courses>   courseList    = new ArrayList<>();
    public ArrayList<Integer>   countList     = new ArrayList<>();
    
    
    
    
    public int generate_report(){
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            PreparedStatement sqlstatement = conn.prepareStatement("SELECT c.courseid, c.coursename, c.department, count(e.studentid) " 
                                                                   +"AS count FROM enrollment e "
                                                                   +"JOIN courses c on e.courseid = c.courseid " 
                                                                   +"WHERE schoolyear = ? AND term = ? " 
                                                                   +"GROUP BY e.courseid;");
            sqlstatement.setInt(1, schoolyear);
            sqlstatement.setInt(2, term);
            ResultSet rs = sqlstatement.executeQuery();
            while (rs.next()) {
                courses temp = new courses();
                int countTemp;
                temp.courseid = rs.getString("courseid");
                temp.coursename = rs.getString("coursename");
                temp.department = rs.getString("department");
                countTemp = rs.getInt("count");
                courseList.add(temp);
                countList.add(countTemp);
            }
            sqlstatement.close();
            conn.close();
            return 1;    
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
}
