/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.familyfinance;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.enterprise.context.RequestScoped;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author k.makienko
 */
@Named(value = "logoutBean")
@RequestScoped
public class LogoutBean {
    
    
    private static Logger log = Logger.getLogger(LogoutBean.class.getName());
    
    public String logout(){
    
        String dest = "/pages/common/welcome.xhtml";
        
        FacesContext fc = FacesContext.getCurrentInstance();
        HttpServletRequest req = (HttpServletRequest) fc.getExternalContext().getRequest();
        
        try {
            req.logout();
        } catch (Exception e) {
            log.log(Level.SEVERE, "Error: "+ e.getMessage(), e);
            
        }
        
        return dest;
    }
}
