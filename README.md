# ReadMe.md

## Java 파일들
- AddDataFirstTime.java
	- 만들어진 데이터베이스 스키마에 맞게 더미 데이터들 입력
- CreateTable.java
	- 데이터베이스에 필요한 테이블들 생성
- DBConnection.java
	- 데이터베이스에 ID, PW 지정해서 Connection, Statement 객체 생성
	- Connection getConnection() : 연결 만든 Connection 객체 받기
	- Statement getStatement() : Statement 객체 받기
- InsertData.java
	- 데이터베이스에 데이터 넣을 때 쓰는 메소드들
- LogInOut.java
	- 로그인과 관련된 메소드
- PwdEncryption.java
	- 패스워드 암호화와 관련된 메소드 AES-128, ECB방식의 암호화 적용
	- String encrypt(String plainText) : 입력한 평문에 대하여 암호문 리턴. 평문의 길이가 16Byte 마다 암호문의 길이가 16Byte씩 늘어남(1~16Byte : 16byte, 17~32Byte : 32Byte)

## JSP 파일들
- calculation.jsp
	- 보정 값을 계산하여 팝업으로 출력하는 페이지
- delete_action.jsp
	- detail.jsp 페이지에서 삭제로 넘긴 데이터를 실제로 삭제하는 동작을 하는 페이지
- detail.jsp
	- 각 테이블의 상세정보를 볼 수 있는 페이지. 여기서 삭제, 수정 페이지로 넘어갈 수 있다.
- edit.jsp
	- detail.jsp에서 넘어온 수정 페이지. 각 어트리뷰트들의 값을 지정해서 edit_action.jsp로 넘겨준다.
- edit_action.jsp
	- edit.jsp에서 넘겨받은 값을 실제로 수정 동작을 하는 페이지
- error.jsp
	- 넘겨받은 에러 타입(404, 403, 505)에 따라서 해당하는 에러페이지를 보여줌
- header.jsp
	- 모든 페이지 위에 뜨는 부분, jsp include를 통해 모든 페이지에 포함 시켜준다. bootstrap을 통해 navigation bar를 구현했고, session 값을 가져와서 모든 페이지 마다 권한을 확인하여 보여줄 페이지와 숨길 페이지를 구분하여 보여준다.
- login.jsp
	- 로그인 form을 포함하고 있는 페이지 login_action.jsp로 보내서 유효성 검증을 한다.
- login_action.jsp
	- 실제 id, pw 정보를 DB로 보내서 유효한 값인지 검사해서 그 결과에 따른 동작을 한다.
- logout_action.jsp
	- 이 페이지로 넘어오면 session 값들을 invalidate 시켜주고 메인화면으로 redirect 해준다.	
- main.jsp
	- 특별한 기능은 없는 메인 페이지
- search.jsp
	- 각 테이블 마다 각 어트리뷰트 기준으로 검색기능을 담당하는 페이지. 만약 search_key값이 비어있다면 모든 데이터를 출력한다.
- signup.jsp
	- 각 테이블에 새로운 레코드를 추가해주는 페이지
- signup_action.jsp
	- signup.jsp에서 받은 데이터를 실제로 DB에 넣어주는 SQL문을 실행하는 페이지
- signup_admin.jsp
	- 관리자 등록을 실행하는 페이지
- simul_result.jsp
	- 시뮬레이션 결과에 따라 승리, 패배, 전멸, 무승부를 출력하는 페이지
- simulation.jsp
	- 모든 용사의 정보와 마물군단의 정보를 출력하고 다수의 용사의 정보와 하나의 마물군단을 선택하여 그 값을 simul_result.jsp로 보내는 페이지이다.
- statistics.jsp
	- 용사와 마물군단의 통계정보를 출력하는 페이지



# Yonsei DB Project 개발

## 개발 환경
- Java 9.0.1
- Eclipse IDE for Java EE Developers
- OJDBC8
- Apache Tomcat 9.0.14
- Oracle Database 18c Enterprise/Standard Editions
- Bootstrap 4

## 프로젝트
### 개요
- 대응 브라우저
	- Google Chrome
- 지원 해상도 : 1080p
- 버전 관리 :  #.#.# (Major.Minor.Build)

### 구조
- Java : 메소드나 데이터베이스 커넥션을 하는 라이브러리
- JSP : 각 HTML 페이지 구현, 받아온 데이터베이스에 대한 SQL문 작성, 그 결과에 따른 동작 구현

