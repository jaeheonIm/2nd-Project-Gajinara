<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/common/headerAdmin.jsp" %>

<!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_phone"></span>
                        <h4>상담전화</h4>
                        <p>02-2200-0000</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_pin_alt"></span>
                        <h4>주소</h4>
                        <p>서울시 강남구 역삼동</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_clock_alt"></span>
                        <h4>상담 가능한 시간</h4>
                        <p>09:00 am ~ 18:00 pm</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_mail_alt"></span>
                        <h4>Email</h4>
                        <p>gajinara@contact.com</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

    <!-- Map Begin -->
    <div class="map">
        <iframe
        	src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.391412731153!2d127.0297057510789!3d37.498685535669296!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca157b757b7c5%3A0x168510caec9b0fa2!2z7JWE7J207Yuw7JyM!5e0!3m2!1sko!2skr!4v1666290306084!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"
            height="500" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        <div class="map-inside">
            <i class="icon_pin"></i>
            <div class="inside-widget">
                <h4>가지나라</h4>
                <ul>
                    <li>Phone: 02-2200-0000</li>
                    <li>Add: 서울시 강남구 역삼동</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Map End -->

    <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>문의하기</h2>
                    </div>
                </div>
            </div>
            <form action="#">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="성함">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="이메일">
                    </div>
                    <div class="col-lg-12 text-center">
                        <textarea placeholder="문의 내용"></textarea>
                        <button type="submit" class="site-btn">작성 완료</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

<%@include file ="/common/footer2.jsp" %>>