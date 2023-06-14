package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class upLoad_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        \n");
      out.write("<link href='https://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700' rel='stylesheet' type='text/css'>\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            .file-area {\n");
      out.write("  width: 100%;\n");
      out.write("  position: relative;\n");
      out.write("  \n");
      out.write("  input[type=file] {\n");
      out.write("    position: absolute;\n");
      out.write("    width: 100%;\n");
      out.write("    height: 100%;\n");
      out.write("    top: 0;\n");
      out.write("    left: 0;\n");
      out.write("    right: 0;\n");
      out.write("    bottom: 0;\n");
      out.write("    opacity: 0;\n");
      out.write("    cursor: pointer;\n");
      out.write("  }\n");
      out.write("  \n");
      out.write("  .file-dummy {\n");
      out.write("    width: 100%;\n");
      out.write("    padding: 30px;\n");
      out.write("    background: rgba(255,255,255,0.2);\n");
      out.write("    border: 2px dashed rgba(255,255,255,0.2);\n");
      out.write("    text-align: center;\n");
      out.write("    transition: background 0.3s ease-in-out;\n");
      out.write("    \n");
      out.write("    .success {\n");
      out.write("      display: none;\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("  \n");
      out.write("  &:hover .file-dummy {\n");
      out.write("    background: rgba(255,255,255,0.1);\n");
      out.write("  }\n");
      out.write("  \n");
      out.write("  input[type=file]:focus + .file-dummy {\n");
      out.write("    outline: 2px solid rgba(255,255,255,0.5);\n");
      out.write("    outline: -webkit-focus-ring-color auto 5px;\n");
      out.write("  }\n");
      out.write("  \n");
      out.write("  input[type=file]:valid + .file-dummy {\n");
      out.write("    border-color: rgba(0,255,0,0.4);\n");
      out.write("    background-color: rgba(0,255,0,0.3);\n");
      out.write("\n");
      out.write("    .success {\n");
      out.write("      display: inline-block;\n");
      out.write("    }\n");
      out.write("    .default {\n");
      out.write("      display: none;\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("/* ===================== BASIC STYLING ===================== */\n");
      out.write("\n");
      out.write("* {\n");
      out.write("  box-sizing: border-box;\n");
      out.write("  font-family: 'Lato', sans-serif;\n");
      out.write("}\n");
      out.write("\n");
      out.write("html,\n");
      out.write("body {\n");
      out.write("  margin: 0;\n");
      out.write("  padding: 0;\n");
      out.write("  font-weight: 300;\n");
      out.write("  height: 100%;\n");
      out.write("  background: #053777;\n");
      out.write("  color: #fff;\n");
      out.write("  font-size: 16px;\n");
      out.write("  overflow: hidden;\n");
      out.write("  background: -moz-linear-gradient(top, #053777 0%, #00659b 100%);\n");
      out.write("  /* FF3.6+ */\n");
      out.write("  \n");
      out.write("  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #053777), color-stop(100%, #00659b));\n");
      out.write("  /* Chrome,Safari4+ */\n");
      out.write("  \n");
      out.write("  background: -webkit-linear-gradient(top, #053777 0%, #00659b 100%);\n");
      out.write("  /* Chrome10+,Safari5.1+ */\n");
      out.write("  \n");
      out.write("  background: -o-linear-gradient(top, #053777 0%, #00659b 100%);\n");
      out.write("  /* Opera 11.10+ */\n");
      out.write("  \n");
      out.write("  background: -ms-linear-gradient(top, #053777 0%, #00659b 100%);\n");
      out.write("  /* IE10+ */\n");
      out.write("  \n");
      out.write("  background: linear-gradient(to bottom, #053777 0%, #00659b 100%);\n");
      out.write("  /* W3C */\n");
      out.write("  \n");
      out.write("}\n");
      out.write("\n");
      out.write("h1 {\n");
      out.write("  text-align: center;\n");
      out.write("  margin: 50px auto;\n");
      out.write("  font-weight: 100;\n");
      out.write("}\n");
      out.write("\n");
      out.write("label {\n");
      out.write("  font-weight: 500;\n");
      out.write("  display: block;\n");
      out.write("  margin: 4px 0;\n");
      out.write("  text-transform: uppercase;\n");
      out.write("  font-size: 13px;\n");
      out.write("  overflow: hidden;\n");
      out.write("  \n");
      out.write("  span {\n");
      out.write("    float: right;\n");
      out.write("    text-transform: none;\n");
      out.write("    font-weight: 200;\n");
      out.write("    line-height: 1em;\n");
      out.write("    font-style: italic;\n");
      out.write("    opacity: 0.8;\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write(".form-controll {\n");
      out.write("  display: block;\n");
      out.write("  padding: 8px 16px;\n");
      out.write("  width: 100%;\n");
      out.write("  font-size: 16px;\n");
      out.write("  background-color: rgba(255,255,255,0.2);\n");
      out.write("  border: 1px solid rgba(255,255,255,0.3);\n");
      out.write("  color: #fff;\n");
      out.write("  font-weight: 200;\n");
      out.write("  \n");
      out.write("  &:focus {\n");
      out.write("    outline: 2px solid rgba(255,255,255,0.5);\n");
      out.write("    outline: -webkit-focus-ring-color auto 5px;\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write("button {\n");
      out.write("  padding: 8px 30px;\n");
      out.write("  background: rgba(255,255,255,0.8);\n");
      out.write("  color: #053777;\n");
      out.write("  text-transform: uppercase;\n");
      out.write("  font-weight: 600;\n");
      out.write("  font-size: 11px;\n");
      out.write("  border: 0;\n");
      out.write("  text-shadow: 0 1px 2px #fff;\n");
      out.write("  cursor: pointer;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".form-group {\n");
      out.write("  max-width: 500px;\n");
      out.write("  margin: auto;\n");
      out.write("  margin-bottom: 30px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".back-to-article {\n");
      out.write("  color: #fff;\n");
      out.write("  text-transform: uppercase;\n");
      out.write("  font-size: 12px;\n");
      out.write("  position: absolute;\n");
      out.write("  right: 20px;\n");
      out.write("  top: 20px;\n");
      out.write("  text-decoration: none;\n");
      out.write("  display: inline-block;\n");
      out.write("  background: rgba(0,0,0,0.6);\n");
      out.write("  padding: 10px 18px;\n");
      out.write("  transition: all 0.3s ease-in-out;\n");
      out.write("  opacity: 0.6;\n");
      out.write("  \n");
      out.write("  &:hover {\n");
      out.write("    opacity: 1;\n");
      out.write("    background: rgba(0,0,0,0.8);\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <form action method=\"post\">\n");
      out.write("  \n");
      out.write("  <h1><strong>File upload</strong> with style and pure CSS</h1>\n");
      out.write("  \n");
      out.write("  <div class=\"form-group\">\n");
      out.write("    <label for=\"title\">Title <span>Use title case to get a better result</span></label>\n");
      out.write("    <input type=\"text\" name=\"title\" id=\"title\" class=\"form-controll\"/>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"form-group\">\n");
      out.write("    <label for=\"caption\">Caption <span>This caption should be descriptiv</span></label>\n");
      out.write("    <input type=\"text\" name=\"caption\" id=\"caption\" class=\"form-controll\"/>\n");
      out.write("  </div>\n");
      out.write("  \n");
      out.write("  <div class=\"form-group file-area\">\n");
      out.write("        <label for=\"images\">Images <span>Your images should be at least 400x300 wide</span></label>\n");
      out.write("    <input type=\"file\" name=\"images\" id=\"images\" required=\"required\" multiple=\"multiple\"/>\n");
      out.write("    <div class=\"file-dummy\">\n");
      out.write("      <div class=\"success\">Great, your files are selected. Keep on.</div>\n");
      out.write("      <div class=\"default\">Please select some files</div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  \n");
      out.write("  <div class=\"form-group\">\n");
      out.write("    <button type=\"submit\">Upload images</button>\n");
      out.write("  </div>\n");
      out.write("  \n");
      out.write("</form>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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