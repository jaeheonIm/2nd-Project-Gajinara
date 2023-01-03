function getBotResponse(input) {
    if (input == "1") {
        console.log("사기거래");
        return '<a>즉시 수사기관에 연락하시고, 자세한 사항은 아래버튼에서 확인하세요.<input type="button" value="분쟁해결절차" onclick=" location=\'/TeamProject_total/chat/Sagi.html\'"/></a>';
    } else if (input == "2") {
        console.log("아이디찾기");
        return '<a>상단메뉴 로그인 회원가입>아이디찾기 혹은 아래 버튼을 클릭하세요.<input type="button" value="아이디찾기" onclick=" location=\'/TeamProject_total/member/findId.jsp\'"/></a>';
    } else if (input == "3") {
        console.log("1:1문의");
        return '<a>상단메뉴 고객센터>QNA 혹은 아래버튼을 클릭하세요.<input type="button" value="문의하기" onclick=" location=\'/TeamProject_total/QnaController?type=qnaMain\'"/></a>';
    } else if (input == "3조 가지나라 최고!") {
    	 console.log("3조 가지나라 최고!");
    	 return '파이팅!';
    } else {
        console.log("잘 이해하지 못했어요. 다른 검색어를 입력해주세요.");
        return "잘 이해하지 못했어요. 다른 검색어를 입력해주세요.";
    }
}
