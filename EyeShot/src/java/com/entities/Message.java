/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entities;


public class Message {
    private String content;
    private String type;
    private String cssClass;
    
    public Message (String content,String type,String cssClass){
        this.content=content;
        this.cssClass=cssClass;
        this.type=type;
    }
    public void setContent(String content){
        this.content=content;
       
    }
    public String getContent(){
        return content;
    }
     public void setType(String type){
        this.type=type;
       
    }
    public String getType(){
        return type;
    }
     public void setCssClass(String cssClass){
        this.cssClass=cssClass;
       
    }
    public String getCssClass(){
        return cssClass;
    }
}
