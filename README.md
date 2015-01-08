# Wants 프로젝트

루비 개발자 무료 구인구직 웹서비스

2014.12.31

* `Wants` 프로젝트 시작
* Devise, Simple_form, Awesomefont-sass, Bootstra-sass 젬 추가
* RSpec 테스트 환경 추가함.
* flash 메시지 표시하는 helper 작성함 -> application_helper.rb

회원가입후 사용가능

* 자체 인증구현
* 페이스북/링크인/카카오톡 가능
* My Page 기능
  * 인증정보 : 비밀번호 변경/분실
  * 나의경력정보(웹에디터로 작성), 공개여부


> **주요기능**

: 회원은 두가지 기능을 사용할 수 있다. 실제로 구직도 할 수 있고, 구인도 할 수 있다. 관련서적도 등록할 수 있게...

이 서비스의 구인구직 데이터는 `RORLAB 주간뉴스`에 광고한다.


### 0. 프로파일(Profile)

> 프로필 사진 업로드하기 : image

* 사용자실명 (real_name)
* 로그인명 (alias_name)
* 전화번호 (phone)
* 트위터 계정 (twitter)
* 페이스북 계정 (facebook)
* 링크인 계정 (linkedin)
* 개인홈페이지 (homepage)
* 희망연봉 (salary_require)
* 현재상태 (job_status)
  * IT 개발업체 재직중
  * 프리랜서
  * 타직종에 재직중
  * 취업 준비중
  * 기타 : 기술항목
* 프로그래밍 언어 dev_languages (Taglist)
  * C, C++, C#, Java, Python, Ruby, Object-C, Swift
  * .Net, Spring, Django, Ruby on Rails, Phalcon
* 개발경력
  * ?년차 개발자 : dev_duration
  * 웹개발 dev_web : boolean
  * 시스템 엔지니어링 : dev_system : boolean
  * 스마트디바이스 네이티브 앱개발 : dev_smart: boolean
* 개발프로잭트 상세  (dev_history)
* 커뮤니티 활동 (community_acitivy)
* 저서 (book_author)
* 번역서 (book_trans)
* 프로필 정보공개 (published)

### 1. 구인기능(Job)

등록할 항목

* 글제목
* 글내용
* 구인회사명
* 작성자
* 작성일자/변경일자
* 회사소개요약
* 회사소개 자세한 내용
* 구인기간 : 특정기간 명시 또는 상시채용
* 구인상세내용(웹에디터로 작성)
* 연락처


### 2. 구직기능(Worker)

등록할 항목
* title
* content

### 3. 구인/구직교섭(Engage) - polymorphic belongs to engagealble

등록한 항목

* 교섭자의 프로필 공유여부 shared_profile
* 글내용 content

### 4. 코멘트 (Comment) - polymorphic belongs to commentable

등록할 항목

* 글내용 (Content)


## 권한설정

* 회원가입 후 이메일 인증을 통해서 등록이 완료된다. 
* 본인이 작성한 구직신청 및 인터뷰요청 글은 자신과 원본글의 작성자만 볼 수 있다. 
* 개인 프로필정보는 공개/비공개 옵션으로 변경할 수 있다. 
* 본인 작성 일꺼리 및 일할사람 글에 대해서는 구직신청 및 인터뷰요청을 할 수 없다. 


## 기능구현

* 일꺼리 작성 (Job)
* 일할사람 작성 (Worker)
* 일꺼리 -> 구직신청(Engage)
* 일할사람 -> 인터뷰요청(Engage)
* 댓글 (Comment) - 모든 글에 댓글을 달 수 있도록 한다. 
* 개인프로필 작성(Profile)
* 개인프로필용 이미지 업로드(profile_image)
* Engage 객체가 하나라도 있으면 Job / Worker 객체를 삭제할 수 없다.
* Comment 객체가 하나라도 있으면 Engage 객체를 삭제할 수 없다. 
* /delayed_job 으로 접근하면 delayed_job 대시보드에 접근할 수 있다. 
* 자신이 작성한 글에 대한 알림 이메일을 발송한다. 
* 작성 중...

## ActiveJob with Delayed_Job
http://www.youtube.com/watch?v=gar02UTpy98


## Submit with XHR
http://stackoverflow.com/a/21607136
  