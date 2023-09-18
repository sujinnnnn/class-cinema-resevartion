<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영화 상세정보</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
  }
  .container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    background-color: white;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    display: flex;
  }
  .movie-poster {
    flex: 0 0 30%;
    max-width: 30%;
    margin-right: 20px;
  }
  .movie-poster img {
    max-width: 100%;
    height: auto;
    border-radius: 5px;
  }
  .movie-details {
    flex: 1;
  }
  .movie-title {
    font-size: 28px;
    margin: 0;
    color: #333;
    padding-bottom: 10px;
    border-bottom: 1px solid #ccc;
  }
  .movie-info {
    font-size: 20px;
    color: #555;
    margin: 10px 0;
  }
  .movie-description {
    font-size: 22px;
    line-height: 1.5;
    color: #333;
    margin-top: 20px;
  }
</style>
</head>
<body>
  <div class="container">
    <div class="movie-poster">
      <img src="/mvimages/moviePoster/${vo.mvpost}" alt="Movie Poster">
    </div>
    <div class="movie-details">
      <h1 class="movie-title">${vo.mvtitle }</h1>
      <p class="movie-info">개봉 연도: 2023</p>
      <p class="movie-info">장르: ${vo.mvgenre }</p>
      <p class="movie-info">감독: ${vo.mvdirector }</p>
      <div class="movie-description">
        <h2>줄거리</h2>
          ${vo.mvinfo }
      </div>
    </div>
  </div>
</body>
</html>
