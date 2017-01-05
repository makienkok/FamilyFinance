/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.familyfinance.utils;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author kirill
 */
public class Utils {
    
    public static void main(String ... args )throws Exception
    {
    
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            //String text = "admin";
            String text = "keks";
            md.update(text.getBytes("UTF-8")); // Change this to "UTF-16" if needed
            byte[] digest = md.digest();
            BigInteger bigInt = new BigInteger(1, digest);
            String output = bigInt.toString(16);

            System.out.println("pass "+output);

        } catch (NoSuchAlgorithmException | UnsupportedEncodingException ex) {
            System.out.println("Error" + ex.getMessage());
            //Logger.getLogger(PasswordTest.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
    
}
