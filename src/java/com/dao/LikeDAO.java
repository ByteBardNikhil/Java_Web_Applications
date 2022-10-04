package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LikeDAO {

    Connection con = null;

    public LikeDAO(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {
        try {
            String q = "insert into liketable(pid,uid) values(?,?)";
            PreparedStatement psmt = con.prepareStatement(q);
            psmt.setInt(1, pid);
            psmt.setInt(2, uid);
            psmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public int countLikeOnPost(int pid) {
        int count = 0;
        String q = "select count(*) from liketable where pid=?";
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
    
    public boolean isLikedByUser(int pid,int uid)
    {
        try {
            String q="select *from LikeTable where pid=? and uid=?";
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
    
    public boolean deleteLike(int pid,int uid){
        
        try{
            String q="delete from LikeTable where pid=? and uid=?";
            PreparedStatement psmt=con.prepareStatement(q);
            psmt.setInt(1, pid);
            psmt.setInt(2, uid);
            psmt.executeUpdate();
            return true;
            
        }catch(SQLException e){System.out.println(e);}
        
    return false;
    }
    
    public int getLikeCountOfUser(int pid,int uid)
    {
         try{
            String q="select count(*) from liketable where pid=? and uid=?;";
            PreparedStatement psmt=con.prepareStatement(q);
            psmt.setInt(1, pid);
            psmt.setInt(2, uid);
            ResultSet rs=psmt.executeQuery();
            if(rs.next())
                return rs.getInt("count(*)");
          
            
        }catch(SQLException e){System.out.println(e);}
        
    return 0;
        
    }

}
