package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Base64;
import java.util.ArrayList;
import com.dao.Upload_DAO;
import com.entities.Photo;
import com.helper.DatabaseConnection;

public final class SearchImage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    \n");
      out.write("    </head>\n");
      out.write("    <style>\n");
      out.write("        .allImages{\n");
      out.write("                height: 400px; \n");
      out.write("                width: 300px;               \n");
      out.write("                object-fit: cover;\n");
      out.write("                display: flex;\n");
      out.write("             \n");
      out.write("        }\n");
      out.write("        .allImages img{\n");
      out.write("             padding: 5px;\n");
      out.write("        }\n");
      out.write("        body{\n");
      out.write("            display: block;\n");
      out.write("            \n");
      out.write("        }\n");
      out.write("        .allUploads{\n");
      out.write("               \n");
      out.write("               display: grid;\n");
      out.write("               grid-auto-flow: row;\n");
      out.write("               grid-gap: 20px;\n");
      out.write("                grid-auto-columns:minmax(400px, auto);\n");
      out.write("               \n");
      out.write("               grid-auto-rows:minmax(400px, auto);\n");
      out.write("               \n");
      out.write("           \n");
      out.write("           \n");
      out.write("            }\n");
      out.write("            .box{\n");
      out.write("                padding: 10px;\n");
      out.write("            }\n");
      out.write("          .box>img{\n");
      out.write("               \n");
      out.write("                object-fit: cover;\n");
      out.write("                width: 400px;\n");
      out.write("                max-height: 600px;\n");
      out.write("                               \n");
      out.write("            }\n");
      out.write("    </style>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"allUploads\">\n");
      out.write("            <div class=\"box\">\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");


           String search =request.getParameter("search");
            ArrayList<Photo> al = new Upload_DAO(DatabaseConnection.getConnection()).getImagesByTitle(search);
            for (Photo c : al) {
                byte [] imageData = c.getBlobData().getBytes(1, (int) c.getBlobData().length());
            String encoded = Base64.getEncoder().encodeToString(imageData);
            String pic = "data:image/jpg;base64," + encoded;
            
            

        
      out.write("\n");
      out.write("\n");
      out.write("        <img style=\"width: 400px; height: 600px\" src=");
      out.print(pic);
      out.write(" />\n");
      out.write("\n");
      out.write("        ");
}
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("    </body>\n");
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
