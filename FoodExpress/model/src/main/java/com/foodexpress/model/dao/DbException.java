/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.foodexpress.model.dao;

/**
 *
 * @author Samuel
 */
public class DbException extends Exception {
    private static final long serialVersionUID = 1L;
    public DbException(String message) {
        super(message);
    }
    
}
