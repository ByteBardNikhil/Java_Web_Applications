
package com.entities;


public class Comment {
    int pid,uid;
    String comment=null;

    public Comment(int pid, int uid,String comment) {
        this.pid = pid;
        this.uid = uid;
        this.comment=comment;
    }

    public Comment() {
    }
    

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
    
    
    
}
