# PeTwoGether_Spring
펫 케어 서비스 웹 사이트 프로젝트 PeTwoGether(Spring 구현 부분) Java11, STS3, Oracle, JSP

추가적으로 테이블 정의서 및 쿼리문 정의서 파일 내 쿼리를 통해 DB 구축

관리자, 펫 시터, 일반회원으로 역할을 분리하여 각 기능을 구현

1. 전문 펫시터에게 가능한 날짜 및 시간에 돌봄 신청
2. 해당 돌봄 기간동안의 특이사항을 기록한 돌봄 일지 작성 및 조회 
3. 펫시터의 정보 및 후기 기능
4. 유기동물 입양 및 잃어버린 반려동물 찾기 기능
5. 전문가에게 질문 기능 및 답변 작성 

개요
- 전문 펫시터들한테 믿고 반려동물을 맡길 수 있다,입양 가능한 유기동물들을 조회하고 입양할 수 있으며 잃어버린 반려동물을 찾는 게시물을 작성할 수 있다
- 펫 시터의 모든 기능 및 일반회원의 일부 기능(돌봄 일지 조회, 후기 작성, 돌봄 신청)만 구현함, 나머지는 Spring Boot에서 구현

Language
- Java 11
- JavaScript
- SQL/PL
  
Development tool
- Oracle SQL Developer
- STS3
 
Skills
- JSP + Servelt
- jQuery
- Ajax
- OpenAPI
- Mybatis

프로젝트 참여 인원
- 팀장: 임동균
- 팀원: 5명
 
개발 기간
- 2023.01.16 ~ 2023.01.25

ERD
![image](https://github.com/io030/PeTwoGether_Spring/assets/114460492/707d6afa-2453-48a7-b3ed-4e35860d402c)

|담당 기능|내용|
|:--|---|
|돌봄 후기 추천|프로젝트 메인 홈페이지에서 이용자들이 작성한 후기를 목록으로 출력하여 추천한다. 클릭 시 해당 후기로 이동하여 조회할 수 있다.|
|돌봄 후기 게시판|이용자가 돌봄 서비스받은 후 해당 서비스에 대한 후기를 작성할 수 있는 게시판이다. 어떤 서비스에 후기를 작성할지 선택할 수 있으며 평점과 사진까지 입력할 수 있다. 추가로 검색 기능을 사용할 수 있다|

<details>
    <summary>구현기능 화면</summary>

![image](https://github.com/io030/PeTwoGether_Spring/assets/114460492/624507d2-acc2-4445-8a08-1892395eb9b3)

![image](https://github.com/io030/PeTwoGether_Spring/assets/114460492/33bc00ba-b5cd-4854-ac8a-44ce2fe282ed)

![image](https://github.com/io030/PeTwoGether_Spring/assets/114460492/5f090227-4897-4e42-8ea4-37affefb50d3)

![image](https://github.com/io030/PeTwoGether_Spring/assets/114460492/91fb998b-5271-4c68-87ce-e40376ae3e7c)

</details>

