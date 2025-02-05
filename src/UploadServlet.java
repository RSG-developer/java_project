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
        String fname=req.getParameter("fname");
        String email=req.getParameter("email");
        String website =req.getParameter("website");
        String info=req.getParameter("data");
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
            out.println("Error");
        }

        try{
            Connection con=DBConnect.fetchConnection();
            String query="insert into AddData(filename,email,data,name) values(?,?,?,?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1,fileName);
            stmt.setString(2,email);
            stmt.setString(3,info);
            stmt.setString(4,fname);
            int res=stmt.executeUpdate();
            if(res >0){
                out.println("<script>alert('File uploaded Succesfully.');</script>");
                rd=req.getRequestDispatcher("AddFile.jsp");
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