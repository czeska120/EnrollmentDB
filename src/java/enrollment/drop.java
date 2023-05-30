package enrollment;
import java.sql.*;
import java.util.*;

/**
 * Transaction Class for Facilitating Drop
 * @author ANG, Elliamae
 * @author CHENG, Jhervey
 * @author DOBLE, Francis
 * @author SILVESTRE, Franczeska
 */

public class drop {
  
    students                        Student         = new students();
    public ArrayList<enrollment>    EnrollmentList  = new ArrayList<> ();
    public ArrayList<enrollment>    DropList        = new ArrayList<> ();
    int                             termnum         = 0;
    int                             schoolyear      = 00000000;

    public drop() {
        
    };                                   
    
    // perform all the necessary data loading from DB
    
    public void setStudentInfo(int studentid){
        Student.studentid = studentid;
        Student.viewRecord();
    }
    
    public void setTerm(int term) {
        termnum = term;
    }
    
    public void setSY(int SY) {
        schoolyear = SY;
    }
    
    public int getStudentID(){
        return Student.studentid;
    }
    
    public String getStudentName(){
        return Student.completename;
    }
    
    public String getStudentDegree(){
        return Student.degreeid;
    }
    
    public int getTerm(){
        return termnum;
    }
    
    public int getSY(){
        return schoolyear;
    }
            
    
    public int clearDrop ()         {
        DropList.clear();
        return 0;   
    }   // clears dropping data of the student
    
    public int clearEnrollmentList ()         {
        EnrollmentList.clear();
        return 0;   
    }
    
    public int addDrop (String courseid)    {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            PreparedStatement sqlstatement = conn.prepareStatement("SELECT * FROM enrollment WHERE studentid=? AND courseid=? AND term=? AND schoolyear=?");
            sqlstatement.setInt(1,Student.studentid);
            sqlstatement.setString(2,courseid);
            sqlstatement.setInt(3,termnum);
            sqlstatement.setInt(4,schoolyear);
            ResultSet rs = sqlstatement.executeQuery();
            while (rs.next()) {
                enrollment temp = new enrollment();
                temp.studentid = rs.getInt("studentid");
                temp.courseid = rs.getString("courseid");
                temp.term = rs.getInt("term");
                temp.schoolyear = rs.getInt("schoolyear");
                DropList.add(temp);
            }
            sqlstatement.close();
            conn.close();
            return 1;    
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    public int loadEnrollment ()    {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            PreparedStatement sqlstatement = conn.prepareStatement("SELECT * FROM enrollment WHERE studentid=? AND term=? AND schoolyear=?");
            sqlstatement.setInt(1,Student.studentid);
            sqlstatement.setInt(2,termnum);
            sqlstatement.setInt(3,schoolyear);
            ResultSet rs = sqlstatement.executeQuery();
            while (rs.next()) {
                enrollment temp = new enrollment();
                temp.studentid = rs.getInt("studentid");
                temp.courseid = rs.getString("courseid");
                temp.term = rs.getInt("term");
                temp.schoolyear = rs.getInt("schoolyear");
                EnrollmentList.add(temp);
            }
            sqlstatement.close();
            conn.close();
            return 1;    
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }   // load enrollment data of the student 
    
    public int confirmDrop()        {
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            for(int i = 0; i < DropList.size(); i++){
                enrollment E = (enrollment) DropList.get(i);
                E.delRecord();
            }
            conn.close();
            return 1;    
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }   
    }   // saves dropping data into the Database
    
}
