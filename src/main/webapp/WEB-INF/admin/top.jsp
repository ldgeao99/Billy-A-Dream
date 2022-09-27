<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="resources/admin_asset/img/favicon.ico" type="image/x-icon" />
  <title>Billy A Dream Admin</title>

  <!-- Required CSS -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;900&display=swap">
  <link rel="stylesheet" href="resources/admin_asset/css/simplebar.css">
  <link rel="stylesheet" href="resources/admin_asset/css/style.css">
  <link rel="stylesheet" href="resources/admin_asset/css/sidebar-dark.css" id="sidebar-theme"> <!-- available themes: dark, light, cyan, green, indigo, red -->

</head>

<body class="preloading">

  <!-- Wrapper -->
  <div id="wrapper" class="fixed-sidebar fixed-navbar">
    <!-- available options: fixed-sidebar, fixed-navbar, fixed-footer, mini-sidebar -->

    <!-- Sidebar -->
    <div class="offcanvas offcanvas-start navbar-dark text-nowrap" tabindex="-1" id="sidebar" aria-label="sidebar">

      <div class="offcanvas-header px-3">
        <a href="main.admin" class="logo nav-link px-0 d-flex align-items-center">
          <svg width="24" height="24" viewBox="0 0 90 90" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect width="90" height="90" rx="25" fill="#6366F1" />
            <path d="M63.312 29.16C63.568 29.64 63.712 30.072 63.744 30.456C63.808 30.84 63.84 31.4 63.84 32.136V58.776C63.84 60.984 63.232 62.28 62.016 62.664C61.408 62.856 60.64 62.952 59.712 62.952C58.784 62.952 58.048 62.872 57.504 62.712C56.96 62.552 56.544 62.36 56.256 62.136C55.968 61.912 55.744 61.592 55.584 61.176C55.424 60.632 55.344 59.8 55.344 58.68V42.6C54.544 43.592 53.376 45.176 51.84 47.352C50.304 49.496 49.328 50.84 48.912 51.384C48.496 51.928 48.208 52.312 48.048 52.536C47.888 52.728 47.488 53.016 46.848 53.4C46.24 53.752 45.568 53.928 44.832 53.928C44.128 53.928 43.472 53.768 42.864 53.448C42.288 53.096 41.872 52.76 41.616 52.44L41.232 51.912C40.592 51.112 39.328 49.416 37.44 46.824C35.552 44.2 34.528 42.792 34.368 42.6V58.776C34.368 59.512 34.336 60.072 34.272 60.456C34.24 60.808 34.096 61.208 33.84 61.656C33.36 62.52 32.112 62.952 30.096 62.952C28.144 62.952 26.928 62.52 26.448 61.656C26.192 61.208 26.032 60.792 25.968 60.408C25.936 60.024 25.92 59.448 25.92 58.68V32.04C25.92 31.304 25.936 30.76 25.968 30.408C26.032 30.024 26.192 29.592 26.448 29.112C26.928 28.28 28.176 27.864 30.192 27.864C31.056 27.864 31.792 27.976 32.4 28.2C33.04 28.392 33.456 28.6 33.648 28.824L33.936 29.112L44.832 43.416C50.272 36.216 53.904 31.464 55.728 29.16C56.272 28.296 57.552 27.864 59.568 27.864C61.616 27.864 62.864 28.296 63.312 29.16Z" fill="white" />
          </svg>
          <span class="h5 mb-0 text-reset ms-3">Welcome Admin</span>
        </a>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body px-2 py-3 h-100" data-simplebar>
        <ul class="navbar-nav mb-4" id="mainMenu">
          <li class="nav-label px-2 small mt-3"><small>MENU</small></li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3" href="main.admin">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
              </svg>
              <span>Dashboard</span>
            </a>
          </li>
         
          <li class="nav-label px-2 small mt-3"><small>카테고리</small></li>
           <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#advanced-components-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="advanced-components-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
              </svg>
              <span class="me-auto">대분류 카테고리</span>
            </a>
            <div class="ms-5 collapse" id="advanced-components-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="list.lcate">카테고리 조회/추가/삭제</a></li>
                <li class="nav-item"><a class="nav-link" href="update.lcate">카테고리 수정</a></li>
              </ul>
         	</div>
         	</li>
         	<li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#advanced-forms-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="advanced-forms-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
              </svg>
              <span class="me-auto">소분류 카테고리</span>
            </a>
            <div class="ms-5 collapse" id="advanced-forms-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="list.scate">카테고리 조회/추가/삭제</a></li>
                <li class="nav-item"><a class="nav-link" href="update.scate">카테고리 수정</a></li>
              </ul>
            </div>
          </li>
          
         
          <li class="nav-label px-2 small mt-3"><small>회원관리</small></li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#authentication-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="authentication-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
              </svg>
              <span class="me-auto">회원 관리</span>
            </a>
            <div class="ms-5 collapse" id="authentication-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="member.admin">회원 조회/이용 정지</a></li>
                <li class="nav-item"><a class="nav-link" href="memberReservationList.admin">예약 내역 관리</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#error-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="error-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
              <span class="me-auto">문의사항</span>
            </a>
            <div class="ms-5 collapse" id="error-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="contect.admin">문의사항 전체 조회</a></li>
                <li class="nav-item"><a class="nav-link" href="contectToReply.admin">문의사항 미답변 조회</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-label px-2 small mt-3"><small>이벤트</small></li>
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#content-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="content-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h18M3 14h18m-9-4v8m-7 0h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z" />
              </svg>
              <span class="me-auto">이벤트</span>
            </a>
            <div class="ms-5 collapse" id="content-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
               	<li class="nav-item"><a class="nav-link" href="list.evt">이벤트 목록</a></li>
                <li class="nav-item"><a class="nav-link" href="insert.evt">이벤트 추가</a></li>
              </ul>
            </div>
          </li>
         
          <li class="nav-item">
            <a class="nav-link px-2 d-flex align-items-center gap-3 dropdown-toggle" href="#forms-collapse" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="forms-collapse">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
              <span class="me-auto">쿠폰</span>
            </a>
            <div class="ms-5 collapse" id="forms-collapse" data-bs-parent="#mainMenu">
              <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="insertCoupon.admin">쿠폰 발급</a></li>
                <li class="nav-item"><a class="nav-link" href="coupon.admin">쿠폰 관리</a></li>
              </ul>
            </div>
          </li>
         
          
        </ul>
      </div>
    </div>
    <!-- /Sidebar -->
     <!-- Main -->
    <div id="main">

      <!-- Main header -->
      <div id="main-header">
        <nav class="navbar navbar-expand navbar-light bg-white gap-4">
          <button type="button" class="btn btn-light d-none d-xl-flex" data-toggle="mini-sidebar">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h6a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd" />
            </svg>
          </button>
          <button type="button" class="btn btn-light d-flex d-xl-none me-3" data-bs-toggle="offcanvas" data-bs-target="#sidebar" aria-controls="sidebar">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd" />
            </svg>
          </button>
          <ul class="navbar-nav align-items-center ms-auto">
            <li class="nav-item dropdown">
              <a href="#" class="nav-link dropdown-toggle no-caret" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                  <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd" />
                </svg>
              </a>
              <div class="dropdown-menu dropdown-menu-end p-3">
                
                <div class="dropdown-divider"></div>
                <h6 class="dropdown-header d-flex justify-content-between">
                  Short Cut:
                  <a href="javascript:void(0)" class="text-muted ms-5">Clear</a>
                </h6>
                <div class="max-h-[300px] overflow-auto">
                  <a class="dropdown-item" href="list.lcate">대분류 카테고리 조회</a>
                  <a class="dropdown-item" href="update.lcate">대분류 카테고리 수정</a>
                  <a class="dropdown-item" href="list.scate">소분류 카테고리 조회</a>
                  <a class="dropdown-item" href="update.scate">소분류 카테고리 수정</a>
                  <a class="dropdown-item" href="member.admin">회원 리스트</a>
                  <a class="dropdown-item" href="memberReservationList.admin">거래내역 조회</a>
                  <a class="dropdown-item" href="insertCoupon.admin">쿠폰 발급</a>
                  <a class="dropdown-item" href="coupon.admin">쿠폰 조회</a>
                  <a class="dropdown-item" href="contect.admin">문의사항 전체 조회</a>
                  <a class="dropdown-item" href="contectToReply.admin">문의사항 미답변 조회</a>
                  <a class="dropdown-item" href="javascript:void(0)">이벤트 조회</a>
                  <a class="dropdown-item" href="javascript:void(0)">이벤트 추가</a>
                </div>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a href="#" class="nav-link dropdown-toggle no-caret" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
                <div class="position-relative">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z" />
                  </svg>
                  <span class="badge bg-danger position-absolute top-0 start-100 translate-middle p-1">
                    <span class="visually-hidden">unread notifications</span>
                  </span>
                </div>
              </a>
              <div class="dropdown-menu dropdown-menu-end">
                <h6 class="dropdown-header d-flex justify-content-between">
                  5 New notifications
                  <a href="javascript:void(0)" class="text-muted ms-5">Clear</a>
                </h6>
                <div class="dropdown-divider"></div>
                <div class="max-h-[300px] overflow-auto">
                  <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="javascript:void(0)">
                    <svg class="text-muted" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                    </svg>
                    <div class="vstack">
                      <p class="mb-0">New customer registered</p>
                      <small class="text-muted">5 min ago</small>
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="javascript:void(0)">
                    <svg class="text-muted" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" />
                    </svg>
                    <div class="vstack">
                      <p class="mb-0">New order received</p>
                      <small class="text-muted">11 min ago</small>
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="javascript:void(0)">
                    <svg class="text-muted" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 4a2 2 0 114 0v1a1 1 0 001 1h3a1 1 0 011 1v3a1 1 0 01-1 1h-1a2 2 0 100 4h1a1 1 0 011 1v3a1 1 0 01-1 1h-3a1 1 0 01-1-1v-1a2 2 0 10-4 0v1a1 1 0 01-1 1H7a1 1 0 01-1-1v-3a1 1 0 00-1-1H4a2 2 0 110-4h1a1 1 0 001-1V7a1 1 0 011-1h3a1 1 0 001-1V4z" />
                    </svg>
                    <div class="vstack">
                      <p class="mb-0">Plugin updates available <span class="badge rounded-pill ms-1 bg-secondary align-bottom">3</span></p>
                      <small class="text-muted">30 min ago</small>
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="javascript:void(0)">
                    <svg class="text-muted" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
                    </svg>
                    <div class="vstack">
                      <p class="mb-0">Download completed</p>
                      <small class="text-muted">35 min ago</small>
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="javascript:void(0)">
                    <svg class="text-muted" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01" />
                    </svg>
                    <div class="vstack">
                      <p class="mb-0">Weekly usage report</p>
                      <small class="text-muted">40 min ago</small>
                    </div>
                  </a>
                </div>
              </div>
            </li>
            <li class="nav-item vr mx-3"></li>
            <li class="nav-item dropdown">
              <a href="#" class="nav-link dropdown-toggle no-caret py-0 pe-0" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="resources/admin_asset/img/user/user1.svg" width="32" alt="User" class="rounded-circle" loading="lazy">
              </a>
              <ul class="dropdown-menu dropdown-menu-end">
              	<li><a class="dropdown-item" href="/ex/">사용자 홈</a></li>
                <li><a class="dropdown-item" href="javascript:void(0)">Profile</a></li>
                <li><a class="dropdown-item" href="user-settings.html">Settings</a></li>
                <li>
                  <div class="dropdown-divider"></div>
                </li>
                <li><a class="dropdown-item" href="out.mb">로그아웃</a></li>
              </ul>
            </li>
          </ul>
        </nav>
      </div>
      <!-- /Main header -->
    </body>
</html>