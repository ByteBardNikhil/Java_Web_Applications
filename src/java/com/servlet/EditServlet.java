/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dao.UserDAO;
import com.entities.Message;
import com.entities.User;
import com.helper.DatabaseConnection;
import com.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

/**
 *
 * @author USER
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");

            String about = request.getParameter("user_about");

            Part part = request.getPart("file");

            String imageName = part.getSubmittedFileName();

            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");

            String pathPrevious = "C:\\Advance_Java_Project\\Our_Tech_Blog\\web\\pics" + File.separator + user.getProfile();
            if(!user.getProfile().equals("default.png"))
            Helper.deleteFile(pathPrevious);

            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            user.setAbout(about);
            if (imageName == "") {
                user.setProfile(user.getProfile());
            } else {
                user.setProfile(imageName);
            }

            UserDAO userdao = new UserDAO(DatabaseConnection.getConnection());
            boolean ans = userdao.updateData(user);

            if (ans == true) {
                out.println("Data has been updated");

                ///Code to add pic into server
                //File.seperator is used to put (slash) / 
                String path = "C:\\Advance_Java_Project\\Our_Tech_Blog\\web\\pics" + File.separator + user.getProfile();

                if (Helper.saveFile(part.getInputStream(), path)) {
                    
                   Message msg=new Message(user.getName()+" details have been Updated","success","alert-success");
                s.setAttribute("msg", msg);
                }
                else {
                     Message msg=new Message(user.getName()+" details have not been Updates <br> Please try again ","error","alert-danger");
                s.setAttribute("msg", msg);
                }

            } 
            response.sendRedirect("profile.jsp");

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
