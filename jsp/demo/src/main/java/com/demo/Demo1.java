package com.demo;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.http.HttpServlet;


@WebServlet("/welcome1")
public class Demo1 extends HttpServlet{
    public void doGet(HttpServletRequest req,HttpServletResponse res)  throws ServletException,IOException  
    {  
            String i = (String)req.getAttribute("id");
            String y = (String)req.getAttribute("year");
            String m = (String)req.getAttribute("month");
            String i1 = (String)req.getParameter("id");
            String y1 = req.getParameter("year");
            String m1 = req.getParameter("month");
            String id = (i==null)?i1:i;
            String year = (y==null)?y1:y;
            String month = (m==null)?m1:m;
            System.out.print(month);
            ArrayList<String> a = new ArrayList<>();
            try{  
                Class.forName("com.mysql.cj.jdbc.Driver");  
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","root");  
                Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select * from staff where staff_id='"+id+"'");  
                while(rs.next()){
                    a.add(rs.getString(4));
                    a.add(rs.getString(5));
                    a.add(rs.getString(3));
                }    
            }
            catch(Exception e){
                 System.out.println(e);
            }  
            ArrayList<Integer> b = new ArrayList<>();
            try{  
                Class.forName("com.mysql.cj.jdbc.Driver");  
                Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","root");  
                Statement stmt1=con1.createStatement();  
                ResultSet rs1=stmt1.executeQuery("select * from staff_info where staff_id='"+id+"'");  
                while(rs1.next()){
                    b.add(rs1.getInt(2));
                    b.add(rs1.getInt(3));
                }
            }
            catch(Exception e){
                System.out.println(e);
            } 
            LocalDate date = LocalDate.now();
            int oyear = date.getYear();
            int omonth = date.getMonthValue();
            ArrayList<Integer> d = new ArrayList<>();
            int yr=Integer.parseInt(year);
            int mon = Integer.parseInt(month);
            if(yr==b.get(0) && yr==oyear){
                year=""+yr;
                if(mon>=b.get(1) && mon<=omonth){
                    d.add(yr);
                    d.add(mon);
                }
                else{
                    d.add(yr);
                    d.add(b.get(1));
                }
            }
            else if(yr<=b.get(0)){
                year=""+b.get(0);
                d.add(b.get(0));
                if(mon > b.get(1)){
                    d.add(mon);
                }
                else{
                    d.add(b.get(1));
                }
            }
            else if(yr>=oyear){
                year=""+oyear;
                d.add(oyear); 
                if(mon<omonth){
                    d.add(mon);
                }    
                else{
                    d.add(omonth);
                }
            }
            else{
                year = ""+yr;
                d.add(yr);
                d.add(mon); 
            }
            ArrayList<Integer> c = new ArrayList<>();
            try{  
                Class.forName("com.mysql.cj.jdbc.Driver");  
                Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","root");  
                Statement stmt1=con1.createStatement();  
                ResultSet rs1=stmt1.executeQuery("select * from staff_"+id+"_leave_year where year='"+year+"'");  
                while(rs1.next()){
                    c.add(rs1.getInt(1));
                    c.add(rs1.getInt(2));
                    c.add(rs1.getInt(3));
                    c.add(rs1.getInt(4));
                }
            }
            catch(Exception e){
                System.out.println(e);
            } 
            ArrayList<Integer> e = new ArrayList<>();
            try{  
                Class.forName("com.mysql.cj.jdbc.Driver");  
                Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/attendance","root","root");  
                Statement stmt1=con1.createStatement();  
                ResultSet rs1=stmt1.executeQuery("select day from staff_"+id+"_leave where year="+d.get(0)+" && month="+d.get(1));  
                while(rs1.next()){
                    e.add(rs1.getInt(1));
                }
            }
            catch(Exception e1){
                System.out.println(e1);
            } 
            System.out.print(a+" "+b+" "+c+" "+d+""+e);
            req.setAttribute("TeacherData",a);
            req.setAttribute("LeaveData", b);
            req.setAttribute("LeaveYear", c);
            req.setAttribute("YearMonth", d);
            req.setAttribute("LeaveDate", e);
            req.getRequestDispatcher("teacher.jsp").forward(req, res);  
    } 
}
