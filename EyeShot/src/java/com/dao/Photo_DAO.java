/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entities.Photo;
import com.helper.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Photo_DAO {
    

    public boolean checkPhoto(String email) {
        try {
            Connection con = DatabaseConnection.getConnection();

            String query = "select *from photo where email=?";
            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setString(1, email);
            ResultSet set = psmt.executeQuery();

            if (set.next()) {
                
                return true;

            }

        } catch (SQLException s) {
            System.out.println(s);
        }

        return false;
    }

}
