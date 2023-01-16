<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty userId}">
	<div class="container form-group col-8 mt-3">
		<textarea class="form-control" rows="7"></textarea>
		<div class="d-flex justify-content-between">
			<img alt="" src="https://cdn.pixabay.com/photo/2016/04/16/10/32/paperclip-1332775_1280.png" width=35>
			<a href="#" class="btn btn-info">게시</a>
		</div>
	</div>
</c:if>

<hr>

<div class="card mb-3 container mt-4 col-6">
	<div class="col-12 m-3 pl-2 d-flex justify-content-between">
		<span class="h5 mt-2">userName</span>
		<a href="#">
			<img alt="더보기" src="https://www.iconninja.com/files/860/824/939/more-icon.png" width=40>
		</a>
	</div>
  <img class="card-img-top" src="https://cdn.pixabay.com/photo/2023/01/10/16/23/hedgehog-7710053_1280.jpg" alt="게시글이미지">
  <div class="card-body">
  	<div class="d-flex">
  		<img alt="좋아요" src="https://www.iconninja.com/files/214/518/441/heart-icon.png" width=25>
  		<span class="ml-2">좋아요 10개</span>
  	</div>
  	<div class="mt-4">
    	<strong>userName</strong> userContent
    </div>
    <p class="card-text"><small class="text-muted"></small></p>
    <hr>
    
  </div>
</div>

