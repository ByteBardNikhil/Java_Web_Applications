/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author USER
 */
public class Helper {

    public static boolean deleteFile(String path) {
        boolean f = false;
        try {
            return new File(path).delete();

        } catch (Exception e) {
            System.out.println(e);
        }
        return f;
    }

    public static boolean saveFile(InputStream is, String path) {
        boolean f = false;
        try {
            byte b[] = new byte[is.available()];
            is.read(b);
         File file=new File(path);
        
            FileOutputStream fos = new FileOutputStream(file);
            fos.write(b);
            fos.flush();
            fos.close();
            return true;

        } catch (Exception e) {
            System.out.println(e);
        }
        return f;

    }
}
