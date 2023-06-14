/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entities;

import java.sql.Blob;

public class Photo {

    String email;
    Blob bb;

    public Photo(Blob bb) {
        this.bb = bb;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Blob getBlobData() {
        return bb;
    }

    public void setBlobData(Blob blobData) {
        this.bb = blobData;
    }

}
