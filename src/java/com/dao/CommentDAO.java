
package com.dao;

import com.entities.Comment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class CommentDAO {
Connection con=null;
    public CommentDAO(Connection con) {
        this.con=con;
    }
    
     public boolean insertComment(int pid, int uid,String comment) {
        try {
            String q = "insert into comment(pid,uid,comments) values(?,?,?);";
            PreparedStatement psmt = con.prepareStatement(q);
            psmt.setInt(1, pid);
            psmt.setInt(2, uid);
            psmt.setString(3, comment);
            psmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public int countCommentOnPost(int pid) {
        int count = 0;
        String q = "select count(*) from comment where pid=?";
        PreparedStatement psmt;
        try {
            psmt = con.prepareStatement(q);
            psmt.setInt(1, pid);
         ResultSet rs=   psmt.executeQuery();
          while(rs.next())count=rs.getInt("count(*)");
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(LikeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
return count;
    }
    
    public boolean isCommentedByUser(int pid,int uid)
    {
        try {
            String q="select *from comment where pid=? and uid=?";
        PreparedStatement psmt=con.prepareStatement(q);
        psmt.setInt(1, pid);
        psmt.setInt(2, uid);
        ResultSet rs=psmt.executeQuery();
        if(rs.next()){return true;}
        
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return false;
    }
    
    public boolean deletecomment(int pid,int uid){
        
        try{
            String q="delete from comment where pid=? and uid=?";
            PreparedStatement psmt=con.prepareStatement(q);
            psmt.setInt(1, pid);
            psmt.setInt(2, uid);
            psmt.executeUpdate();
            return true;
            
        }catch(SQLException e){System.out.println(e);}
        
    return false;
    }
    
    
    public int getCommentCountOfUser(int pid,int uid)
    {
         try{
            String q="select count(*) from comment where pid=? and uid=?;";
            PreparedStatement psmt=con.prepareStatement(q);
            psmt.setInt(1, pid);
            psmt.setInt(2, uid);
            ResultSet rs=psmt.executeQuery();
            if(rs.next())
               return rs.getInt("count(*)");
          
            
        }catch(SQLException e){System.out.println(e);}


   return 0;
        
    }
 
    public ArrayList<Comment> getAllComments()
    {
        ArrayList<Comment> li=new ArrayList<>();
    
        try{
        
            String q="select *from comment order by cid desc;";
            PreparedStatement psmt=con.prepareStatement(q);
            ResultSet rs=psmt.executeQuery();
            while(rs.next())
            {
                Comment c=new Comment(rs.getInt("pid"), rs.getInt("uid"), rs.getString("comments"));
            li.add(c);
            }
            return li;
        
        }catch(Exception e){System.out.println(e);}
        
        return li;
        
    }
  
    
}
