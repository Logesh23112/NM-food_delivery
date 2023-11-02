<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>YOUR CART</title>
              <style>
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
                background-color:#C6FFEE;
            }
        </style>
    </head>
    <body>
        <%
            String name=request.getParameter("name1");
            try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
            Statement st = conn.createStatement();
            String products[] = request.getParameterValues("product");
            for(int i=0;i<products.length;i++){
         %>
         <h1><%=products[i]%></h1>
         <%
            String qry = "UPDATE FOOD SET QTY = QTY - 1 WHERE NAME='"+products[i]+"'";
            System.out.println(qry);
            int k=st.executeUpdate(qry);
            
            int l=st.executeUpdate("select max(orderid) from details");
            int m=l+1;
            String qry2="insert into details(orderid,name,orderdate) values('"+m+"','"+products[i]+"',sysdate())";
            System.out.println(qry2);
            int a=st.executeUpdate(qry2);
         
         }
%>
conn.close();
}
catch(Exception e)
{
    System.out.print(e);
}
<h3>Thank you for ordering,<%=name%></h3>
    </body>
    
</html>
