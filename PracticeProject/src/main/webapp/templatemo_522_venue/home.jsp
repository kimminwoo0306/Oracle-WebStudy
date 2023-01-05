<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style> @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
*{
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body>
    <section class="banner" id="top">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="banner-caption">
                        <div class="line-dec"></div>
                        <h2>서울 구석구석을 여행하다!</h2>
                        <span>서울 곳곳을 여행해보세요!</span>
                        <div class="blue-button">
                            <a class="scrollTo" data-scrollTo="popular" href="#">찾아보기</a>
                        </div>
                    </div>
                    <div class="submit-form">
                        <form id="form-submit" action="" method="get">
                            <div class="row">
                                <div class="col-md-3 first-item">
                                    <fieldset>
                                        <input name="name" type="text" class="form-control" id="name" placeholder="Your name..." required="">
                                    </fieldset>
                                </div>
                                <div class="col-md-3 second-item">
                                    <fieldset>
                                        <input name="location" type="text" class="form-control" id="location" placeholder="Type location..." required="">
                                    </fieldset>
                                </div>
                                <div class="col-md-3 third-item">
                                    <fieldset>
                                        <select required name='category' onchange='this.form.()'>
                                            <option value="">Select category...</option>
                                            <option value="Shops">Shops</option>
                                            <option value="Hotels">Hotels</option>
                                            <option value="Restaurants">Restaurants</option>
                                            <option value="Events">Events</option>
                                            <option value="Meetings">Meetings</option>
                                            <option value="Fitness">Fitness</option>
                                            <option value="Cafes">Cafes</option>
                                        </select>
                                    </fieldset>
                                </div>
                                <div class="col-md-3">
                                    <fieldset>
                                        <button type="submit" id="form-submit" class="btn">Search Now</button>
                                    </fieldset>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="popular-places" id="popular">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-heading">
                        <span>여행지</span>
                        <h2>서울 갈만한 여행지 추천</h2>
                    </div>
                </div> 
            </div> 
            <div class="owl-carousel owl-theme">
                <div class="item popular-item">
                    <div class="thumb">
                        <img src="img/popular_item_1.jpg" alt="">
                        <div class="text-content">
                            <h4>Mauris tempus</h4>
                            <span>76 listings</span>
                        </div>
                        <div class="plus-button">
                            <a href="#"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item popular-item">
                    <div class="thumb">
                        <img src="img/popular_item_2.jpg" alt="">
                        <div class="text-content">
                            <h4>Aenean dolor</h4>
                            <span>18 listings</span>
                        </div>
                        <div class="plus-button">
                            <a href="#"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item popular-item">
                    <div class="thumb">
                        <img src="img/popular_item_3.jpg" alt="">
                        <div class="text-content">
                            <h4>Nunc at quam</h4>
                            <span>55 listings</span>
                        </div>
                        <div class="plus-button">
                            <a href="#"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item popular-item">
                    <div class="thumb">
                        <img src="img/popular_item_4.jpg" alt="">
                        <div class="text-content">
                            <h4>Fusce ac turpis</h4>
                            <span>66 listings</span>
                        </div>
                        <div class="plus-button">
                            <a href="#"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item popular-item">
                    <div class="thumb">
                        <img src="img/popular_item_5.jpg" alt="">
                        <div class="text-content">
                            <h4>Lorem ipsum</h4>
                            <span>82 listings</span>
                        </div>
                        <div class="plus-button">
                            <a href="#"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item popular-item">
                    <div class="thumb">
                        <img src="img/popular_item_1.jpg" alt="">
                        <div class="text-content">
                            <h4>Praesent nec</h4>
                            <span>76 listings</span>
                        </div>
                        <div class="plus-button">
                            <a href="#"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item popular-item">
                    <div class="thumb">
                        <img src="img/popular_item_2.jpg" alt="">
                        <div class="text-content">
                            <h4>Suspendisse</h4>
                            <span>36 listings</span>
                        </div>
                        <div class="plus-button">
                            <a href="#"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item popular-item">
                    <div class="thumb">
                        <img src="img/popular_item_3.jpg" alt="">
                        <div class="text-content">
                            <h4>Bibendum</h4>
                            <span>48 listings</span>
                        </div>
                        <div class="plus-button">
                            <a href="#"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item popular-item">
                    <div class="thumb">
                        <img src="img/popular_item_4.jpg" alt="">
                        <div class="text-content">
                            <h4>Quisque sodales</h4>
                            <span>66 listings</span>
                        </div>
                        <div class="plus-button">
                            <a href="#"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item popular-item">
                    <div class="thumb">
                        <img src="img/popular_item_5.jpg" alt="">
                        <div class="text-content">
                            <h4>Pellentesque</h4>
                            <span>85 listings</span>
                        </div>
                        <div class="plus-button">
                            <a href="#"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item popular-item">
                    <div class="thumb">
                        <img src="img/popular_item_1.jpg" alt="">
                        <div class="text-content">
                            <h4>Commodo</h4>
                            <span>76 listings</span>
                        </div>
                        <div class="plus-button">
                            <a href="#"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item popular-item">
                    <div class="thumb">
                        <img src="img/popular_item_2.jpg" alt="">
                        <div class="text-content">
                            <h4>Adipiscing</h4>
                            <span>32 listings</span>
                        </div>
                        <div class="plus-button">
                            <a href="#"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item popular-item">
                    <div class="thumb">
                        <img src="img/popular_item_3.jpg" alt="">
                        <div class="text-content">
                            <h4>Etiam hendrerit</h4>
                            <span>49 listings</span>
                        </div>
                        <div class="plus-button">
                            <a href="#"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item popular-item">
                    <div class="thumb">
                        <img src="img/popular_item_4.jpg" alt="">
                        <div class="text-content">
                            <h4>Suspendisse</h4>
                            <span>63 listings</span>
                        </div>
                        <div class="plus-button">
                            <a href="#"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="item popular-item">
                    <div class="thumb">
                        <img src="img/popular_item_5.jpg" alt="">
                        <div class="text-content">
                            <h4>Sit amet dictum</h4>
                            <span>86 listings</span>
                        </div>
                        <div class="plus-button">
                            <a href="#"><i class="fa fa-plus"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <section class="featured-places" id="blog">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-heading">
                        <span>맛집</span>
                        <h2>서울 인기 맛집 추천</h2>
                    </div>
                </div> 
            </div> 
            <div class="row">
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="featured-item">
                        <div class="thumb">
                            <img src="img/featured_item_1.jpg" alt="">
                            <div class="overlay-content">
                                <ul>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                </ul>
                            </div>
                            <div class="date-content">
                                <h6>28</h6>
                                <span>August</span>
                            </div>
                        </div>
                        <div class="down-content">
                            <h4>Lorem ipsum dolor</h4>
                            <span>Category One</span>
                            <p>Vestibulum id est eu felis vulputate hendrerit. Suspendisse dapibus turpis in dui pulvinar imperdiet. Nunc consectetur.</p>
                            <div class="row">
                                <div class="col-md-6 first-button">
                                    <div class="text-button">
                                        <a href="#">Add to favorites</a>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="text-button">
                                        <a href="#">Continue Reading</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="featured-item">
                        <div class="thumb">
                            <img src="img/featured_item_2.jpg" alt="">
                            <div class="overlay-content">
                                <ul>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                </ul>
                            </div>
                            <div class="date-content">
                                <h6>20</h6>
                                <span>September</span>
                            </div>
                        </div>
                        <div class="down-content">
                            <h4>Nullam nibh lacus</h4>
                            <span>Category Two</span>
                            <p>Mauris sit amet quam congue, pulvinar urna et, congue diam. Suspendisse eu lorem massa. Integer sit amet posuere.</p>
                            <div class="row">
                                <div class="col-md-6 first-button">
                                    <div class="text-button">
                                        <a href="#">Add to favorites</a>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="text-button">
                                        <a href="#">Continue Reading</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="featured-item">
                        <div class="thumb">
                            <img src="img/featured_item_3.jpg" alt="">
                            <div class="overlay-content">
                                <ul>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                </ul>
                            </div>
                            <div class="date-content">
                                <h6>12</h6>
                                <span>October</span>
                            </div>
                        </div>
                        <div class="down-content">
                            <h4>Suspendisse semper non</h4>
                            <span>Category Three</span>
                            <p>Praesent iaculis gravida elementum. Proin fermentum neque facilisis semper pharetra. Sed vestibulum vehicula tincidunt.</p>
                            <div class="row">
                                <div class="col-md-6 first-button">
                                    <div class="text-button">
                                        <a href="#">Add to favorites</a>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="text-button">
                                        <a href="#">Continue Reading</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <section class="our-services" id="services">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-heading">
                        <span>서울 99여행의 서비스</span>
                        <h2>서울 구석구석 여행 추천!</h2>
                    </div>
                </div> 
            </div> 
            <div class="row">
                <div class="col-md-4">
                    <div class="service-item">
                        <div class="icon">
                            <img src="img/service_icon_1.png" alt="">
                        </div>
                        <h4>서울 갈만한 여행지 제공</h4>
                        <p>Etiam viverra nibh at lorem hendrerit porta non nec ligula. Donec hendrerit porttitor pretium. Suspendisse fermentum nec risus.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-item">
                        <div class="icon">
                            <img src="img/service_icon_2.png" alt="">
                        </div>
                        <h4>서울 추천 맛집 제공</h4>
                        <p>Vivamus nec vehicula felis, sit amet convallis ex. Aenean dolor risus, rutrum at tincidunt eget, placerat ac mauris.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="service-item">
                        <div class="icon">
                            <img src="img/service_icon_3.png" alt="">
                        </div>
                        <h4>홈페이지 이용</h4>
                        <p>Praesent nec dui sed urna pharetra dapibus at ac elit. Aenean hendrerit metus leo, quis viverra purus condimentum nec.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="down-services">
                        <div class="row">
                            <div class="col-md-5 col-md-offset-1">
                                <div class="left-content">
                                    <h4>In hac habitasse platea dictumst</h4>
                                    <p>Aenean hendrerit metus leo, quis viverra purus condimentum nec. Pellentesque a sem semper, lobortis mauris non, varius urna. Quisque sodales purus eu tellus fringilla.<br><br>Mauris sit amet quam congue, pulvinar urna et, congue diam. Suspendisse eu lorem massa. Integer sit amet posuere tellus, id efficitur leo. In hac habitasse platea dictumst.</p>
                                    <div class="blue-button">
                                        <a href="#">Discover More</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="accordions">
                                    <ul class="accordion">
                                        <li>
                                            <a>Ut in dapibus ipsum</a>
                                            <p>Nulla eget aliquet dui, vitae tincidunt nulla. Sed sagittis odio vitae auctor volutpat. In semper ex neque, ut hendrerit mauris rutrum eget. Integer consectetur neque eu enim dictum porta. Sed et risus ac sapien congue mattis.</p>
                                        </li>
                                        <li>
                                            <a>Vivamus ligula metus</a>
                                            <p>Integer vel augue arcu. Fusce ac turpis cursus, malesuada nulla quis, lobortis dui. Etiam blandit, erat efficitur rhoncus pellentesque, ligula turpis tempor dolor.</p>
                                        </li>
                                        <li>
                                            <a>Suspendisse dapibus</a>
                                            <p>Nullam nibh lacus, rhoncus sit amet feugiat vel, porttitor sit amet nibh. Pellentesque feugiat justo nec enim pretium, sed faucibus lacus aliquam. Sed ac interdum mauris.</p>
                                        </li>
                                    </ul> <!-- / accordion -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    

    <section id="video-container">
        <div class="video-overlay"></div>
        <div class="video-content">
            <div class="inner">
                <span>Video Presentation</span>
                <h2>Sed et risus ac sapien congue mattis.</h2>
                <a href="http://youtube.com" target="_blank"><i class="fa fa-play"></i></a>
            </div>
        </div>
        <video autoplay="" loop="" muted>
        	<source src="highway-loop.mp4" type="video/mp4" />
        </video>
    </section>



    <section class="pricing-tables">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-heading">
                        <span>Pricing Tables</span>
                        <h2>Duis molestie ipsum id faucibus fermentum</h2>
                    </div>
                </div> 
            </div> 
            <div class="row">
                <div class="col-md-4">
                    <div class="table-item">
                        <div class="top-content">
                            <h4>Starter Plan</h4>
                            <h1>$25</h1>
                            <span>/monthly</span>
                        </div>
                        <ul>
                            <li><a href="#">100 Suspendisse dapibus</a></li>
                            <li><a href="#">10x Paleo celiac enamel</a></li>
                            <li><a href="#">Williamsburg organic post ironic</a></li>
                            <li><a href="#">Helvetica pinterest yuccie</a></li>
                            <li><a href="#">Plaid shabby chic godard</a></li>
                        </ul>
                        <div class="blue-button">
                            <a href="#">Buy It Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="table-item">
                        <div class="top-content">
                            <h4>Premium Plan</h4>
                            <h1>$45</h1>
                            <span>/monthly</span>
                        </div>
                        <ul>
                            <li><a href="#">200 Suspendisse dapibus</a></li>
                            <li><a href="#">20x Paleo celiac enamel</a></li>
                            <li><a href="#">Williamsburg organic post ironic</a></li>
                            <li><a href="#">Helvetica pinterest yuccie</a></li>
                            <li><a href="#">Plaid shabby chic godard</a></li>
                        </ul>
                        <div class="blue-button">
                            <a href="#">Buy It Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="table-item">
                        <div class="top-content">
                            <h4>Advanced Plan</h4>
                            <h1>$85</h1>
                            <span>/monthly</span>
                        </div>
                        <ul>
                            <li><a href="#">400 Suspendisse dapibus</a></li>
                            <li><a href="#">40x Paleo celiac enamel</a></li>
                            <li><a href="#">Williamsburg organic post ironic</a></li>
                            <li><a href="#">Helvetica pinterest yuccie</a></li>
                            <li><a href="#">Plaid shabby chic godard</a></li>
                        </ul>
                        <div class="blue-button">
                            <a href="#">Buy It Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <section class="contact" id="contact">

        <div class="container">
            <div class="col-md-10 col-md-offset-1">
                <div class="wrapper">
                  <div class="section-heading">
                      <span>Contact Us</span>
                      <h2>도움이 필요하신가요?</h2>
                  </div>
                  <!-- Modal button -->
                  <button id="modBtn" class="modal-btn">문의하기</button>
                </div>  
                <div id="modal" class="modal">
                  <!-- Modal Content -->
                  <div class="modal-content">
                    <div class="close fa fa-close"></div>
                    <div class="row">
                        <div class="col-md-8"> 
                            <div class="left-content">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="section-heading">
                                            <span>Talk To Us</span>
                                            <h2>Let's have a discussion</h2>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                      <fieldset>
                                        <input name="name" type="text" class="form-control" id="name" placeholder="Your name..." required="">
                                      </fieldset>
                                    </div>
                                     <div class="col-md-6">
                                      <fieldset>
                                        <input name="subject" type="text" class="form-control" id="subject" placeholder="Subject..." required="">
                                      </fieldset>
                                    </div>
                                    <div class="col-md-12">
                                      <fieldset>
                                        <textarea name="message" rows="6" class="form-control" id="message" placeholder="Your message..." required=""></textarea>
                                      </fieldset>
                                    </div>
                                    <div class="col-md-12">
                                      <fieldset>
                                        <button type="submit" id="form-submit" class="btn">Send Message</button>
                                      </fieldset>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="right-content">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="content">                                          
                                            <div class="section-heading">
                                                <span>More About Us</span>
                                                <h2>Venue Company</h2>
                                            </div>
                                            <p>Etiam viverra nibh at lorem hendrerit porta non nec ligula. Donec hendrerit porttitor pretium. Suspendisse fermentum nec risus eu bibendum.</p>
                                            <ul>
                                                <li><span>Phone:</span><a href="#">010-050-0550</a></li>
                                                <li><span>Email:</span><a href="#">hi@company.co</a></li>
                                                <li><span>Address:</span><a href="#">company.co</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>      
                  </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>