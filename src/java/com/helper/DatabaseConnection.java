
package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
  
  private static Connection con=null;
  public static Connection getConnection()
  {
  if(con==null)
  {
   try{
         Class.forName("com.mysql.cj.jdbc.Driver");
      String url="jdbc:mysql://localhost:3306/ourtechblog";
      con=DriverManager.getConnection(url, "root","1234");
    return con;  
   }catch(ClassNotFoundException cnfe){System.out.println(cnfe);}
   catch(SQLException sqle){System.out.println(sqle);}
      
  }
  return con;
  }

}
