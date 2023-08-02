<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList" %>
<% ArrayList<String> a = (ArrayList<String>)request.getAttribute("TeacherData"); %>
<% ArrayList<Integer> b = (ArrayList<Integer>)request.getAttribute("LeaveData"); %>
<% ArrayList<Integer> c = (ArrayList<Integer>)request.getAttribute("LeaveYear"); %>
<% ArrayList<Integer> d = (ArrayList<Integer>)request.getAttribute("YearMonth"); %>
<% ArrayList<Integer> e = (ArrayList<Integer>)request.getAttribute("LeaveDate"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="style2.css">
  
    <title>Teacher Profile</title>
    <style>
        body{
            background-image: url('Teacher.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;

        }
        #box1{
            background-color:lightblue;   
            position:absolute;
            top: 50%;
            left: 20%;
            transform: translate(-50%,-50%);
            display: block;
            width: 300px;
            height: 550px;
            padding: 30px;
            border-radius: 20px;
        }
        #box2{
            background-color:lightblue;   
            position:absolute;
            top: 50%;
            left: 900px;
            transform: translate(-50%,-50%);
            display: block;
            width: 650px;
            height: 550px;
            padding: 30px;
            border-radius: 20px;
        }
        #leavebox{
            display: flex;
        }
        .leaveboxelements{
            background-color: black;
            margin-left: 10px;
            padding: 10px;
            border-radius: 20px;
            border: 1px solid white;
        }
    </style>
