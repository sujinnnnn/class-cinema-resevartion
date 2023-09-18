<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/main.css">
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Document</title>
</head>
<body>
    <header>
        <div id= "hd" style="z-index: 1000; margin: 0 auto;">
            <div style="width: 100%; background-color: #f9f9f9; border-bottom: #ddd 1px solid;">
                <div style="width: 1000px; margin:0 auto; height: 35px; line-height: 35px;">
                    <ul style="float: left;">
                        <li class="li_style"><a class="li_left_style" href ="../main/main.html" style="padding: 0 20px; display: inline; font-size: 11px;"> HOME </a></li>
                        <li class="li_style"><a class="li_left_style" href="">즐겨찾기 </a></li>
                    </ul>

                    <ul style='float:right;'>
                        <li class="li_style"><a class="a_li_style" href="../member/registerToS.html">회원가입</a></li>
                        <li class="li_style"><a class="a_li_style" href="../member/login.html"><b>로그인</b></a></li>
                        <li class="li_style"><a class="a_li_style" href="../member/MyPage.html">마이페이지</a></li>
                        <li class="li_style"><a class="a_li_style" href="">예약조회</a></li>
                        <li class="li_style"><a class="a_li_style" href="noticeList.do">공지사항</a></li>
                        <li class="li_style"><a class="a_li_style" href=""><b>예약상담</b></a></li>
                        <li class="li_style"><a class="a_li_style" href=""><b>이용후기</b></a></li>
                        <li class="li_style"><a class="a_li_style3" href="">개인결제</a></li>   
                    </ul>
                </div>
            </div>

            <div id="hd_wrapper">
                <div style="width: 100%; height: 80px;">

                    <div id="hd_wrapper_call_div">
                        <img src="../images/call_center.jpg" alt="고객센터 : 012-777-7777">
                    </div>

                    <div id="hd_wrapper_main_title">
                        <a href="../main/main.html"> <img src="../images/logo_img.jpg" alt="제주렌트카"> </a>
                    </div>

                    <div id="hd_wrapper_kakao">
                        <img src="../images/yellowid.png" alt="카카오톡">
                    </div>

                </div>

            </div>

            <div id="rentlist_left" >
                <div id="rentlist_right">
                    <nav id="gnb">
                        <h2>쇼핑몰 카테고리</h2>

                        <ul id="gnb_1dul" >
                            <li class="gnb_1dli">
                                <a href="" class="gnb_2da"> <font color = #FFF000>★ 전체차량 리스트 ☆</font></a>
                            </li>
                            <li class="gnb_1dli" style="z-index:998">
                                <a href="" class="gnb_1da">경.소형차량</a>
                            </li>
                            <li class="gnb_1dli" style="z-index:997">
                                <a href="" class="gnb_1da">중형차량</a>
                            </li>
                            <li class="gnb_1dli" style="z-index:996">
                                <a href="" class="gnb_1da">고급차량</a>
                            </li>
                            <li class="gnb_1dli" style="z-index:995">
                                <a href="" class="gnb_1da">SUV / RV</a>
                            </li>
                            <li class="gnb_1dli" style="z-index:994">
                                <a href="" class="gnb_1da">승합차량</a>
                            </li>
                            <li class="gnb_1dli" style="z-index:993">
                                <a href="" class="gnb_1da">외제차량</a>
                            </li>
                        </ul>

                        <ul class="gnb_co">
                            <li class="bg_no"><b><font color='#ffff00'><a href="" class="gnb_2da">기사전용차량</a></font></b></li>
                            <li><a href="">실시간항공권</a></li>
                            <li><a href="">관광지할인쿠폰</a></li>
                        </ul>

                    </nav>
                </div>
            </div>
        </div>
    </header>


    <div id = "wrapper">

        <div id="container">
            <section class="sct_wrap">
                <header >
                    <a href="">
                        <h1 style="letter-spacing:-0.06em; font-size:24px; margin:30px 0 10px 0;">
                            <strong style="color:#2fac23;">최신형 할인</strong> 
                            <span>렌트카</span>
                            <span style="font-size:12px; font-weight:normal; margin-left:10px; padding-left:10px; color:#777; border-left:#ccc 1px solid; letter-spacing:normal;">고객님을 위해 추천해드리는 신규 할인 렌트카</span>
                            <button type="button" data-role="none" class="slick-prev slick-arrow" aria-label="Previous" role="button" style="display: block;">◀</button>
                            <button type="button" data-role="none" class="slick-next slick-arrow" aria-label="Next" role="button" style="display: block;">▶</button>
                        </h1>
                    </a>
                </header>

                <div class="slick-list">
                    <ul style="opacity: 1; width: 1708px;" id="">
                        <li class="sct_li  slick-slide" style="width: 244px;">
                            <div class="sct_img">
                                <img src="../images/car_1.jpg" width="210" height="210">
                            </div>
                            <div class="sct_txt">
                                <a href="" class="sct_a" tabindex="-1">
                                    올뉴K7 + 고급자차
                                    </a>
                            </div>
                            <div class="sct_cost">
                                <strike>220,000원</strike>
                                110,000원
                            </div>
                        </li>
                        <li class="sct_li  slick-slide" style="width: 244px;">
                            <div class="sct_img">
                                <img src="../images/car_2.jpg" width="210" height="210">
                            </div>
                            <div class="sct_txt">
                                <a href="" class="sct_a" tabindex="-1">
                                    소나타 + 고급자차
                                    </a>
                            </div>
                            <div class="sct_cost">
                                <strike>123,000원</strike>
                                87,000원
                            </div>
                        </li>
                        <li class="sct_li  slick-slide" style="width: 244px;">
                            <div class="sct_img">
                                <img src="../images/car_3.jpg" width="210" height="210">
                            </div>
                            <div class="sct_txt">
                                <a href="" class="sct_a" tabindex="-1">
                                    그렌져 + 고급자차
                                    </a>
                            </div>
                            <div class="sct_cost">
                                <strike>324,000원</strike>
                                152,000원
                            </div>
                        </li>
                        <li class="sct_li  slick-slide" style="width: 244px;">
                            <div class="sct_img">
                                <img src="../images/car_4.jpg" width="210" height="210">
                            </div>
                            <div class="sct_txt">
                                <a href="" class="sct_a" tabindex="-1">
                                    SUV + 고급자차
                                    </a>
                            </div>
                            <div class="sct_cost">
                                <strike>999,000원</strike>
                                444,000원
                            </div>
                        </li>
                    </ul>
                </div>
            </section>

            <section>
                <div class="lt_list">
                    <div class="lt_qa">
                        
                <div class="lat">
                    <h2 class="lat_title" ><a href="">예약상담</a></h2>
                    <ul>
                            <li>
                            <a href="">안녕하세요</a><span class="lt_date">08-29</span>
                        </li>
                            <li>
                            <a href="">Re: 안녕하세요</a><span class="lt_date">09-01</span>
                        </li>
                            <li>
                            <a href="">결제</a><span class="lt_date">04-13</span>
                        </li>
                            <li>
                            <a href="">Re: 결제</a><span class="lt_date">04-14</span>
                        </li>
                            <li>
                            <a href="">예약했어요</a><span class="lt_date">12-03</span>
                        </li>
                            </ul>
                    <div class="lat_more"><a href=""><span class="sound_only">예약상담</span>더보기</a></div>
                </div>
                    </div>
                    <div class="lt_notice">
                        
                <div class="lat">
                    <h2 class="lat_title"><a href="">공지사항</a></h2>
                    <ul>
                            <li>
                            <a href="">2021년도 여름 성수기 [제주도…</a><span class="lt_date">06-07</span>
                        </li>
                            <li>
                            <a href="">여름성수기 제주도렌트카 예약 오픈…</a><span class="lt_date">06-03</span>
                        </li>
                            <li>
                            <a href=""><strong>신용카드 이용내역 조회</strong></a><span class="lt_date">04-02</span>
                        </li>
                            <li>
                            <a href="">제네시스GV80 7인승 / K7프…</a><span class="lt_date">03-19</span>
                        </li>
                            <li>
                            <a href="">★ 이달의 특가차량 ☆ 판매시작</a><span class="lt_date">03-04</span>
                        </li>
                            </ul>
                    <div class="lat_more"><a href=""><span class="sound_only">공지사항</span>더보기</a></div>
                </div>
                    </div>
                    <div class="lt_tel">
                        <img src="../images/cs_center.jpg" alt="고객센터 Tel. 064)747-6606">
                    </div>
            </section>

            <footer>
                <div>
                    <ul>
                        <li><a href="">회사소개</a></li>
                        <li><a href="">전자상거래표준약관</a></li>
                        <li><a href="">개인정보 취급방침</a></li>
                        <li><a href="">국내여행표준약관</a></li>
                        <li>
                            <select size="1" id="formselect" name="select4" class="top">
                                <option selected>::::제휴사이트 링크::::</option>
                                <option>-----------------------</option>
                                <option value="">제주허브닷컴</option>
                                <option value="">제주허브렌트카</option>
                                <option value="">제주렌트카닷컴</option>
                            </select></li>
                    </ul>
                    <p>
                        <span><b>회사명</b> 제주렌트카 (상호명:제주허브닷컴)</span>
                        <span><b>주소</b> 제주특별자치도 제주시 평전길13 (1층, 삼도1동)</span><br>
                        <span><b>사업자 등록번호</b> 616-27-75958</span>
                        <span><b>대표</b> 조영민</span>
                        <span><b>전화</b> 064-747-6606</span>
                        <span><b>팩스</b> 064-803-0843</span><br>
                        <span><b>통신판매업신고번호</b> 제2020-삼도1동-0032호</span>
                        <span><b>개인정보관리책임자</b> 조영민</span>
                        <span><b>부가통신사업신고번호</b> 제2011-46호</span><br>
                        <span class="copy">Copyright © 2016-2020 제주렌트카 (상호명:제주허브닷컴). All Rights Reserved.</span>
                    </p>
                </div>

            </footer>
        </div>
    </div>
</body>
</html>