import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class SignupServlet extends HttpServlet{
    public void service(HttpServletRequest req,HttpServletResponse resp) throws IOException ,ServletException{
        PrintWriter out=resp.getWriter();
        String name=req.getParameter("username");
        String email=req.getParameter("email");
        String password=req.getParameter("Password");

        String hashedPassword =PasswordHashing.hashPassword(password);

        Connection con;
        Statement stmt;
        RequestDispatcher rd;
        try{
            con=DBConnect.fetchConnection();
            stmt=con.createStatement();
           
            String query="insert into users(name,email,password) values('"+name+"','"+email+"','"+hashedPassword+"'); " ;
            stmt.executeUpdate(query);
            out.print("<script>alert('Register Successfully Completed.');</script>");
            rd=req.getRequestDispatcher("Home1.html");
            rd.include(req,resp);
        }   catch(Exception e){
            out.println(e);
        }
    }
}