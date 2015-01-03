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
* 유저명 (alias_name)
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
