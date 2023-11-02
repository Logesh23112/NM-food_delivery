<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet"  href=".\style.css"></link>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YOUR CART</title>
        <style>

            
            
            div{
                margin-top: 1%;
            }
               
          
            .blink{
                animation:blink 1s linear infinite;
                color:blue;
                
            }
            @keyframes blink
            {
                50%{
                    opacity:0;
                }
            }

   
            
        </style>
    </head>
 
    <body bgcolor="gray">
    <center>
        <table border="1" bgcolor="black">
            <tr><th><cetner><h1 style="color:white"><center>ORDERED FOOD ITEMS</center></h1></th></tr>
            <tr><th><center><h1 style="color:white">FOOD NAME</h1></center></th><th><center><h1 style="color:white">PRICE</h1></center></th></tr>
       <%
          String name=request.getParameter("n");
           int i;
           int vari=0,vari2=0;
           int count=0,count2=0,count3=0;
           try{
               String products[] = request.getParameterValues("product");
               int n=products.length;
               Class.forName("com.mysql.cj.jdbc.Driver");
              Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
              Statement st = conn.createStatement();
              for(i=0;i<products.length;i++){

       %>
        
         <%
            String qrymy="SELECT NAME,PRICE FROM FOOD WHERE id='"+products[i]+"'";
            
            ResultSet rs1=st.executeQuery(qrymy);
            
        %>         
        
        <%!static int j=0;%>
             <%while(rs1.next()){%>
              
                  <div>
                      <center>
                          <tr><td>
                          <center> <h1 style=color:red><%=rs1.getString(1)%></h1></center></td><td><center><h1 style="color:red">RS.<%=rs1.getString(2)%></h1></center></td></tr>
                          <%vari=Integer.valueOf(rs1.getString(2));%>
                          <%count2=count2+vari;%>
                         
                          <tr><td><h1 style=color:red></h1></td></tr>
           
                          </center></div>
                    
               
                                  
            <% 
            j++;
                }
                

          }
        
}
            catch(Exception e)
            {
            System.out.println(e);
            }
%>

 <%

           int j;
           try{
               String products1[] = request.getParameterValues("product1");
               int m=products1.length;
               Class.forName("com.mysql.cj.jdbc.Driver");
              Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
              Statement st1 = conn.createStatement();
              for(j=0;j<products1.length;j++){

       %>
           
         <%
             
            String qrymy1="SELECT NAME,PRICE FROM FOOD1 WHERE id='"+products1[j]+"'";
            ResultSet rs2=st1.executeQuery(qrymy1);
        %>         
        <%!static int k=0;%>
             <%while(rs2.next()){%>
              
                  <div>
                       <tr><td>
                          <center> <h1 style=color:red><%=rs2.getString(1)%></h1></center></td><td><center><h1 style="color:red">RS.<%=rs2.getString(2)%></h1></center></td></tr>

                          </div>
                          <%vari2=Integer.valueOf(rs2.getString(2));%>
                          <%count=count+vari2;%>
                         
                          <%count3=count+count2;%>
                          
                                  <center>
            <% 
            k++;
                }          
          }
        
}
            catch(Exception e)
            {
            System.out.println(e);
}

  %>
              
  <tr><td><center><h1 style="color:red">Total</h1></center></td><td><center><h1 style="color:red"><%=count3%></h1></center></td></tr>
</center></table>
<center><h1 width="100%" class="blink" style="color:whitesmoke">Thank you for ordering, <%=name%></h1></center>
    </center>
    </center>
</body>
</html>
