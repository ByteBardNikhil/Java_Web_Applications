/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entities;

import java.sql.Timestamp;

/**
 *
 * @author hp
 */
public class User {

    private String name;
    private String email;
    private String password;
    private Timestamp dateTime;
    private int id;
    private String profile;

   public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    

    public User(String name, String email, String password) {

        this.email = email;
        this.name = name;
        this.password = password;
    }
    public User(){
    }
    

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;

    }

    public String getEmail() {
        return email;

    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public int getId() {
        return id;
    }

    public String getPassword() {
        return password;
    }
    

    public void setId(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
