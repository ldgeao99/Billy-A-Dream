<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="resources/admin_asset/img/favicon.ico" type="image/x-icon" />
  <title>Billy A Dream</title>

  <!-- Required CSS -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;900&display=swap">
  <link rel="stylesheet" href="resources/admin_asset/css/simplebar.css">
  <link rel="stylesheet" href="resources/admin_asset/css/style.css">
  <link rel="stylesheet" href="resources/admin_asset/css/sidebar-dark.css" id="sidebar-theme"> <!-- available themes: dark, light, cyan, green, indigo, red -->

</head>
<style>
/* .simplebar-content{
	display: none;
} */
</style>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script>
 
 
 $(function(){
	 
 $.ajax({
	 	type : 'post',
		url : "allchatting.mb",
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data) {
			var roomlist = data.split("|");
			for(var i=0 in roomlist){
				var roomlists = roomlist[i].split(",");
				alert(roomlists[4]);
				$('.simplebar-content').append(
						'<div class="card collapse chat-collapse show"> <div class="card-header d-flex align-items-center gap-3">'+
						' <button type="button" aria-label="Close" class="btn-close flex-shrink-0 d-lg-none shadow-none" data-toggle="inner-sidebar-expand"></button></div>'+
			              '<div class="card-body navbar-light px-0" data-simplebar>'+
			                '<div class="navbar-nav">'+
			                  '<a href="javascript:void(0)" class="nav-link d-flex align-items-center px-3 gap-3">'+
			                    '<div class="position-relative">'+
			                      '<img src="<%=request.getContextPath()%>/resources/'+roomlists[4]+'" alt="User" width="38" height="38" class="rounded-circle" loading="lazy">'+
			                    '</div>'+
			                    '<div class="vstack position-relative overflow-hidden">'+
			                      '<p class="mb-0 small text-truncate">'+roomlists[2]+'</p>'+
			                      '<p class="mb-0 small text-truncate fw-bold text-dark"></p>'+
			                    '</div>'+
			                  '</a>'+
			                '</div>'+
			              '</div>'+
			            '</div>'); 
			}
			//append 사용
		},//success 
		error : function(){
			alert("에러");
		}

	});//ajax
 })
 </script>
<body class="preloading">

  <!-- Wrapper -->
  <div id="wrapper" class="fixed-sidebar fixed-navbar">

    <!-- Main -->
    <div id="main">

      <!-- Main body -->
      <div id="main-body">

        <div id="inner-wrapper">
          <div id="inner-sidebar" class="w-100 chat-sidebar">

            <!-- Chat list -->
            <div class="card collapse chat-collapse show">
              <div class="card-header d-flex align-items-center gap-3">
                <button type="button" aria-label="Close" class="btn-close flex-shrink-0 d-lg-none shadow-none" data-toggle="inner-sidebar-expand"></button>
              </div>
              <div class="card-body navbar-light px-0" data-simplebar>
                <div class="navbar-nav">
                  <a href="javascript:void(0)" class="nav-link d-flex align-items-center px-3 gap-3">
                    <div class="vstack position-relative overflow-hidden">
                      <p class="mb-0 small text-truncate"></p>
                      <p class="mb-0 small text-truncate fw-bold text-dark"></p>
                    </div>
                  </a>
                 
                </div>
              </div>
            </div>
            <!-- /Chat list -->

          </div>
          <div id="inner-main">
            <div class="card">
              <div class="card-header d-flex align-items-center gap-3">
                <button class="btn link-secondary px-0 d-lg-none shadow-none" type="button" data-toggle="inner-sidebar-expand">
                  <svg width="16" height="16" viewBox="0 0 16 16" stroke="currentColor" stroke-width="2">
                    <line x1="0" x2="16" y1="3" y2="3"></line>
                    <line x1="0" x2="16" y1="8" y2="8"></line>
                    <line x1="0" x2="16" y1="13" y2="13"></line>
                  </svg>
                </button>
                <div class="position-relative">
                  <img src="resources/admin_asset/img/user/user2.svg" alt="User" width="36" height="36" class="rounded-circle" loading="lazy">
                  <span class="position-absolute bottom-0 end-0 badge border border-white rounded-circle bg-success p-1"><span class="visually-hidden">online</span></span>
                </div>
                <div class="vstack position-relative overflow-hidden small">
                </div>
                <div class="dropdown ms-auto">
                  <button class="btn link-secondary px-0 dropdown-toggle no-caret d-flex shadow-none" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                      <path d="M10 6a2 2 0 110-4 2 2 0 010 4zM10 12a2 2 0 110-4 2 2 0 010 4zM10 18a2 2 0 110-4 2 2 0 010 4z" />
                    </svg>
                  </button>
                  <ul class="dropdown-menu dropdown-menu-end small">
                    <li>
                      <button class="dropdown-item d-flex align-items-center gap-2 text-danger" type="button">
                        <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                        </svg>
                       대화방 나가기
                      </button>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="card-body chat-body py-0" data-simplebar>
                <div class="popover bs-popover-start">
                  <div class="popover-body">
                    오른쪽 내가 보내는 내용
                    <time>시간</time>
                  </div>
                </div>
                <div class="popover bs-popover-end">
                  <div class="popover-body">
                   왼쪽 상대방 내용
                    <time>시간</time>
                  </div>
                </div>
              </div>
              <div class="card-footer chat-footer px-0">
                <form>
                  <div class="input-group">
                    &nbsp;&nbsp;&nbsp;<textarea class="form-control autosize px-0 border-0 shadow-none" rows="1" placeholder="Write a message..."></textarea>
                    <button class="btn link-secondary d-flex shadow-none" type="button">
                      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                        <path fill-rule="evenodd" d="M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd" />
                      </svg>
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /Main body -->

    </div>
    <!-- /Main -->

  </div>
  <!-- /Wrapper -->

  <!-- Required JS -->
  <script src="resources/admin_asset/vendor/bootstrap/bootstrap.bundle.js"></script>
  <script src="resources/admin_asset/vendor/simplebar/simplebar.js"></script>
  <script src="resources/admin_asset/js/script.js"></script>

  <script src="resources/admin_asset/js/settings.js"></script>

  <script src="resources/admin_asset/vendor/autosize/autosize.js"></script>
  <script>
    /* // Scroll to bottom
    function scrollChatToBottom() {
      let conversationBody = document.querySelector('.chat-body .simplebar-content-wrapper')
      conversationBody.scrollTop = conversationBody.scrollHeight - conversationBody.clientHeight
    }
    setTimeout(() => {
      scrollChatToBottom()
    }, 0);

    // Chat attachment
    document.querySelector('.chat-footer input[type="file"]').addEventListener('change', function() {
      const fileLength = this.files.length
      const attachIcon = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
  <path fill-rule="evenodd" d="M8 4a3 3 0 00-3 3v4a5 5 0 0010 0V7a1 1 0 112 0v4a7 7 0 11-14 0V7a5 5 0 0110 0v4a3 3 0 11-6 0V7a1 1 0 012 0v4a1 1 0 102 0V7a3 3 0 00-3-3z" clip-rule="evenodd"/>
</svg>`
      const filename = fileLength ? (fileLength > 1 ? `${fileLength} files` : '1 file') : attachIcon
      const btn = this.parentElement
      btn.querySelector('svg') && btn.querySelector('svg').remove()
      btn.querySelector('span') && btn.querySelector('span').remove()
      btn.insertAdjacentHTML('beforeend', fileLength ? `<span>${filename}</span>` : filename)
    })

    // Autosize textarea
    autosize(document.querySelectorAll('textarea.autosize')) */
  </script>
</body>

</html>