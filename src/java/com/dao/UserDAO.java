package com.dao;

import java.sql.Connection;
import com.entities.User;
import com.helper.DatabaseConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    private Connection con;

    public UserDAO() {
    }

    public UserDAO(Connection con) {
        this.con = con;
    }

    //method to save all the data
    public boolean saveUser(User user) {
        boolean f = false;
        try {

            String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?) ";

            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();

            f = true;
            return f;
        } catch (Exception e) {
            System.out.println(e);
        }
        return f;
    }
    //creating a function as getUserByEmailAndPassword(..,..)
    User user = null;

    public User getUserByEmailAndPassword(String email, String password) {
        try {
            Connection con = DatabaseConnection.getConnection();

            String q = "select *from user where email=? and password=?;";
            PreparedStatement psmt = con.prepareStatement(q);

            psmt.setString(1, email);
            psmt.setString(2, password);

            ResultSet rs = psmt.executeQuery();

            if (rs.next()) {

                user = new User();
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setId(rs.getInt("id"));
                user.setProfile(rs.getString("profile"));

                return user;

            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return user;
    }

    public boolean updateData(User user) {
        boolean f = false;

        try {
            Connection con = DatabaseConnection.getConnection();
            String q = "update user set name=?,email=?,password=?,gender=?,about=?,profile=? where id=?;";
            PreparedStatement psmt = con.prepareStatement(q);
            String name=user.getName();
            String email=user.getEmail();
            String password=user.getPassword();
           String gender=user.getGender();
           String profile=user.getProfile();
           String about=user.getAbout();
           int id=user.getId();
           
            psmt.setString(1, name);
            psmt.setString(2, email);
            psmt.setString(3,password);
            psmt.setString(4, gender);
            psmt.setString(5,about);
            psmt.setString(6, profile);
            psmt.setInt(7, id);
            psmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println(e);
        }

        return f;
    }
    public String getNameById(int pid)
    {
        String q="select *from user where id=?";
        try{
        PreparedStatement psmt=con.prepareStatement(q);
        psmt.setInt(1, pid);
        ResultSet rs=psmt.executeQuery();
        if(rs.next())
        {
            return rs.getString("name");
        }
        }catch(SQLException e){System.out.println(e);}
        
        return null;
      
    }

}
