 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  </div>
            </div>
        </div>
    </section>
        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

		<!-- 챗봇 -->
 		<div class="chat-bar">
            <button id="chat-button" type="button" class="collapsible">가지나라 챗봇에게 물어보세요!
                <i id="chat-icon" style= "color: #fff;" class="fa fa-fw fa-comments-o"></i>
            </button>

            <div class="content">
                <div class="full-chat-block">
                    <div class="outer-container">
                        <div class="chat-container">
                            <div id="chatbox">
                                <h5 id="chat-timestamp"></h5>
                                <p id="botStarterMessage" class="botText"><span>Loading...</span></p>
                            </div>

                            <div class="chat-bar-input-block">
                                <div id="userInput">
                                    <input id="textInput" class="input-box" type="text" name="msg"
                                    placeholder="엔터키를 눌러 메시지를 보내세요">
                                    <p></p>
                                </div>

                                <div class="chat-bar-icons">
                                    <i id="chat-icon" style="color: crimson;" class="fa fa-fw fa-heart"
                                    onclick='heartButton()'></i>
                                    <i id="chat-icon" style="color: #333;" class="fa fa-fw fa-send"
                                    onclick='sendButton()'></i>
                                </div>
                            </div>
                            <div id="chat-bar-bottom">
                                <p></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
            
            
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="${pageContext.request.contextPath}/index.html"><img src="${pageContext.request.contextPath}/img/logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 서울특별시 강남구 역삼동</li>
                            <li>Phone: +82 2200-0000</li>
                            <li>Email: gajinara@contact.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                    <h6>가지나라</h6>
                        <ul>
                            <li><a href="#">이용약관</a></li>
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">위치기반서비스 이용약관</a></li>
                            <li><a href="#">이용자보호 비전과 계획</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>가지나라의 소식을 받아보세요</h6>
                        <p>이메일을 입력하시면 가지나라의 소식을 보내드립니다</p>
                        <form action="#">
                            <input type="text" placeholder="이메일을 입력하세요">
                            <button type="submit" class="site-btn">구독</button>
                        </form>
                        
                    
                
            		</div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                      

                        <div class="footer__copyright__payment"><img src="${pageContext.request.contextPath}/img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>

	<script src="${pageContext.request.contextPath}/chat/Chat.js"></script>
 	<script src="${pageContext.request.contextPath}/chat/Reply.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/chat/Chat.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/chat/Home.css">

</body>

</html>