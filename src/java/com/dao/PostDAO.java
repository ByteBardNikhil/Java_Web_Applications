package com.dao;

import com.entities.Categories;
import com.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PostDAO {

    Connection con;

    public PostDAO(Connection con) {
        this.con = con;
    }

    public ArrayList<Categories> getAllCategories() {

        ArrayList<Categories> al = new ArrayList<>();

        try {

            String q = "select *from categories;";
            Statement smt = con.createStatement();
            ResultSet rs = smt.executeQuery(q);
            while (rs.next()) {

                Categories c = new Categories(rs.getInt("cid"), rs.getString("name"), rs.getString("description"));
                al.add(c);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;

    }

    public boolean savePost(Post p) {
        boolean f = false;
        String q = "insert into post(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?);";

        try {
            PreparedStatement psmt = con.prepareStatement(q);
            psmt.setString(1, p.getpTitle());
            psmt.setString(2, p.getpContent());
            psmt.setString(3, p.getpCode());
            psmt.setString(4, p.getpPic());
            psmt.setInt(5, p.getCatId());
            psmt.setInt(6, p.getUserId());

            psmt.executeUpdate();
            return f = true;

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }

    public List<Post> getAllPost() {
        List<Post> li = new ArrayList<>();

        try {
            ResultSet rs = (con.prepareStatement("select *from post order by pid desc")).executeQuery();
            while (rs.next()) {

                int pid = rs.getInt("pid"), catId = rs.getInt("catid"), userId = rs.getInt("userid");
                String pTitle = rs.getString("pTitle"), pContent = rs.getString("pContent"), pCode = rs.getString("pCode"), pPic = rs.getString("pPic");
                Timestamp pDate = rs.getTimestamp("pDate");
                Post p = new Post(pid, catId, userId, pTitle, pContent, pCode, pPic, pDate);
                li.add(p);

            }
            return li;

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return li;
    }

    public List<Post> getPostByCatId(int catId) {
        List<Post> li = new ArrayList<>();

        String q = "select *from post where catid=?";

        try {
            PreparedStatement psmt = con.prepareStatement(q);
            psmt.setInt(1, catId);
            ResultSet rs = psmt.executeQuery();

            while (rs.next()) {

                int pid = rs.getInt("pid"), userId = rs.getInt("userid");
                String pTitle = rs.getString("pTitle"), pContent = rs.getString("pContent"), pCode = rs.getString("pCode"), pPic = rs.getString("pPic");
                catId = rs.getInt("catid");
                Timestamp pDate = rs.getTimestamp("pDate");
                Post p = new Post(pid, catId, userId, pTitle, pContent, pCode, pPic, pDate);
                li.add(p);

            }
            return li;

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return li;

    }

    public Post getPostByPostId(int pid) {
        Post p = new Post();
        String q = "select *from post where pid=?";

        try {
            PreparedStatement psmt = con.prepareStatement(q);
            psmt.setInt(1, pid);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {

                int catId = rs.getInt("catid"), userId = rs.getInt("userid");
                String pTitle = rs.getString("pTitle"), pContent = rs.getString("pContent"), pCode = rs.getString("pCode"), pPic = rs.getString("pPic");
                Timestamp pDate = rs.getTimestamp("pDate");
                p = new Post(pid, catId, userId, pTitle, pContent, pCode, pPic, pDate);

                return p;
            }

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return p;
    }
}
