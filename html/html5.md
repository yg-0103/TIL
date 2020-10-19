# TIL HTML

## 표준
1. HTML5(최신버전)
2. XHTML 1.0
3. HTML 4.01

## HTML5
- Hyper Text Markup Language (markup = 의미있는 태그들을 붙여주는 것)
- 명시적으로 컨텐츠의 구분을 해주는 태그들이 등장(header, section, aside,footer 등...)
- whatwg의 표준안을 w3c에서 수용하여 html5가 탄생했다. / whatwg = vender들이 만든 그룹, web application 1.0 과 web forms 2.0을 만들었다.
- web api가 등장했다. web api(javascript 기술을 조금 더 쉽게 사용할 수 있도록 웹 자체에서 다양한 api를 지원한다)

## HTML 구조잡기
- 구조적인 순서 생각하기 3단 HEADER, MAIN, FOOTER / 4단 HEADER, NAVIGATION, MAIN, FOOTER
- 논리 적인 순서를 생각하고 구조적인 순서가 아래쪽으로 진행되게 하고 화면에 표현되는 순서는 css로 잡아준다.
- Semantic한 태그를 사용하여 콘텐츠 구분을 한다.
- 역할에 맞는 class 이름을 사용한다.
- 필요할 경우 role 속성을 활용해 태그의 역할을 알려주어 웹접근성이 좋게 해준다.
- head 태그 내부에는 가능한 풍부하게 정보를 작성하여 SEO(검색최적화)에 좋게 해준다.
- head 태그에 title 태그에는 문서의 핵심키워드를 제목으로 정해준다.

### bem
1. __ : ~ 의 안에 ex) header__menu = header의 안에 menu
2. -- : ~ 의 상태 ex) btn--primary  
3. -  : 하나의 이름 ex) main-menu
