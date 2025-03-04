import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet{
    public void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
        PrintWriter out=res.getWriter();
        
        String usr=req.getParameter("email");
        String pwd=req.getParameter("Password");
        String pwd1=PasswordHashing.hashPassword(pwd);
        RequestDispatcher rd;
        Connection con=null;
        Statement stmt;
        ResultSet rs;

        try{
            con=DBConnect.fetchConnection();
            stmt=con.createStatement();
            // rs=stmt.executeQuery("select * from users where uname='"+usr+"' and pname='"+pwd+"'");
            
           rs=stmt.executeQuery("select * from users where email='"+usr+"' and password='"+pwd1+"'");
            
            if (rs.next()) {
                String role =rs.getString("role");
                int userId = rs.getInt("user_id");
                HttpSession session = req.getSession();
                session.setAttribute("currentuser", userId);
                session.setAttribute("role",role);
                
                if(role.equals("candidate")){
                    res.sendRedirect("Home.jsp");

                }
                else if(role.equals("Company")){
                    res.sendRedirect("Home.jsp");
                }
                else if(role.equals("admin")){
                    res.sendRedirect("Admin.jsp");
                }
               
            }
            else{
               res.sendRedirect("Home1.html?error=1");
            }

        }catch(Exception e){
            out.print(e);
        }
    }
}
