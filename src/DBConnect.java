import java.sql.*;
public class DBConnect{
    public static Connection fetchConnection(){
        String driver="com.mysql.cj.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/onlinejob";
        String db="mysql";
        String dbuser="root";
        String pwd ="";
        Connection con =null;
        try{
            Class.forName(driver);
            con=DriverManager.getConnection(url,dbuser,pwd);
        }catch(ClassNotFoundException cnfe){
            System.out.print(cnfe);
        }catch(SQLException e){
            System.out.println(e);
        }

        return con;
    }
}