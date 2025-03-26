import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.*;
public class SearchServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse resp)throws IOException,ServletException
	{
        PrintWriter out=resp.getWriter();	
        String candidate=req.getParameter("candidate");
        out.println(candidate);
        Connection con=null;
        PreparedStatement stmt=null;
        ResultSet rs=null;
        RequestDispatcher rd;
        List <String[]> candidateList=new ArrayList<>();
        try{
            con=DBConnect.fetchConnection();
            String query="Select * from applyjob where name Like ?";
            stmt=con.prepareStatement(query);
            stmt.setString(1,candidate+"%");
            rs= stmt.executeQuery();
            while(rs.next()){
                String name=rs.getString("name");
                String email=rs.getString("email");
                String exper=rs.getString("experience");
                String skill=rs.getString("skill");
                String photo=rs.getString("photo");
                String resume=rs.getString("resume");
                
                candidateList.add(new String[]{name,email,exper,skill,photo,resume});
            }

        }catch(SQLException se){
            out.println(se.getMessage());
        }
        catch(Exception e){
            out.println(e.getMessage());
        }

        req.setAttribute("candidateList",candidateList);
        req.setAttribute("searchQuery",candidate);

        rd=req.getRequestDispatcher("Candidates.jsp");
        rd.forward(req,resp);
    }
}