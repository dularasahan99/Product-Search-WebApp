<%@page import="aiwa.util.StringUtil"%>
<%@page import="aiwa.entity.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/css/bootstrap.min.css" rel="stylesheet" >
<script type="module" src="https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.2/font/bootstrap-icons.min.css">
<%
   Item item=(Item) request.getAttribute("item");
%>
</head>
<body>

<div class="container mt-5">

   <h1 class="fw-light fg-primary mb-3"><i class="bi bi-apple"></i>moredetails</h1>
   
   <a href="#" onclick="history.back()" class="theme-success btn-solid btn-styled">
     <i class="bi bi-backspace-fill"></i>back
   </a>
   
   <table class="table">
   
      <tr>
         <th>ID</th><td><%=item.getItemId() %></td>
         </tr>
      <tr>
         <th>Name</th><td><%=item.getItemName() %></td>
         </tr>
      <tr>
         <th>Price</th><td><%=StringUtil.toMoney(item.getPrice())  %></td>
         </tr>
      <tr>
         <th>Details</th><td><%=StringUtil.toBR(item.getDetail()) %></td>
         </tr>
      <tr>
         <th>Rating</th><td><%=StringUtil.toStar(item.getRating()) %></td>
         </tr>
      <tr>
         <th>Photo</th><td><img style="height:250px" src="<%=item.getImage() %>"></td>
         </tr>
      <tr>
         <th>Vedio</th><td> if<iframe  src="https://www.youtube.com/embed/<%=item.getYoutube()%>?si=DMJjunf2ojE0VYPG" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>><%=item.getItemId() %></td>
         </tr>
         
   </table>
   </div>
      
</body>
</html>