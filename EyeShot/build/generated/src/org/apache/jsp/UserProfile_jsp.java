package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import com.dao.Upload_DAO;
import java.sql.Connection;
import com.helper.DatabaseConnection;
import java.util.Base64;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import com.dao.User_DAO;
import com.entities.Photo;
import com.entities.User;

public final class UserProfile_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    User user = (User) session.getAttribute("csmr");
    User_DAO u = new User_DAO();

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>User_Profile</title>\n");
      out.write("        <link href=\"css/homecss.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Trirong\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css\"/>\n");
      out.write("        <style>\n");
      out.write("            body, html {\n");
      out.write("                height: 70%;\n");
      out.write("                font-family:Trirong,sans-serif;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            * {\n");
      out.write("                box-sizing: border-box;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .bg-image {\n");
      out.write("\n");
      out.write("\n");
      out.write("                background: black;\n");
      out.write("                border-bottom-style: groove;\n");
      out.write("                border-radius: 0px 0px 50px 50px;   \n");
      out.write("\n");
      out.write("                height: 80%;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("            .bg-text {\n");
      out.write("\n");
      out.write("                border: 1px;\n");
      out.write("                border-radius: 30%;\n");
      out.write("                position: absolute;\n");
      out.write("\n");
      out.write("                left: 50%;\n");
      out.write("                transform: translate(-50%, -50%);\n");
      out.write("                z-index: 2;\n");
      out.write("\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            input[type=file]{\n");
      out.write("                fill: none;\n");
      out.write("                background: transparent;\n");
      out.write("                border: none; \n");
      out.write("            }\n");
      out.write("            button{\n");
      out.write("                background:grey;\n");
      out.write("                padding: 10px 20px;\n");
      out.write("                color: #fff;\n");
      out.write("                border: none;\n");
      out.write("                border-radius: 10px;\n");
      out.write("            }\n");
      out.write("            input[type=file]::file-selector-button {\n");
      out.write("                margin-right: 20px;\n");
      out.write("                border: none;\n");
      out.write("                background-color: grey;\n");
      out.write("                padding: 10px 20px;\n");
      out.write("                border-radius: 10px;\n");
      out.write("                color: #fff;\n");
      out.write("                cursor: pointer;\n");
      out.write("                transition: background .2s ease-in-out;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=file]::file-selector-button:hover {\n");
      out.write("                background:black;\n");
      out.write("            }\n");
      out.write("            .userProfile{\n");
      out.write("                height: 250px; \n");
      out.write("                width: 250px;\n");
      out.write("                border-radius: 100%;\n");
      out.write("                object-fit: cover;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            .allUploads{\n");
      out.write("               display: grid;\n");
      out.write("               grid-gap:1 rem;\n");
      out.write("               grid-template-columns:repeat(4,1fr);\n");
      out.write("               grid-auto-rows: fit-content(400px);\n");
      out.write("           \n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .box>img{\n");
      out.write("               \n");
      out.write("                object-fit: cover;\n");
      out.write("                width: 100%;\n");
      out.write("                max-height: 100%;\n");
      out.write("                               \n");
      out.write("            }\n");
      out.write("                \n");
      out.write("            \n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <header class=\"header\">\n");
      out.write("        <h3 class=\"logo\">Eyeshot</h3>                  \n");
      out.write("        <ul class=\"navbar\">\n");
      out.write("            <li><a href=\"explore.jsp\">Explore</a>\n");
      out.write("                <ul class=\"dropdown\">\n");
      out.write("                    <li><a href=\"#\">Editors</a></li>\n");
      out.write("                    <li><a href=\"#\">Contact Us</a></li>\n");
      out.write("                    <li><a href=\"#\">Popular Images</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </li>\n");
      out.write("            <li id=\"signUp\"><a href=\"Logout\">Logout</a></li>\n");
      out.write("            <li ><a href=\"UserProfile.jsp\">");
      out.print(user.getName());
      out.write("</a></li>\n");
      out.write("            <li><a href=\"upLoad.jsp\">Upload</a></li>\n");
      out.write("        </ul> \n");
      out.write("    </header>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!--middle starts-->\n");
      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"bg-image\"></div>\n");
      out.write("\n");
      out.write("    <div class=\"bg-text\">\n");
      out.write("        <form action=\"EditUserProfile\" method=\"Post\" enctype=\"multipart/form-data\">\n");
      out.write("\n");
      out.write("            <div><img class=\"userProfile\" \n");
      out.write("                      ");

                          boolean b = u.isDefault(user.getEmail());

                          if (b == false) {
                      
      out.write("\n");
      out.write("\n");
      out.write("                      src=\"userPics/default.jpg\" alt=\"Pic\"\n");
      out.write("                      ");

                      } else {

                          String pic = "data:image/jpg;base64," + u.getImage(user.getEmail());

                      
      out.write("\n");
      out.write("                      src=");
      out.print(pic);
      out.write("    \n");
      out.write("\n");
      out.write("                      ");
}
      out.write("\n");
      out.write("\n");
      out.write("                      />\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <input class=\"filed\" type=\"file\" name=\"file\" />\n");
      out.write("            <button type=\"submit\">Submit</button>\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!--middle Ends-->      \n");
      out.write(" <hr style=\"margin-top: 160px;\">\n");
      out.write(" <div class=\"allUploads\">\n");
      out.write("     <div class=\"box\">\n");
      out.write("       \n");
      out.write("\n");
      out.write("\n");
      out.write("        ");


           
            ArrayList<Photo> al = new Upload_DAO(DatabaseConnection.getConnection()).getImagesByEmail(user.getEmail());
            for (Photo c : al) {
                byte [] imageData = c.getBlobData().getBytes(1, (int) c.getBlobData().length());
            String encoded = Base64.getEncoder().encodeToString(imageData);
            String pic = "data:image/jpg;base64," + encoded;
            
            

        
      out.write("\n");
      out.write("\n");
      out.write("        <img  src=");
      out.print(pic);
      out.write(" /></div>\n");
      out.write("\n");
      out.write("        ");
}
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
