<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import="org.apache.poi.hssf.usermodel.*"%>
<%@ page import="org.apache.poi.hssf.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title>Rating</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 4800px;
    color:grey;
    text-align:center}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: black;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
   footer {
      background-color:PAPAYAWHIP;
      
    }
   
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
       }
     hr { 
    display: block;
    margin-top: 0.5em;
    margin-bottom: 0.5em;
    margin-left: auto;
    margin-right: auto;
    border-style: inset;
    border-width: 1px;
}
  </style>

</head>
<body >
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
    <br>
      <h4 align=center>Dance Society, DTU</h4>
      <br><br>
      <ul class="nav nav-pills nav-stacked">
        <li align=center ><a href="home1.html">Home</a></li>
        <li align=center><a href="Post1.jsp">Post</a></li>
        <li align=center><a href="comment1.jsp">Comment</a></li>
        <li align=center class="active"><a href="rating1.jsp">Ratings</a></li>
      </ul><br>
      
    </div>

  <div>
  <div >
  <br>
      <h2 align=center>Rating of Facebook Page - "Dance Society,DTU"</h2>
	<hr>
      <h4><small>All Ratings</small></h4>
      <hr>
      <% 
      short a=0;
      short b=1;
      short c=3;
      short d=4;
      String   rid="", date="",name=" "; 
   	double rating;
   	int sum=0,count=0;
   			double avg=0;
      String filename ="workbook.xlsx";
      FileInputStream fs =new FileInputStream("Rating.xls");
      HSSFWorkbook wb = new HSSFWorkbook(fs);
      HSSFSheet sheet = wb.getSheetAt(0);
      int rows  = sheet.getPhysicalNumberOfRows();
      for (int r = 1; r < rows; r++){
    	    HSSFRow row   = sheet.getRow(r);
    	    int     cells = row.getPhysicalNumberOfCells(); 
    	   
    	    HSSFCell cell1  = row.getCell(a);
    		name = cell1.getStringCellValue();
    	      HSSFCell cell2  = row.getCell(b);
    	        date= cell2.getStringCellValue();
    	         HSSFCell cell3  = row.getCell(c);
    	         rating = cell3.getNumericCellValue();
    	          HSSFCell cell4  = row.getCell(d);
    	         rid = cell4.getStringCellValue();
    	         
    	         sum+=rating;
    	  
      out.println("<h3>Rated By : " +name+"</h3>");     
      out.print("<h5>"+date+"</h5>");
      out.print("<h5> Rating Id : "+rid+"</h5>");
      out.println("Rating Given : "+rating);
      out.println("<hr>");
    count++;
      
      }
      avg=sum/count;
      %>
      
      <h3>Average Rating : <%= avg %> </h3>
	</div>
	</div>

	
	<footer class="container-fluid text-center">
  <p><br>DANCE SOCIETY,DTU</p>
</footer>

</body>
</html>