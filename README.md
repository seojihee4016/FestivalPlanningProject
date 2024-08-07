# FestivalPlanningProject
축제 컨설팅 프로젝트

## 🖥️ 프로젝트 소개
- 2022년 1월 할로윈 축제를 즐기기 위해 서울 이태원에 많은 인파가 몰려 압사 사고가 발생한 적이 있습니다.
단순하게 축제에 관해서만 컨설팅 하는 것이 아닌 축제에 참여하는 사람들의 안전까지 고려하여, 행사 요원을 직접 고용하여 행사를 컨설팅하기 위해 프로젝트 주제를 선정하게 되었습니다.
- 🪅 PINATA 
피냐타란 미국 내 스페인어권 사회에서 아이들이 파티 때, 눈을 가리고 막대기로 쳐서 넘어뜨리는 장난감과 사탕이 가득 든 통을 의미합니다. PINATA를 두드리는 과정을 컨설팅을 하는 것이라고 의미를 부여했습니다. PINATA를 두드리면 나오는 사탕은 저희가 컨설팅한 축제의 결과물이며 PINATA를 가지고 노는 과정 자체를 저희 프로젝트의 주제이자 로고로 선정하게 되었습니다.

### ⏲ 개발 기간
- 23/06/14~ 23/07/04

### 👥 멤버 구성
- 서지희 - 축제 견적 신청 , 1대1 문의 게시판, 마이페이지
- 이홍재 - 개최 중인 지역 축제 API 분석
- 박진완 - 회원 가입, 로그인, ID 찾기, PW 찾기, 회원 탈퇴
- 유승아 - 스텝 모집, 관리자 페이지

### ⚙️ 개발 환경
- 'JAVA SE- 11'
- 'JDK 1.8.0'
- *Framework** : springframework(MVC: 5.2.24.RELEASE)
- *Database** : Oracle DB(ojdbc8): 23.2.0.0)
- *ORM** : Mybatis

## 📌 주요 기능
#### 회원 가입 / 로그인 / 회원 탈퇴/ 정보 수정 - <a href = "https://github.com/seojihee4016/FestivalPlanningProject/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(-%ED%9A%8C%EC%9B%90-%EA%B0%80%EC%9E%85,-%EB%A1%9C%EA%B7%B8%EC%9D%B8,--%EC%A0%95%EB%B3%B4-%EC%88%98%EC%A0%95,-%ED%9A%8C%EC%9B%90-%ED%83%88%ED%87%B4)" >상세보기 - WIKI 이동 <a/> 
- ID 중복 체크
- DB 값 검증
- 로그인 시 쿠키(Cookie) 및 세션(Session) 생성
- 비밀번호 일치 시, 회원 탈퇴
- 이메일, 전화번호, 비밀번호 수정 가능

#### 지역축제 확인 - <a href="https://github.com/seojihee4016/FestivalPlanningProject/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(%EA%B0%9C%EC%B5%9C-%EC%A7%80%EC%97%AD-%EC%B6%95%EC%A0%9C-api)">상세보기 - WIKI 이동 </a>
- 비회원 / 회원 모두 개최 중인 지역 축제 정보 확인 - API 연동

#### 견적 신청 - <a href="https://github.com/seojihee4016/FestivalPlanningProject/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(%EC%B6%95%EC%A0%9C-%EA%B2%AC%EC%A0%81-%EC%8B%A0%EC%B2%AD)">상세보기 - WIKI 이동</a>
- 로그인 시, 축제 견적 신청 폼 작성
- 수정 , 삭제 가능 (마이페이지와 연동)
- 리스트 페이지네이션 구현 
- 리스트 검색 기능 구현(키워드 , 페이징 유지)

#### 문의 게시판 - <a href="https://github.com/seojihee4016/FestivalPlanningProject/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(%EB%AC%B8%EC%9D%98-%EA%B2%8C%EC%8B%9C%ED%8C%90)">상세보기 - WIKI 이동</a>
- 로그인 완료 시 , 문의글 작성 가능
- 수정, 삭제 가능(마이페이지와 연동)
- 작성자와 세션 아이디가 같을 시 댓글 작성 가능 (작성자와 관리자)
- 댓글 수정, 삭제 가능
- 페이지네이션 구현

#### 배치도 작성 - <a href="https://github.com/seojihee4016/FestivalPlanningProject/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(%EB%B0%B0%EC%B9%98%EB%8F%84-%EC%9E%91%EC%84%B1)">상세보기 - WIKI 이동</a>
- 신청 견적서 주소로 배치도 작성(Selenium) 사용

#### 스텝 공고 / 관리자 페이지 - <a href="https://github.com/seojihee4016/FestivalPlanningProject/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C(%EC%8A%A4%ED%85%9D-%EB%AA%A8%EC%A7%91-%EA%B3%B5%EA%B3%A0-%EB%B0%8F-%EC%8B%A0%EC%B2%AD)">상세보기 - WIKI 이동</a>
- 관리자로 로그인 시, 축제 견적 신청서를 토대로 스텝 공고 업로드

