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

@WebServlet("/approvalrequest")

public class ApprovalRequest extends HttpServlet{
    public void doGet(HttpServletRequest req,HttpServletResponse res)  throws ServletException,IOException  
    {
        try{  
            Class.forName("com.mysql.cj.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","root"); 
            Statement stmt=con.createStatement();      
            ResultSet rs=stmt.executeQuery("select * from leave_request");  
            while(rs.next()){
                ArrayList<String> a1 = new ArrayList<>();
                a1.add(rs.getString(1));
                a1.add(rs.getString(2));
                a1.add(rs.getString(3));
                a1.add(rs.getString(4));
                a1.add(rs.getString(5));
                ArrayList<Integer> a = new ArrayList<>();
                    try{  
                        Class.forName("com.mysql.cj.jdbc.Driver");  
                        Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","root");       
                        String query1 = "insert into staff_"+a1.get(0)+"_leave values("+a1.get(1)+","+a1.get(2)+","+a1.get(3)+")";
                        PreparedStatement preparedStmt1 = con1.prepareStatement(query1);
                        preparedStmt1.execute();
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");  
                            Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","root");  
                            Statement stmt1=con2.createStatement();  
                            ResultSet rs1=stmt1.executeQuery("select "+a1.get(4)+" from staff_"+a1.get(0)+"_leave_year where year="+a1.get(3));  
                            while(rs1.next()){
                                System.out.print(rs1.getInt(1));
                                a.add(rs1.getInt(1));
                            }
                        }
                        catch(Exception e){
                            System.out.println(e);
                        }
                        int s = a.get(0);
                        s++;
                        String query2 = "update staff_"+a1.get(0)+"_leave_year set "+a1.get(4)+" = "+s;
                        PreparedStatement preparedStmt2 = con.prepareStatement(query2);
                        preparedStmt2.execute();
                    }
                    catch(Exception e2){
                        System.out.println(e2);
                    } 
                }     
                String query1 = "delete from leave_request";
                PreparedStatement preparedStmt1 = con.prepareStatement(query1);
                preparedStmt1.execute();
        }
        catch(Exception e1){
             System.out.println(e1);
        }  
    } 
}
