import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.MultipartConfig;
@MultipartConfig
public class ApplyServlet extends HttpServlet{
   public void doPost(HttpServletRequest req,HttpServletResponse resp) throws IOException,ServletException{
        resp.setContentType("text/html");
        PrintWriter out=resp.getWriter();
        RequestDispatcher rd;
        String c_name=req.getParameter("fname");
        String c_email=req.getParameter("email");
        String qualification=req.getParameter("qual");
        String location=req.getParameter("location");
        String skill=req.getParameter("skill");
        String exper=req.getParameter("exper");
        String phone=req.getParameter("phone");
        String company_name=req.getParameter("comname");
        
        //out.println(" "+c_name+" email= "+c_email+" qualif= "+qualification+" location= "+location+" skill= "+skill+"exep= "+exper);
        //For photo
        Part photo=req.getPart("photo");
        String photoname=photo.getSubmittedFileName();
        //out.println("Photo name -"+photoname);

        //For resume
        Part resume=req.getPart("resume");
        String resumename=resume.getSubmittedFileName();
       // out.println("Resune name -"+resumename);


        String uploadResume="E:/tomcat8/webapps/JobPortal/Images/UpoladImages/"+resumename;
        String uploadPhoto="E:/tomcat8/webapps/JobPortal/Images/UpoladImages/"+photoname;
        // //out.println(uploadFile);

        try{
            FileOutputStream fos=new FileOutputStream(uploadResume);
            FileOutputStream fos1=new FileOutputStream(uploadPhoto);
            InputStream is=resume.getInputStream();
            InputStream is1=photo.getInputStream();
            byte[] r1=new byte[is.available()];
            byte[] r2=new byte[is1.available()];
            is.read(r1);
            is1.read(r2);
            fos.write(r1);
            fos1.write(r2);
            fos.close();
            fos1.close();
        }
        catch(Exception e){
            out.println(" "+ e.getMessage());
        }

        try{
            Connection con=DBConnect.fetchConnection();
            String query="insert into applyjob(name,email,qualification,location, photo,resume,experience,skill,phone,company_name) values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1,c_name);
            stmt.setString(2,c_email);
            stmt.setString(3,qualification);
            stmt.setString(4,location);
            stmt.setString(5,photoname);
            stmt.setString(6,resumename);
            stmt.setString(7,exper);
            stmt.setString(8,skill);
            stmt.setString(9,phone);
            stmt.setString(10,company_name);
            int res=stmt.executeUpdate();
            if(res >0){
                out.println("<script>alert('Applied  Succesfully.');</script>");
                
                rd=req.getRequestDispatcher("Home.jsp");
                rd.include(req,resp);
            }
            else{
                out.println("<script>alert('Error please re apply.')</script>");
            }
             
            
        }catch(Exception e ){
            out.println("Error");
        }
       
   }
}