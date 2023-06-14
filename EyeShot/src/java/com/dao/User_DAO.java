/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entities.User;
import com.helper.DatabaseConnection;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;

/**
 *
 * @author hp
 */
//DAO=data access object 
public class User_DAO {

    private Connection con;

    public User_DAO() {

    }

    public User_DAO(Connection con) {
        this.con = con;
    }

    public boolean saveUser(User user) {
        boolean f = false;
        try {

            String query = "insert into user(name,email,password) values(?,?,?);";
            PreparedStatement psmt = this.con.prepareStatement(query);

            psmt.setString(1, user.getName());
            psmt.setString(2, user.getEmail());
            psmt.setString(3, user.getPassword());
            psmt.executeUpdate();

            psmt.close();
            con.close();
            return true;

        } catch (Exception e) {
            System.out.println(e);
        }
        return false;

    }

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String query = "select *from user where email=? and password=?";
            PreparedStatement psmt = this.con.prepareStatement(query);
            psmt.setString(1, email);
            psmt.setString(2, password);
            ResultSet set = psmt.executeQuery();
            if (set.next()) {
                user = new User();
                String mail = set.getString("email");
                user.setEmail(mail);
                String name = set.getString("name");
                user.setName(name);
                String pass = set.getString("password");
                user.setPassword(pass);
                user.setId(set.getInt("Id"));
                user.setDateTime(set.getTimestamp("rdate"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;

    }

    public String getImage(String email) {

        try {
            String sql = "select *from photo where email=?";

            byte[] imageData = null;
            PreparedStatement psmt2 = con.prepareStatement(sql);
            psmt2.setString(1, email);

            ResultSet rs = psmt2.executeQuery();

            if (rs.next()) {
                //imageData = rs.getBytes("image_data");

                Blob bb = rs.getBlob("image_data");
                imageData = bb.getBytes(1, (int) bb.length());
                String encoded = Base64.getEncoder().encodeToString(imageData);

                return encoded;
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return null;
    }

    public boolean isDefault(String email) {
        con = DatabaseConnection.getConnection();
        try {

            String sql = "select email from photo where email=?";
            PreparedStatement psmt = this.con.prepareStatement(sql);
            psmt.setString(1, email);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {

                return true;
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
}
