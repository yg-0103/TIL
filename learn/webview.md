## Web View 란 ?

앱안에 HTML iframe을 넣어 놓은 것,

웹 페이지를 보기위해서거나 앱 안에서 HTML을 호출하여 앱을 구현하는 하이브리드 형태의 앱을 개발하는데 많이 사용된다

- 하이브리드 앱: 앱의 기반이 되는 콘텐츠 영역은 HTML 기반의 웹 앱으로 제작, 최종 앱 배포에 필요한 패키징 처리만 아이폰, 안드로이드 플랫폼 안에서 처리한 어플리케이션

## 1. 줌 방지

```tsx
<meta name="viewport" 
	content="width=device-width, initial-scale=1, maximum-scale=1.0, minimum-scale=1, user-scalable=0"
```

- maximum-scale=1.0: 최대 줌인을 1배만큼
- minimum-scale=1.0: 최대 줌아웃을 1배만큼
- user-scalable=0: 유저가 줌을 할 수 없게 한다.

## 2. 버튼 touch시 나오는 음영 지우기

webview에서 버튼을 클릭하면 음영이 생긴다. 이것을 지워주는 것이 깔끔하다.

```tsx
* {
  -webkit-tap-highlight-color:rgba(255,255,255,0);
}
```

투명도를 0을 줘서 음영이 보이지 않게 한다. 색상을 바꾸면 의도한 색상으로 음영을 줄 수 있다.

## 3. select 안되게 하기

유저가 더블클릭 등으로 글자를 선택하는 것을 막는다.

```tsx
* {
	user-select: none;
}
```

## 4. link long touch 막기

a tag를 길게 터치할 경우 불필요한 정보를 유저에게 노출할 수 있기 때문에 방지를 해준다.

```tsx
* {
  -webkit-touch-callout: none;
}
```

## 5. over scroll시 흰 영역이나 background가 나오는 경우

모바일의 경우 스크롤이 끝까지 가도 스크롤이 더 진행 되었다가 원상복구가 되는 spring 같은 유저 경험을 제공한다. 이 때문에 의도치 않은 흰 배경을 보여주게 될 수 있다.

```tsx
<body style='background: gray;'>
</body>
```

위처럼 body에 색상을 주면 오버 스크롤링 되는 상황에서 지정한 배경 색상이 나온다.

제일 상단과 제일 하단이 보여줘야할 backgorund가 다를 경우 다음과 같이 설정하면 좋다.

```tsx
<style>
  .backgroundTop {
		position: fixed;
  	width: 100%;
  	height: 50%;
  	background: gray;
  	z-index: -10;
  	top: 0;    
  }
  .backgroundBottom {
		position: fixed;
  	width: 100%;
  	height: 50%;
  	background: yellow;
  	z-index: -10;
  	bottom: 0;
  }
</style>
<body>
  <div class='backgroundTop'></div>
  <div class='backgroundBottom'></div>
</body>
```

## 6. iphoneX 와 같이 화면이 Web 영역을 침범할 경우

아이폰 X의 경우 하단의 바가 겹치는 경우가 발생 할 수 있다.

```tsx
<meta name="viewport" content="viewport-fit=cover">
<style>
  .floating-button {
    padding-top: env(safe-area-inset-bottom);
  }
</style>
```

safe-area-inset의 기본 값이 있어 값을 수정해야 한다면 calc를 이용해 조절한다.

```tsx
padding-bottom: calc(env(safe-area-inset-bottom) - 5px); // IOS 11.0 이상 (신)
padding-bottom: calc(constant(safe-area-inset-button) - 5px); // IOS 11.0 버전 (구)
```