</head>
<body>
    <div>
        <div id="box1">
            <img src="profile.jpg" style="margin-left: 100px;margin-top: 30px;border-radius: 30px;" width="100px" height="100px">  
            <h3 style="text-align: center;padding-top: 20px;font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;"><% out.print(a.get(0)); %></h3> 
            <h3 style="text-align: center;font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;"><% out.print(a.get(1)); %></h3>
            <h3 style="text-align: center;font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;"><% out.print(a.get(2)); %></h3>
            <h3 style="padding-left: 20px;padding-top: 20px;font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;font-size: small;">ATTENDANCE PERCENTAGE:</h3>
            <div class="container">
                <div class="circular-progress">
                  <div class="value-container">0%</div>
                </div>
            </div>
            <script src="scrip.js"></script>
        </div>
        <div id="box2" >
            <div>
                <div class="container1">
                    <div class="container2">
                        <div>
                            <br><br>
                            <div id="buttoncontainer1">
                                <button style="padding: 5px;width:30px;margin-left:20px;border-radius:20px;" id="yearl" onclick="yearl()"><</button>
                                <label for="calender" id="box1container">
                                    2023
                                </label>
                                <button style="padding: 5px;width:30px;margin-right:20px;border-radius:20px" id="yearr" onclick="yearr()">></button>
                            </div>
                            <div id="buttoncontainer1">
                                <button style="padding: 5px;width:30px;margin-left:20px;border-radius:20px" id="monthl" onclick="monthl()"><</button>
                                <label for="calender" id="box1containerele">
                                    January
                                </label>
                                <button style="padding: 5px;width:30px;margin-right:20px;border-radius:20px" id="monthr" onclick="monthr()">></button>
                            </div>
                            <table id="tablecontainer">
                                <tr>
                                    <th>Sun</th>
                                    <th>Mon</th>
                                    <th>Tue</th>
                                    <th>Wed</th>
                                    <th>Thu</th>
                                    <th>Fri</th>
                                    <th>Sat</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div id="leavebox">
                    <h4 style="margin-left: 20px;">Vacation leave</h4>
                    <h1 class="leaveboxelements" id="v1"></h1>
                    <h1 class="leaveboxelements" id="v2"></h1>
                    <h1 class="leaveboxelements" id="v3"></h1>
                    <h1 class="leaveboxelements" id="v4"></h1>
                    <h1 class="leaveboxelements" id="v5"></h1>
                    <h1 class="leaveboxelements" id="v6"></h1>
                    <h1 class="leaveboxelements" id="v7"></h1>
                    <h1 class="leaveboxelements" id="v8"></h1>
                    <h1 class="leaveboxelements" id="v9"></h1>
                    <h1 class="leaveboxelements" id="v10"></h1>
                    <h1 class="leaveboxelements" id="v11"></h1>
                    <h1 class="leaveboxelements" id="v12"></h1>
                    <h1 class="leaveboxelements" id="v13"></h1> 
                    <h1 class="leaveboxelements" id="v14"></h1> 
                </div>
                <div id="leavebox">
                    <h4 style="margin-left: 20px;">Monthly leave</h4>
                    <h1 class="leaveboxelements" id="m1"></h1>
                    <h1 class="leaveboxelements" id="m2"></h1>
                    <h1 class="leaveboxelements" id="m3"></h1>
                    <h1 class="leaveboxelements" id="m4"></h1>
                    <h1 class="leaveboxelements" id="m5"></h1>
                    <h1 class="leaveboxelements" id="m6"></h1>
                    <h1 class="leaveboxelements" id="m7"></h1>
                    <h1 class="leaveboxelements" id="m8"></h1>
                    <h1 class="leaveboxelements" id="m9"></h1>
                    <h1 class="leaveboxelements" id="m10"></h1>
                    <h1 class="leaveboxelements" id="m11"></h1>
                    <h1 class="leaveboxelements" id="m12"></h1>
                </div>
                <div id="leavebox">
                    <h4 style="margin-left: 20px;">Emergency leave</h4>
                    <h1 class="leaveboxelements" id="e1"></h1>
                    <h1 class="leaveboxelements" id="e2"></h1>
                </div>
            </div>
            <div>
                <button onclick="approval()" style="margin-left: 500px;font-size: 20px;background-color: rgb(234, 235, 128);color: black;border-radius: 10px;">Request for Leave</button>
            </div>
            <script>
                function approval(){
                    document.location.href='http://localhost:8080/demo/request.jsp';
                }
            </script>
            <script>
                var vacation = "<%=c.get(1)%>";
                var Monthly = "<%=c.get(2)%>";
                var Emergency = "<%=c.get(3)%>";
                const v = ['v14','v13','v12','v11','v10','v9','v8','v7','v6','v5','v4','v3','v2','v1'];
                const m = ['m12','m11','m10','m9','m8','m7','m6','m5','m4','m3','m2','m1'];
                const e = ['e2','e1'];
                for(var i=0;i<vacation;i++){
                    document.getElementById(v[i]).style.backgroundColor="white";
                }
                for(var i=0;i<Monthly;i++){
                    document.getElementById(m[i]).style.backgroundColor="white";
                }
                for(var i=0;i<Emergency;i++){
                    document.getElementById(e[i]).style.backgroundColor="white";
                }
            </script>
        </div>
    </div>
    <script>
            var id ="<%=(a.get(2))%>";
            var list = JSON.parse('<%=e%>');
            console.log(list[0]);
            var yr = "<%=d.get(0)%>";
            var a = "<%=d.get(1)%>";
            var a1 = parseInt(yr);
            var a2 = parseInt(a);
            var a3 = 30;
            console.log(a1);
            console.log(a2);
            var row = 1;
            function yearl(){
                console.log(a1);
                a1--;
                document.location.href='http://localhost:8080/demo/welcome1?id='+id+'&year='+a1+'&month='+a2;
            }
            function yearr(){
                a1++;
                document.location.href='http://localhost:8080/demo/welcome1?id='+id+'&year='+a1+'&month='+a2;
            }
            function monthr(){
                if(a2==12){
                    a2=1;
                    a1++;
                    document.location.href='http://localhost:8080/demo/welcome1?id='+id+'&year='+a1+'&month='+a2;
                }
                else{
                    a2++;
                    document.location.href='http://localhost:8080/demo/welcome1?id='+id+'&year='+a1+'&month='+a2;
                }
            }
            function monthl(){
                if(a2==1){
                    a2=12;
                    a1--;
                    document.location.href='http://localhost:8080/demo/welcome1?id='+id+'&year='+a1+'&month='+a2;
                }
                else{
                    a2--;
                    document.location.href='http://localhost:8080/demo/welcome1?id='+id+'&year='+a1+'&month='+a2;
                }
            }
            show(a1,a2,a3);
            function show(a1,a2,a3){
            console.log(a2);
            var x = month(a2);
            console.log(x);
            document.getElementById("box1container").innerHTML=a1;
            document.getElementById("box1containerele").innerHTML=x;
            var year;
            var day = 6;
            for(year=2000;year<a1;year++){
                if(year%4==0 && year%100!=0){
                    day+=366;
                }
                else if(year%100==0 && year%400==0){
                    day+=366;
                }
                else{
                    day+=365;
                }
            }
            var i=1;
            for(i=1;i<a2;i++){
                switch(i){
                    case 1:
                    case 3:
                    case 5:
                    case 7:
                    case 8:
                    case 10:
                    case 12:
                        day+=31;
                        break;
                    case 4:
                    case 6:
                    case 9:
                    case 11:
                        day+=30;
                        break;
                    case 2:
                        if(a1%4==0 && a1%100!=0){
                            day+=29;
                        }
                        else if(a1%100==0 && a1%400==0){
                            day+=29;
                        }
                        else{
                            day+=28;
                        }
                        break;
                    default:
                        break;
                }
            }
            row=1;
            var column = 0;
            var table = document.getElementById("tablecontainer");
            var tablerow = table.insertRow(row);
            for(var k=0;k<day%7;k++){
                var cell = tablerow.insertCell(k);
                cell.innerHTML = "-"; 
            }
            var m = monthdays(a2);
            for(var k=1;k<=m;k++)
            {
               if(day%7==0){
                row+=1;
                var tablerow = table.insertRow(row);
               }
               var cell = tablerow.insertCell(day%7);
               cell.innerHTML=""+k;
               for(var n=0;n<list.length;n++){
                    if(k==list[n]){
                        cell.style.color="red";
                        cell.style.backgroundcolor="white";
                    }
               }
               day++;
            }
            }
            function month(x){
                switch(x){
                    case 1:
                        return "Janurary";
                        break;
                    case 2:
                        return "Feburary";
                        break;
                    case 3:
                        return "March";
                        break;
                    case 4:
                        return "April";
                        break;
                    case 5:
                        return "May";
                        break;
                    case 6:
                        return "June";
                        break;
                    case 7:
                        return "July";
                        break;
                    case 8:
                        return "August";
                        break;
                    case 9:
                        return "September";
                        break;
                    case 10:
                        return "October";
                        break;
                    case 11:
                        return "November";
                        break;
                    case 12:
                        return "December";
                        break;
                }
                
            }
            function monthdays(x){
                switch(x){
                    case 1:
                    case 3:
                    case 5:
                    case 7:
                    case 8:
                    case 10:
                    case 12:
                        return 31;
                        break;
                    case 4:
                    case 6:
                    case 9:
                    case 11:
                        return 30;
                        break;
                    case 2:
                        if(a1%4==0 && a1%100!=0){
                            return 29;
                        }
                        else if(a1%100==0 && a1%400==0){
                            return 29;
                        }
                        else{
                            return 28;
                        }
                        break;
                    default:
                        break;
                }
            }
    </script>
</body>
</html>