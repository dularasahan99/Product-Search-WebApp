<%@page import="aiwa.util.StringUtil"%>
<%@page import="java.util.ArrayList" %>
<%@page import="aiwa.entity.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head >
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/css/bootstrap.min.css" rel="stylesheet" >
<script type="module" src="https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.2/font/bootstrap-icons.min.css">
<% 
      ArrayList<Item>items=(ArrayList<Item>)request.getAttribute("items");
      String word=(String)request.getAttribute("word");

      int priceMin=(int) request.getAttribute("pricemin");
      int priceMax=(int) request.getAttribute("pricemax");

%>
<style>

      .card-img-top{
         height:300px;
         object-fit:cover;
      }

</style>

</head>
<body class="p-3 mb-2 bg-black fg-white">
<div class="container mt-5" >

   <h1 class="fw-light fg-primary mb-3"><i class="bi bi-apple"></i>商品リスト</h1>
   
  <form action="ItemListController">
  
  <div class="mb-3 ">
  
   <input class="form-control" type="text" name="Keyword" placeholder="キーワード" value="<%=word %>">
   </div>
   
   <div class="row mb-3">
     
      <div class="col">
      
         <input type="text" class="form-control" name="pricemin" placeholder="最小価格" value="<%=priceMin > 0 ?priceMin :"" %>">
      
      </div>
      
      <div class="col">
      
         <input type="text" class="form-control" name="pricemax" placeholder="最大価格" value="<%=priceMax >0 ? priceMax :""%>">
      
      </div>
      
   </div>
   
   <div class="mb-3 text-end">
   
   <button class="theme-primary btn-soild btn-styled"><i class="bi bi-search"></i>search</button>
   
   </div>
   
  </form>
  
  <div class="alert theme-info mb-6">
  
    検索結果:<%=items.size() %>件
  
  </div>
  
 <div class="row g-5 mt-5">
   
<%for(Item item:items){ %>

  <div class="xl:col-3 lg:col-4 sm:col-6 ">
     <section class="card " >
        <img src="<%=item.getImage() %>" class="card-img-top" alt="...">
          <div class="card-body ">
            <h4 class="card-title text-truncate"><%=item.getItemName() %></h4>
            <p class="card-text"><%=StringUtil.toMoney(item.getPrice()) %>円</p>
            <p class="card-text"><%=StringUtil.toStar(item.getRating()) %></p>
            <a href="ItemDetailController?itemid=<%=item.getItemId() %>" class="btn-solid theme-primary">more details <i class="bi bi-search-heart"></i></a>
          </div>
     </section>
  </div>
<%} %>
   </div>
</div> 
</body>
</html>