/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entities.Photo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author hp
 */
public class Upload_DAO {
Connection con;
    public Upload_DAO(Connection con) {
        this.con=con;
    
    }
    public ArrayList<Photo> getAllImages() {

        ArrayList<Photo> al = new ArrayList<>();

        try {

            String q = "select image from album order by rdate;";
            Statement smt = con.createStatement();
            ResultSet rs = smt.executeQuery(q);
            while (rs.next()) {

                Photo p = new Photo(rs.getBlob("image"));
                al.add(p);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;

    }
    
    public ArrayList<Photo> getImagesByEmail(String email) {

        ArrayList<Photo> al = new ArrayList<>();

        try {

            String q = "select image from album where email=? order by rdate";
            PreparedStatement psmt = con.prepareStatement(q);
            psmt.setString(1, email);
            
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {

                Photo p = new Photo(rs.getBlob("image"));
                al.add(p);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;

    }
     public ArrayList<Photo> getImagesByTitle(String search) {

        ArrayList<Photo> al = new ArrayList<>();

        try {

            String q = "select image from album where title =? ";
            PreparedStatement psmt = con.prepareStatement(q);
            psmt.setString(1, search);
            
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {

                Photo p = new Photo(rs.getBlob("image"));
                al.add(p);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;

    }
    
    

    
    
    
}
