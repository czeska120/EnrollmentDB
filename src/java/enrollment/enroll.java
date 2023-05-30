package enrollment;
import java.sql.*;
import java.util.*;

/**
 * Transaction Class for Facilitating Enroll
 * @author ANG, Elliamae
 * @author CHENG, Jhervey
 * @author DOBLE, Francis
 * @author SILVESTRE, Franczeska
 */

public class enroll {

    public students                        Student         = new students();
    public ArrayList<enrollment>    EnrollmentList  = new ArrayList<> ();
    public ArrayList<coursedegree>  CourseList      = new ArrayList<> ();
    int termnum;
    int schoolyear;
    public enroll() {
    };                                 // perform all the necessary data loading from DB
    
    public void setStudent(int studentid)
    {
        Student.studentid=studentid;
        Student.viewRecord();
    }
    
    public void setTerm(int term)
    {
        this.termnum = term;
    }
    
    public void setYear(int SY)
    {
        this.schoolyear = SY;
    }
    
    public int getTerm()
    {
        return this.termnum;
    }
    
    public int getSchoolYear()
    {
        return this.schoolyear;
    }
    
    public int clearEnrollment ()   {
        EnrollmentList.clear();
        return 0;   
    }   // clears enrollment data of the student 
    
    public void addToEnroll(enrollment e)
    {
        this.EnrollmentList.add(e);
    }
    
     public int loadCourses ()       {   
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            PreparedStatement sqlstatement = conn.prepareStatement("SELECT * FROM coursedegree");
            ResultSet rs = sqlstatement.executeQuery();
            CourseList.clear();
            while (rs.next()) {
                coursedegree temp = new coursedegree();
                
                temp.courseid = rs.getString("courseid");
                temp.degree = rs.getString("degree");
                temp.viewRecord();
                
                
                if(this.Student.degreeid.equals(temp.degree))
                {
                    enrollment e = new enrollment();
                    e.studentid = this.Student.studentid;
                    e.courseid = temp.courseid;
                    e.viewRecord();
                    if(e == null)
                       CourseList.add(temp);
                    else if(e.term != this.termnum && e.schoolyear != this.schoolyear)
                        CourseList.add(temp);
                }

            }
            sqlstatement.close();
            conn.close();
            return 1;    
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }   // load valid courses into the course list 
    public int confirmEnrollment()  {  
        try {
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/enrolldb?useTimezone=true&serverTimezone=UTC&user=root&password=12345678&useSSL=false");
            
            for(int i = 0; i < EnrollmentList.size(); i++){
                enrollment E = (enrollment) EnrollmentList.get(i);
                E.addRecord();
            }
            conn.close();
            return 1;    
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return 0;
        }         
    }   // saves enrollment data into the Database
    
}
