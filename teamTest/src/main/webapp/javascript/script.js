//QA게시글 작성 빈칸 확인
function validateForm(form) {  
	if(form.title.value == ""){
		alert("제목란이 비어있습니다.")
		form.title.focus();
		return false;
	}
	else if(form.content.value == ""){
		alert("내용란이 비어있습니다.")
		form.content.focus();
		return false;
	}
}
//QA게시글 관리자 답변작성 빈칸 확인
function anvalidateForm(form) {  
	if(form.answer.value == ""){
		alert("답변란이 비어있습니다.")
		form.content.focus();
		return false;
	}
}
//QA게시글 관리지 답변 등록 불가
function check(){
	alert("답변내용이 반영되지않았습니다.")
	let url = document.location.href;
	let idx = url.substring(url.indexOf('?'));
	location.href="./qaview.do"+idx;
}
//QA게시글 관리자 삭제 확인
function deletecheck(){
	let url = document.location.href;
	let idx = url.substring(url.indexOf('?'));
	let result = confirm("정말로 삭제하시겠습니까?");
	if(result){
		location.href="./qadelete.do"+idx;
	}
	else{
		location.href="./qaview.do"+idx;
	}
}
//member 회원가입 확인
function checkinsertmember(){
	let url = document.location.href;
	console.log(url);
	let result = url.substring(url.indexOf('1'));
	console.log(result)
	if(result == 1){
		alert("이미 존재하는 아이디입니다.");
		location.href="/book/member/merberinsert.jsp";
	}
	else{
		alert("회원가입이 완료되었습니다.");
		location.href="/book/book/list.do";
	}
}
//member 로그인 체크 실패
function loginch(){
	alert("아이디 혹은 비밀번호가 일치하지않습니다.")
	location.href="/book/book/list.do"
}

//게시글 작성 빈칸 확인
function livalidateForm(form) {  
	if(form.name.value == ""){
		alert("제목란이 비어있습니다.")
		form.title.focus();
		return false;
	}
	else if(form.ofile.value == ""){
		alert("책이미지 파일이 비어있습니다.")
		form.content.focus();
		return false;
	}
	else if(form.publisher.value == ""){
		alert("출판사란이 비어있습니다.")
		form.content.focus();
		return false;
	}
	else if(form.writer.value == ""){
		alert("저자란이 비어있습니다.")
		form.content.focus();
		return false;
	}
	else if(form.price.value == ""){
		alert("가격란이 비어있습니다.")
		form.content.focus();
		return false;
	}
}
//게시글 생성 확인
function listinsertch(){
	let url = document.location.href;
	let result = url.substring(url.indexOf('1'));
	if(result == 1){
		alert("게시글이 작성되었습니다.");
	}
	else if(result != 1){
		alert("게시글을 작성하지못했습니다.");
	}
}
//게시글 수정 불가
function listcheck(){
	alert("게시글을 수정할수 없습니다.")
	let url = document.location.href;
	let idx = url.substring(url.indexOf('?'));
	location.href="./view.do"+idx;
}
//게시글 삭제 확인
function listdeletecheck(){
	let url = document.location.href;
	let idx = url.substring(url.indexOf('?'));
	let result = confirm("정말로 삭제하시겠습니까?");
	if(result){
		location.href="./delete.do"+idx;
	}
	else{
		location.href="./view.do"+idx;
	}
}
//온오프
let onoff = true;
function off(){
	onoff = false;
}
function on(){
	onoff = true;
}
//리뷰 확인
function reviewch(a){
	if(a == 1){
		alert("완료되었습니다.");
	}
	else if(a == 0){
		alert("완료하지못했습니다.");
	}
}
//구매 처리
function buych(a){
	if(a == 1){
		alert("구매가 완료되었습니다.");
	}
	else if(a == 0){
		alert("구매중 문제가 초기화면으로 돌아갑니다.");
		location.href="./list.do"
	}
}
//채팅관련 스크립트
if(onoff){
	let webSocket = new WebSocket("ws://localhost:8090/websocket/chatingServer")
	let chatWindow, chatMessage, chatId;
	//창이 열리면
	window.onload = function() {
		chatWindow = document.getElementById("chatWindow");
		chatMessage = document.getElementById("chatMessage");
		chatId = document.getElementById("chatId").value;
	}
	//메세지 전송
	function sendMessage() {
		chatWindow.innerHTML += "<div class='myMsg'>"+chatId+" : "+chatMessage.value+"</div>";
		//서버로 메세지 전송 [아이디|내용]
		webSocket.send(chatId+"|"+chatMessage.value);
		chatMessage.value = "";
		//자동 스크롤시 글자크기만큼 아래로
		chatWindow.scrollTop = chatWindow.scrollHeight;
		chatMessage.value = "";
	}
	//채팅종료
	function disconnect() {
		webSocket.close();
	}
	//엔터키 처리
	function enterKey() {
		if(window.event.keyCode == 13){ //키코드 13 = enter
			sendMessage();
		}
	}
	//웹소켓 서버 상태확인
	webSocket.onopen = function(event) {
		chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다.<br/>"
	}
	webSocket.onclose = function(event) {
		chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다.<br/>"
	}
	webSocket.onerror = function (event) {
		alert(evnet.data);
		chatWindow.innerHTML += "채팅 중 에러가 발생했습니다.<br/>"
	}
	//메세지를 받았을때
	webSocket.onmessage = function (event) {
		let message = event.data.split("|");
		let sender = message[0];
		let content = message[1];
		if(content != ""){
			if(content.match("/")){
				if(content.match("/"+chatId)){
					let temp = content.replace(("/"+chatId),"[귓속말]: ");
					chatWindow.innerHTML += "<div>"+sender+" : "+temp+"</div>";
				}
			}
			else{
				chatWindow.innerHTML += "<div>"+sender+" : "+content+"</div>";
			}
			chatWindow.scrollTop = chatWindow.scrollHeight;
		}
	}
}
//주소 api
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
//회원가입 빈칸 확인
function mevalidateForm(form) {  
	if(form.id.value == ""){
		alert("아이디란이 비어있습니다.")
		form.id.focus();
		return false;
	}
	else if(form.pass.value == ""){
		alert("비밀번호란이 비어있습니다.")
		form.pass.focus();
		return false;
	}
	else if(form.name.value == ""){
		alert("이름란이 비어있습니다.")
		form.name.focus();
		return false;
	}
	else if(form.address.value == ""){
		alert("주소란이 비어있습니다.")
		form.address.focus();
		return false;
	}
	else if(form.address2.value == ""){
		alert("상세주소란이 비어있습니다.")
		form.address2.focus();
		return false;
	}
	else if(form.gender.value == ""){
		alert("성별란이 비어있습니다.")
		form.gender.focus();
		return false;
	}
	else if(form.age.value == ""){
		alert("나이란이 비어있습니다.")
		form.age.focus();
		return false;
	}
	else if(form.job.value == ""){
		alert("직업란이 비어있습니다.")
		form.job.focus();
		return false;
	}
}