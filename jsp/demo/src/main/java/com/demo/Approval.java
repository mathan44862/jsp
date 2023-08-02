package com.demo;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.http.HttpServlet;

@WebServlet("/approval")
public class Approval  extends HttpServlet{
    public void doGet(HttpServletRequest req,HttpServletResponse res)  throws ServletException,IOException  
    {
        ArrayList<String> a1 = new ArrayList<>();
        try{  
            Class.forName("com.mysql.cj.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","root"); 
            Statement stmt=con.createStatement();      
            ResultSet rs=stmt.executeQuery("select * from leave_request");  
            while(rs.next()){
                a1.add(rs.getString(1));
                a1.add(rs.getString(2));
                a1.add(rs.getString(3));
                a1.add(rs.getString(4));
                a1.add(rs.getString(5));
            }
            System.out.println(a1);
            req.setAttribute("hi",a1);
            req.getRequestDispatcher("approval.jsp").forward(req, res); 
        }
        catch(Exception e){
             System.out.println(e);
        }  
    } 
}
