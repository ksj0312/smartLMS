# :mortar_board:  SmartLMS
<br>

## :blush: 프로젝트 소개 
학습 관리 시스템(LMS, Learning Management System)으로 교육 또는 학습을 관리하는 데 필요한 프레임워크를 제공합니다.

<br><br>

## :date: 개발 기간
- 2024.09.10 ~ 2024.10.07
- 인원 : 3명
<br><br><br>

## :bulb: 주요 기능
#### 공통 기능
- __로그인__
- 아이디 찾기, 비밀번호 찾기
- 내 정보 조회, 수정
- 공지사항, 학사일정, Q&A 조회
- 게시글 댓글 작성
- __교수진 조회__
- 메뉴얼 조회
- 쪽지 발신, 수신, 검색 
#### 교수 기능
- __수강생 리스트 조회__
- __출석 등록, 수정__
- __성적 등록, 수정__
- __시험 등록, 수정__
- 과제 등록, 수정
- 제출 과제 조회
#### 관리자 기능
- __학생, 교수 아이디 생성__
- __강의 등록__
- __수강생 목록 조회__
- __학생, 교수 리스트 조회, 상세 조회__
- 공지사항 작성, 수정, 삭제
- Q&A 수정, 삭제, 답글
- 학사일정 추가, 수정, 삭제
#### 학생 기능
- 수강 과목 조회
- 시험, 과제 리스트 조회
- 과제 제출
- 시험, 과제 성적 조회
- 작성한 글 조회, 수정

<br><br>

## :wrench: 사용 기술
- Spring Framework
- maven
- Java
- Maria DB
- mybatis
- Apache Tomcat
- HTML
- JavaScript
- Css
- jQuery
- Ajax
- kakaomapAPI

<br><br><br>
## :movie_camera: 프로젝트 결과
<br>


### :school: 메인 화면

<br><br><br><br>
### :blossom: 로그인

-학생 로그인 페이지와 관리자, 교수 로그인 페이지를 분리
-학생 로그인 시 메인페이지로, 관리자, 교수 로그인 시 관리자 페이지로 이동

<br>

![관리자로그인](https://github.com/user-attachments/assets/03a9a7ad-6f2c-4d5d-aa77-0ccb352ecffc)
![학생로그인](https://github.com/user-attachments/assets/8bb98de3-9d45-4f83-91e6-f55b81705e26)

<br><br><br><br>

### :necktie: 교수진 조회

- 메인 페이지에서 교수진 소개 페이지를 조회, 검색, 페이징

<br>

![교수소개](https://github.com/user-attachments/assets/05ec1505-3a16-4b23-be62-c03f6a58b706)

<br><br><br><br>
### :page_with_curl: 관리자 : 학생, 교수 아이디 생성 

- 학생과 교수, 관리자 아이디 생성은 poi 라이브러리를 사용하여 엑셀 파일 다운로드 , 업로드로 구현
<br>

![엑셀파일 다운로드 gif](https://github.com/user-attachments/assets/58fa6d8a-9ee0-4537-83c1-0b8c9e7a5163)
![학생업로드 2](https://github.com/user-attachments/assets/077540f5-be12-4e37-a488-dad034485f74)
![학생 업로드 3](https://github.com/user-attachments/assets/a3bafddf-d517-46c1-8546-1febb8c18a7c)

<br><br><br><br>

### :clipboard: 관리자 : 학생, 교수 정보 조회

- 학생, 교수의 정보를 조회, 검색, 페이징
<br>

![학생목록, 검색 gif](https://github.com/user-attachments/assets/f5d26769-21b2-4042-894e-6e454f019e7b)
![학생 목록 (페이징) gif](https://github.com/user-attachments/assets/27b94c14-6c9f-4548-bf2e-fd66af762768)

<br><br><br><br>

### :raising_hand: 교수 : 출석 등록, 수정

- 해당 강의 출석 등록, 출석 수정
<br>

![출석부 등록 gif](https://github.com/user-attachments/assets/bc0181b5-c044-42c3-b787-c90040175ad4)
![출석 변경 gif](https://github.com/user-attachments/assets/087e1d51-7bc8-4ec4-b6fb-b683d10f620b)

<br><br><br><br>
### :100: 교수 : 성적 등록, 조회, 수정 

- 성적 입력 시 상대평가로 등급이 자동으로 부여
<br>

![성적 등록, 등급 확인 gif 1](https://github.com/user-attachments/assets/800cfa82-5364-42fa-bb72-ed6569ece98e)
![성적 등록, 등급 확인 gif 2](https://github.com/user-attachments/assets/715dd83e-045b-4c85-bd09-5b8245d16c5d)

- 점수 수정 시 전체 수강생들의 등급 변경
<br>

https://github.com/user-attachments/assets/6d2c0c0c-9f62-4a80-a02b-cd218e57a246

- 성적 입력이 완료된 시험 리스트는 성적 등록 페이지에서 조회 불가
<br>

![성적등록 완료 시 리스트에 보이지않음 gif](https://github.com/user-attachments/assets/86cdbc3e-4d85-4160-966c-3a8d20e62a8f)



<br><br><br><br>
### :black_nib: 교수 : 시험 등록, 조회, 수정
- 시험 등록, 수정이 가능
- 성적 등록 시 성적등록 여부가 자동으로 변경 

<br>

![시험 등록 gif](https://github.com/user-attachments/assets/9d21ea51-eb1b-46ad-aee4-f43f4af79cdc)
![시험 목록, 상세보기 gif](https://github.com/user-attachments/assets/8be5feb5-a911-4149-8226-cece2286b99f)

<br><br><br><br>
### :books: 강의 등록, 조회, 수정

- 강의 등록, 조회, 수정이 가능
<br>

![강의 등록 gif 2](https://github.com/user-attachments/assets/ee432f0b-da0c-4ff9-b09e-0cffe16df110)

https://github.com/user-attachments/assets/76b01a20-233c-4357-9c1d-a7cda6badb28


<br><br><br><br>

### :bowtie: 수강생 조회

- 수강생 목록, 상세정보, 출결 상태를 조회
<br>

![수강생 목록, 검색 gif](https://github.com/user-attachments/assets/7b93a6db-935d-4b77-bdb0-c74f86d0a23e)

<br><br><br><br>

