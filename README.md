# :pushpin: Billy-A-Dream(개인간 렌탈 거래 플랫폼)

</br>

## 1. 제작 기간 & 참여 인원
- 22.09.12 ~ 22.09.30 (3주)
- 팀프로젝트(박찬호, 이대곤, 장정훈, 강전혁)

</br>

## 2. 사용 기술
  - Java
  - Spring, Spring Security
  - Gradle
  - AWS EC2, AWS RDS , Putty, FileZilla
  - Oracle
  - Tomcat
  - HTML, CSS, Javascript, Jsp, Bootstrap, jQuery

</br>

## 3. ERD 설계
![DB 테이블 구조](https://user-images.githubusercontent.com/106065178/207790738-20131029-2d6e-4dd8-95c7-ce60ef7710d9.png)

## 3.1 시퀀스 다이어그램
<p align="center">
  <img src="https://github.com/ldgeao99/Billy-A-Dream/blob/master/sequence%20diagram.PNG" width="550" height="450">
  </p>
  <br>


## 4. 핵심 기능
이 서비스의 핵심 기능은 개인간 결제 및 채팅입니다.  
사용자는 원하는 지역의 상품을 구매할 수 있고, 판매자와 채팅을 통해 원만한 거래를 할 수 있습니다.<br>
또한 여러 카카오API를 통한 이용과 보안서비스를 통해 사용자의 편의 및 신뢰를 추구하였습니다. 

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. IP확인
  <p align="center">
  <img src="https://user-images.githubusercontent.com/106065178/207794240-128e7b49-869d-4589-93b3-aa310beab9b1.png">
  </p>
  <br>
  
- 접속한 IP를 확인하여 회원가입 당시 등록된 IP와 다를 시 휴대폰 번호 인증을 통한 로그인을 하도록 하였습니다.
<br>
  
### 4.2. 비밀번호 암호화
  <p align="center">
  <img src="https://user-images.githubusercontent.com/106065178/207795103-2fa3b5da-4615-4288-a59b-51cea4fc987e.png" width="400" height="50">
  </p>
  <br>

- Spring Security를 활용하여 BCryptPasswordEncoder 라는 암호화를 사용하여 비밀번호를 암호화 저장하였습니다.
<br>
  
### 4.3. 휴대폰 & 이메일 인증
  <p align="center">
  <img src="https://user-images.githubusercontent.com/106065178/207797115-25ba4819-8617-477e-a81c-8a6c186fe43d.png" width="700" height="300">
  </p>
  <br>
  
- Twilio API 와 Naver Mail API를 활용하여 인증 체계를 구성하였습니다.

  <br>
  
### 4.4. 사용자 편의 지도 검색
  <p align="center">
  <img src="https://user-images.githubusercontent.com/106065178/207798202-ab4f3936-397a-46c9-94f9-42c44a7e823d.png" width="500" height="400">
  </p>
  <br>

- 카카오맵 API를 통한 사용자 편의 검색 기능 제공을 하였습니다.
  
<br>
  
### 4.5. 채팅 기능
  <p align="center">
  <img src="https://user-images.githubusercontent.com/106065178/207815703-37ceb3e3-afe4-4f77-add7-617eb4c2071b.png" width="650" height="300">
  </p>
  <br>

- Json 과 Ajax를 통한 채팅을 제공하여 판매자와 구매자 사이의 편의성과 신뢰성을 주었습니다.
<br> 
  
 ### 4.6. 카카오 결제 API
  <p align="center">
  <img src="https://user-images.githubusercontent.com/106065178/207840399-a151a287-1cae-4b61-8aa2-075c4bb682b1.png" width="650" height="300">
  </p>
  <br>

- 카카오 결제 API 를 통한 사용자 편의 시스템을 사용하였습니다.
  
<br>
  
   ### 4.7. 카카오 결제 API
  <p align="center">
  <img src="https://user-images.githubusercontent.com/106065178/207845517-2305d2d9-e18e-4edd-927d-c2ffc45bc106.png" width="300" height="300">
  </p>
  <br>

- 카카오톡 API 를 활용해 상담사와 빠른 상담을 할 수 있는 사용자 편의 시스템을 사용하였습니다.

</div>
</details>

</br>

## 5. 시연 영상
 <p align="center"><img src="https://user-images.githubusercontent.com/106065178/207815184-27af8994-b177-44a3-bb7e-4142ed600c0d.gif" width="600" height="300">
<br><a href="https://youtu.be/pJEr0ldINx4">[&nbsp;Youtube&nbsp;]</a><br><br>
</p>



## 6. 핵심 트러블 슈팅
### 6.1. literal does not match format string [데이터 타입이 맞지 않다는 의미]
- 모든 프로젝트를 마무리하고 로컬에서의 테스트를 문제없이 진행하고 AWS에 배포를 하여 테스트를 하는데 <br>
  배포할 때만 발생하는 문제를 발견하게 됐습니다.

- AWS의 EC2의 Unbuntu Lang은 UTF-8 형식을 사용하여 프로젝트에서 사용하는 ko_KR 형식과 달라 날짜 형식을 읽지 못하여 발생하는 문제였습니다.

- 이를 해결하기 위해 EC2에 맞는 형식으로 프로젝트의 sql문을 수정하였습니다.

<details>
<summary><b>기존 코드</b></summary>
<div markdown="1">
	
~~~java
 <select id="GetAllReservationOnlyDates" resultType="reservation.model.ReservationBean">
		select start_date,end_date
		from reservation 
		where product_no = #{pno}
 </select>
  
  <br>
  <insert id="InsertReservation">
	insert into reservation values(reservation_seq.nextval,#{product_no},#{buyer_no},#{start_date},#{end_date},0,sysdate,'1',#{amount},null)
  </insert>
~~~
	
</div>
</details>

<details>
<summary><b>개선된 코드</b></summary>
<div markdown="1">

~~~java

  <select id="GetAllReservationOnlyDates" resultType="reservation.model.ReservationBean">
		select TO_CHAR(start_date, 'YYYY-MM-DD') as start_date, TO_CHAR(end_date, 'YYYY-MM-DD') as end_date
		from reservation 
		where product_no = #{pno}
  </select>

  <insert id="InsertReservation">
	insert into reservation values(reservation_seq.nextval,#{product_no},#{buyer_no},to_date(#{start_date},'YY-MM-DD'),to_date(#{end_date},'YY-MM-DD'),0,sysdate,'1',#{amount},null)
  </insert>
~~~

</div>
</details>

</br>

## 7. 그 외 트러블 슈팅
<details>
<summary>git push/pull 시 한글 깨짐</summary>
<div markdown="1">

- Spring 설정에 UTF-8 설정이 안되어 있어서 한글이 깨지는 현상 
- <a href="https://java119.tistory.com/5">[&nbsp;해결 방법&nbsp;]</a>

</div>
</details>

<details>
<summary>AWS 재배포 시 이미지 삭제 문제</summary>
<div markdown="1">
  
  - 이미 업로드한 이미지들이 배포를 다시 하게 되면은 사라지는 현상이 발생
  - <a href="https://diagnostic-raven-02c.notion.site/remove-a0d4d336e6344f16b06d22425135e023">[&nbsp;해결 방법&nbsp;]</a>
  
</div>
</details>

<details>
<summary> MyBatis sql 부등호 인식 문제 </summary>
<div markdown="1">
  
  - XML 파일에 sql 문을 작성하게 되는데 < 부등호를 TAG로 인식하기 때문에 <br>
  **"The content of elements must consist of well-formed character data or markup."** 라는 에러가 발생
 -  <a href="https://dlgkstjq623.tistory.com/389">[&nbsp;해결 방법&nbsp;]</a>
  
</div>
</details>
    
<details>
<summary> Controller에서 RequestParam 사용시 주의할 점 </summary>
<div markdown="1">
  
 - Controller에서 RequestParam을 사용하여 변수를 받을 때 받아오는 변수가 존재하지 않으면 에러 발생
 
 - 받아오는 변수가 없을 때도 Controller가 작동되게 해야하기 때문에 아래와 같은 코드를 입력해주면 됩니다.
~~~java
	required = false  
~~~
	
   
</div>
</details>    

<details>
<summary> Redirect 에 변수를 보낼 시 한글 깨짐 현상 </summary>
<div markdown="1">
  
 - Controller에서 다음 Controller로 변수를 담아 Redirect 를 하게 되면 한글이 깨지는 현상 발생
 
 - UTF-8 형식으로 Encoder 한 다음에 보내주면 됩니다.
~~~java
	keyword = URLEncoder.encode(keyword, "UTF-8"); 
~~~
	
   
</div>
</details>  


    
</br>

## 8. 회고 / 느낀점
>프로젝트 개발 회고 :

- 로컬에서는 잘 실행되던게 배포하려고 우분투 환경에 올려 실행하니 문제가 생겨 마지막날 분주하게 움직였던 기억이 있습니다. 다음번엔 마지막 테스트를 위한 일정을 조금 더 널널히 잡아야 하겠습니다. 
- 팀 프로젝트를 진행하면서 모든 이가 하나라도 더 얻어갈 수 있도록 서로 돕고 지원하였습니다.
- 또한 팀프로젝트가 원할하게 진행될 수 있었던건 활기찬 분위기와 서로간의 의사소통이 중요하다고 생각합니다. 
