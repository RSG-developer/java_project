import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.MultipartConfig;
@MultipartConfig
public class UploadServlet extends HttpServlet{
   public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException,ServletException{
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        RequestDispatcher rd;
        String cname=req.getParameter("fname");
        String cemail=req.getParameter("email");
        String cwebsite =req.getParameter("website");
        String cdesc=req.getParameter("data");
        String date=req.getParameter("date");
        Part file=req.getPart("filename");
        String fileName=file.getSubmittedFileName();
        //out.println("file name -"+fileName);
        String uploadFile="E:/tomcat8/webapps/OnlineJOB/Images/UpoladImages/"+fileName;
        //out.println(uploadFile);

        try{
            FileOutputStream fos=new FileOutputStream(uploadFile);
            InputStream is=file.getInputStream();
            byte[] data=new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        }
        catch(Exception e){
            out.println(" "+ e.getMessage());
        }

        try{
            Connection con=DBConnect.fetchConnection();
            String query="insert into addjob(name,email,website,image, decription,date) values(?,?,?,?,?,?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1,cname);
            stmt.setString(2,cemail);
            stmt.setString(3,cwebsite);
            stmt.setString(4,fileName);
            stmt.setString(5,cdesc);
            stmt.setString(6,date);
            int res=stmt.executeUpdate();
            if(res >0){
                out.println("<script>alert('File uploaded Succesfully.');</script>");
                
                rd=req.getRequestDispatcher("Home.jsp");
                rd.include(req,resp);
            }
            else{
                out.println("<script>alert('File not uploaded.')</script>");
            }
             
            
        }catch(Exception e ){
            out.println("Error");
        }
       
   }
}