/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.helper;

import com.entities.User;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

public class Helper {

    static Connection con = DatabaseConnection.getConnection();

    public static boolean insertPhoto(InputStream is, String email) {

        boolean f = false;

        try {
            String sql = "insert into photo values(?,?)";

            PreparedStatement psmt = con.prepareStatement(sql);
            psmt.setString(1, email);
            psmt.setBlob(2, is);
            psmt.executeUpdate();
            return f = true;

        } catch (Exception e) {
            System.out.println(e);
        }

        return f;

    }

    public static boolean updatePhoto(InputStream is, String email) {

        try {
            String sql = "UPDATE photo SET Image_data = ? WHERE email=?";
            PreparedStatement psmt = con.prepareStatement(sql);
            psmt.setBlob(1, is);
            psmt.setString(2, email);
            psmt.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }

        return false;
    }

    public static boolean uploadPhoto(InputStream is, String email, String title, String desc) {
        try{
        String sql = "insert into album(title,description,email,image) values(?,?,?,?)";
        PreparedStatement psmt;

        psmt = con.prepareStatement(sql);
        
        psmt.setString(1, title);
        psmt.setString(2, desc);
        psmt.setString(3, email);
        psmt.setBlob(4, is);
        psmt.executeUpdate();
        return true;
    }
        catch(Exception e){
            System.err.println(e);
        }
        return false;
        
        
    }
}
