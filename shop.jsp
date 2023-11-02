
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SHOP VIEW</title>
        <style>
            body{
                background-color: black;
            }
            table{
                border-collapse:collapse;
                width:100%
            }    
            th,td{
                text-align:left;
                padding:8px; 
            }
            tr:nth-child(even){
                background-color:#D6EEEE;
            }
             tr:nth-child(odd){
                background-color:#F3DDEE;
            }
            img{
                border-radius:80%;
                width:100%;
                height:20%;     
            }
        </style>
    </head>
    <body><center>
        <form method="post" action="newjsp.jsp">
        <%
            String name="";
          try{
              name = request.getParameter("names");
              Class.forName("com.mysql.cj.jdbc.Driver");
              Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
              Statement st = conn.createStatement();
              String query = "SELECT * FROM FOOD";
              ResultSet res = st.executeQuery(query);
             
        %>
            <input type="hidden" name="name" value="<%=name%>">
              
                      <center>
                          <marquee width="100%" height="10%" scrollamount="20" direction="right" ><h1 style=color:#00ffff;><center>VEG</center><h1></marquee> 
                          </center>
                                  <center>
            <table border="0">
                
                    <th style="color:red"><h2><center>S.NO</h2></center></th>
                    <th style="color:red"><h2><center>FOOD NAME</ceenter></h2></th>
                    <th style="color:red"><h2><center>IMAGE</center></h2></th>
                    <th style="color:red"><h2><center>PRICE</center></h2></th>
                    <th style="color:red"><h2><center>CHECK</center></h2></th>
                </tr>
                <%!static int i=0;%>
                <%while(res.next()){%>
                <tr>
                    <td><h2><center><%=res.getString(1)%></center></h2></td>
                    <td><h2><center><%=res.getString(2)%></center></td>
                    <td width="20%" height="20%"><center><img height="70" weight="70" src="./<%=res.getString(2)%>.jpg"></center></td>
                    <td><h2><center><%=res.getString(3)%></center></h2></td>
                   
                    <td><center><input id="t1" type="checkbox" name="product" value="<%=res.getString(1)%>"></center></td>
                </tr>
                <%
                    i++;}
                    }
                                
                     catch(Exception e){
                       System.out.println("Exception is : "+e);
                    }
                %>
            </table>
            
              <%
            String name1="";
          try{
              name1 = request.getParameter("names");
              Class.forName("com.mysql.cj.jdbc.Driver");
              Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
              Statement st1 = conn.createStatement();
              String query1 = "SELECT * FROM FOOD1";
              ResultSet res1 = st1.executeQuery(query1);
             
        %>
            <input type="hidden" name="name" value="<%=name%>">
              
                      <center>
                          <marquee width="100%" height="10%" scrollamount="20" direction="right" ><h1 style=color:#00ffff;><center>NON VEG</center><h1></marquee> 
                          </center>
                                  <center>
            <table border="0">     
                     
                    <th style="color:red"><h2><center>S.NO</h2></center></th>
                    <th style="color:red"><h2><center>FOO NAME</ceenter></h2></th>
                    <th style="color:red"><h2><center>IMAGE</center></h2></th>
                    <th style="color:red"><h2><center>PRICE</center></h2></th>
                    <th style="color:red"><h2><center>CHECK</center></h2></th>
                </tr>
                <%!static int j=0;%>
                <%while(res1.next()){%>
                <tr>
                    <td><h2><center><%=res1.getString(1)%></center></h2></td>
                    <td><h2><center><%=res1.getString(2)%></center></td>
                    <td width="20%" height="20%"><center><img height="70" weight="70" src="./<%=res1.getString(2)%>.jpg"></center></td>
                    <td><h2><center><%=res1.getString(3)%></center></h2></td>
                   
                    <td><center><input id="t1" type="checkbox" name="product1" value="<%=res1.getString(1)%>"></center></td>
                </tr>
                    
        
                <%
                    j++;}
                 
                    }
                                
                     catch(Exception e){
                       System.out.println("Exception is : "+e);
                    }
                %>
            </table>
            <br>
            <h1 style=color:red>Please Enter data to confirm purchase....</h1>
            <h1 style=color:red>Name:<input type="text" name="n"></h1>
            <h1 style=color:red>Mobile:<input type="text" name="m"></h1><br>
            <button type="submit" value="submit">ORDER NOW</button>
        
</form>
    </center>
    </body>
</html>