### Topic Description
#### 데이터베이스 명세
- 수 천명의 용사가 한꺼번에 출현했다. 그들의 신상정보(ID, PASSWORD, 이름, 나이, 출생지 등)와 함께 공격력, 방어력, 체력, 마력, 힘, 지능 등 기본적인 status를 관리하자.
- 용사는 여러 종족 중 한 종족에 속한다. 각 종족은 교유의 종족명으로 구분되며, 종족마다 공격력보정, 방어력보정, 체력보정, 마력보정, 힘보정, 지능보정 수치를 가진다. 이미 멸종한 종족에 대해서도 정보를 관리해야 한다.
- 왕국의 수장고에는 다양한 아이템들이 보관중에 있다. 아이템은 고유의 이름을 가지며 칼, 창, 활, 갑옷, 방패 중 한 종류에 속한다. 각 아이템은 공격력증가, 방어력증가, 힘증가, 지능증가의 효과를 가진다. 용사는 수장고의 아이템 중 여러 개의 아이템을 동시에 장착할 수 있으나, 용사들 간에 같은 아이템을 공유하지는 않는다.
- 신의 은총으로 용사에게는 스킬이 주어질 수 있다. 이때 신은 용사 한 명당 단 하나의 스킬만 내리고, 은총을 받은 용사가 죽기 전에는 동일한 스킬을 다른 용사에게 내리지 않는다. 스킬은 고유한 이름과 체력증가, 마력증가의 효과를 가진다.
- 적을 알아야 전쟁에서 이길 수 있다. 마물에 대해서도 데이터베이스를 구축하자. 마물은 군단 단위로 전략 행동을 한다. 각 마물 군단은 고유의 이름을 가지며, 병력수, 총공격력, 총방어력, 이동력, 사기(morale) 등의 수치값을 가진다.
- 마물 군단은 마물 장군의 지휘를 받는다. 마물 장군에 대해서는 이름, 나이, 군단공격력보정, 군단방어력보정, 군단이동력보정, 군단사기보정, 그리고 천적 종족 등의 정보를 관리해야 한다. 한 마물 군단을 여러 명의 장군이 지휘할 수 있으며, 한 장군이 여러 군단의 지휘관을 겸직할 수도 있다.

#### 기능 명세
- 데이터 검색 기능 (검색 결과를 테이블 형태로 표출)
	- 용사 정보 검색 기능
	- 스킬 정보 검색 기능
	- 종족 정보 검색 기능
	- 아이템 정보 검색 기능
	- 마물군단 정보 검색 기능
	- 마물장군 정보 검색 기능
- 상세 정보 표출 기능
	- 검색 결과에서 하나를 선택해서 클릭하면 상세 정보를 표출
	- 용사 정보의 경우, 초기 status와 보정 status를 나란히 함께 보여줌
		- 보정된 status 값을 클릭하면, 새 창을 pop-up 하여 계산 내용을 보여줌
	- 마물군단 정보의 경우, 초기 status와 보정 status를 나란히 함께 보여줌
		- 보정된 status 값을 클릭하면, 새 창을 pop-up 하여 계산 내용을 보여줌
	- 상세 정보에서 foreign key값에 해당하는 내용 클릭시, 해당 정보의 상세 정보 화면으로 이동

- Login/Logout
	- Administrator (adminID, password) 테이블을 따로 만들어서 ID/Password 관리
	- ID/password 입력 받아서 체크
	- Login후 모든 화면에 Logout 링크(혹은 버튼) 표출
	- Login후 session 정보 유지
	- (optional) Administrator 테이블에서 password를 암호화 해서 저장
- 데이터 검색/등록/수정/삭제 기능
	- 용사 정보 검색/등록/수정/삭제 기능
	- 스킬 정보 검색/등록/수정/삭제 기능
	- 종족 정보 검색/등록/수정/삭제 기능
	- 아이템 정보 검색/등록/수정/삭제 기능
	- 마물군단 정보 검색/등록/수정/삭제 기능
	- 마물장군 정보 검색/등록/수정/삭제 기능
	- (optional) 관리자 정보(Administrator 테이블) 검색/등록/수정/삭제 기능
	- (optional) 등록/수정 시 선택 가능한 데이터(foreign key에 대한 데이터)를 보여주고 선택할 수 있게 함

- 전체 데이터 통계 확인 기능 제공
	- 현재 용사 상황에 대한 통계 정보 제공 (총 수, 총 공격력, 종족별 현황 등)
	- 현재 마물군단 상황에 대한 통계 정보 제공 (총 수, 총 공격력, 총 이동력 등)
	- 세부 기능 및 UI는 자유롭게 설계해서 추가하면 extra 점수 있음
- 모의 전투 기능 제공
	- 여러 명의 용사와 하나의 마물군단을 선택하여 전투 결과를 시뮬레이션
	- 용사들의 공격력 총합이 마물군단의 총방어력을 넘으면 용사 승
	- 마물군단의 총공격력이 용사들의 방어력 총합을 넘으면 마물군단 승
	- 양쪽 모두 상대의 방어력을 못 넘으면 무승부
	- 양쪽 모두 상대의 방어력을 넘으면 전멸
	- 위와 같은 전투 결과에 대한 계산 내용을 보여주는 화면 표출
	- 세부 기능 및 UI는 자유롭게 설계해서 추가하면 extra 점수 있음
	- (optional) 선택한 마물군단을 지휘하는 마물장군과 천적인 용사의 경우 공격력 두 배, 방어력 두 배의 버프를 받음


## Coding 가이드
### 명명법
코드의 통일성을 갖추기 위함으로 아래와 같이 명명할 것을 권고한다.
1. Value, Function
- CamelCasing
```
public void encodeUrl() {
    String name = "";
}
```

2. Class, Protocol, Struct, Enum
- Pascal Casing
```
public enum ExamEnum {
    case one,
    case two
}
```
```
class PwdEncryption extends Crypto{
    struct ExamStruct {
    }
}
```

3. Constant
- GNU Naming Convention + UnderBar
```
static String ID_TEST_MAIN = "idTestMain"
```
