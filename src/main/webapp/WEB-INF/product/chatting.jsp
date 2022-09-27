<%@page import="member.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %> 

 <style>
 .chat-window{
 	background-color: white;
 }
 
html,
body {
    height: 100%;
    width: 100%;
    margin: 0;
    padding: 0;
    font-family: sans-serif;
    background: #EEF1FF;
}
body {
  display: flex;
  align-items: center;
  justify-content: center;
    flex-direction: column;
}
::-webkit-scrollbar {
  width: 4px;
}
::-webkit-scrollbar-thumb {
  background-color: #D2DAFF;
  border-radius: 2px;
}
.chatbox {
    width: 300px;
    height: 400px;
    max-height: 400px;
    display: flex;
    flex-direction: column;
    overflow: hidden;
    box-shadow: 0 0 4px rgba(0,0,0,.14),0 4px 8px rgba(0,0,0,.28);
}
.chat-window {
    flex: auto;
    max-height: calc(100% - 60px);
    background: #D2DAFF;
    overflow: auto;
}
.chat-input {
    flex: 0 0 auto;
    height: 60px;
    background: #AEBDCA;
    border-top: 1px solid #7895B2;
    box-shadow: 0 0 4px rgba(0,0,0,.14),0 4px 8px rgba(0,0,0,.28);
}
.chat-input input {
    height: 59px;
    line-height: 60px;
    outline: 0 none;
    border: none;
    width: calc(100% - 60px);
    color: black;
    text-indent: 10px;
    font-size: 12pt;
    padding: 0;
    background: #EEF1FF;
}
.chat-input button {
    float: right;
    outline: 0 none;
    border: none;
    background: #EEF1FF;
    height: 40px;
    width: 40px;
    border-radius: 50%;
    padding: 2px 0 0 0;
    margin: 10px;
    transition: all 0.15s ease-in-out;
}
.chat-input input[good] + button {
    box-shadow: 0 0 2px rgba(0,0,0,.12),0 2px 4px rgba(0,0,0,.24);
    background: #2671ff;
}
.chat-input input[good] + button:hover {
    box-shadow: 0 8px 17px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
}
.chat-input input[good] + button path {
    fill: white;
}
.msg-container {
    position: relative;
    display: inline-block;
    width: 100%;
    margin: 0 0 10px 0;
    padding: 0;
}
.msg-box {
    display: flex;
    background: #AAC4FF;
    padding: 10px 10px 0 10px;
    border-radius: 0 6px 6px 0;
    max-width: 80%;
    width: auto;
    float: left;
    box-shadow: 0 0 2px rgba(0,0,0,.12),0 2px 4px rgba(0,0,0,.24);
}
.user-img {
    display: inline-block;
    border-radius: 50%;
    height: 40px;
    width: 40px;
    background: #2671ff;
    margin: 0 10px 10px 0;
}
.flr {
    flex: 1 0 auto;
    display: flex;
    flex-direction: column;
    width: calc(100% - 50px);
}
.messages {
    flex: 1 0 auto;
}
.msg {
    display: inline-block;
    font-size: 11pt;
    line-height: 13pt;
    color: rgba(255,255,255,.7);
    margin: 0 0 4px 0;
}
.msg:first-of-type {
    margin-top: 8px;
}
.timestamp {
    color: rgba(0,0,0,.38);
    font-size: 8pt;
    margin-bottom: 10px;
}
.username {
    margin-right: 3px;
}
.posttime {
    margin-left: 3px;
}
.msg-self .msg-box {
    border-radius: 6px 0 0 6px;
    background: #B1B2FF;
    float: right;
}
.msg-self .user-img {
    margin: 0 0 10px 10px;
}
.msg-self .msg {
    text-align: right;
}
.msg-self .timestamp {
    text-align: right;
}
 
 </style>  
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script>
 
 $(function(){
	 $('.chat-window').scrollTop($('.chat-window')[0].scrollHeight);
	 
	 const name = localStorage.getItem('message');
	 $('#sendmsg').attr('value',name);
	
	 var len = $('#sendmsg').val().length;
	 $('#sendmsg').focus();
	 $('#sendmsg')[0].setSelectionRange(len, len);
	 
	 
	 $('#sendmsg').keyup(function(){
		 localStorage.setItem('message',$('#sendmsg').val());
	 })
 })
 
  const interval = setInterval(function() {
		 localStorage.setItem('message',$('#sendmsg').val());
	  location.reload();
 	 	}, 2000);	 
 
 function sendm(){
	 var sendmsg =$('#sendmsg').val();
	 var pno =$('#pno').val();
	 
	 localStorage.removeItem('message');
	 
	 if(sendmsg==""){
		 return false;
	 }
	 $.ajax({
			type : 'post',
			url : "sendmsg.prd",
			data : {
				sendmsg : sendmsg,
				pno : pno
			},
			success : function(data) {
				if($.trim(data)=="y"){
					location.reload();
				}
				else{
					alert("안됨");
				}
			}//success

		});//ajax
	 
 }
 </script>
    
<body>    

	<input type="hidden" id="pno" value=${pno }>
<section class="chatbox">
    <section class="chat-window">
      
      <c:if test="${fn:length(lists)==0 }">
      <article class="msg-container msg-remote" id="msg-0">
        <div class="msg-box">
          <div class="flr">
            <div class="messages">
              <p class="msg" id="msg-0">
               채팅내역이 없습니다.
              </p>
            </div>
          </div>
        </div>
      </article>
      
      </c:if> 
       <c:if test="${fn:length(lists)!=0 }">
				<c:forEach var="m" items="${lists }">
					<c:if test="${m.send_mno == mno }">
						<article class="msg-container msg-self" id="msg-0">
							<div class="msg-box">
								<div class="flr">
									<div class="messages">
										<p class="msg" id="msg-1">${m.content }</p>
									</div>
								</div>
							</div>
						</article>
					</c:if>

					<c:if test="${ m.send_mno != mno }">
						<article class="msg-container msg-remote" id="msg-0">
							<div class="msg-box">
								<div class="flr">
									<div class="messages">
										<p class="msg" id="msg-0">${m.content }</p>
									</div>
								</div>
							</div>
						</article>
					</c:if>
					
				</c:forEach>
			</c:if>
    </section>
    <form class="chat-input" onsubmit="return false;">
      <input type="text" autocomplete="on" placeholder="메세지 입력" id="sendmsg" value=""/>
      <button onclick="return sendm()">
             <svg style="width:24px;height:24px" viewBox="0 0 24 24"><path fill="rgba(0,0,0,.38)" d="M17,12L12,17V14H8V10H12V7L17,12M21,16.5C21,16.88 20.79,17.21 20.47,17.38L12.57,21.82C12.41,21.94 12.21,22 12,22C11.79,22 11.59,21.94 11.43,21.82L3.53,17.38C3.21,17.21 3,16.88 3,16.5V7.5C3,7.12 3.21,6.79 3.53,6.62L11.43,2.18C11.59,2.06 11.79,2 12,2C12.21,2 12.41,2.06 12.57,2.18L20.47,6.62C20.79,6.79 21,7.12 21,7.5V16.5M12,4.15L5,8.09V15.91L12,19.85L19,15.91V8.09L12,4.15Z" /></svg>
      </button>
    </form>
  </section>
  </body>