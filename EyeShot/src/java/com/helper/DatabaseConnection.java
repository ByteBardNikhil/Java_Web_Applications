/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author hp
 */
public class DatabaseConnection {
    private static Connection con =null;
    public static Connection getConnection(){
        if (con==null){
            try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           String url="jdbc:mysql://localhost:3306/eyeshot";
           Connection con=DriverManager.getConnection(url,"root", "vansh@07");
           
           return con;
            }
        
    
          catch(ClassNotFoundException  cnfe){
            System.out.println(cnfe);
        }
        catch(SQLException smt){
            System.out.print(smt);
        }
        }
        return con;
    }
}
    
           
      
