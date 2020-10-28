# TIL

## float

float은 요소를 좌우 방향으로 띄워주는 속성이다.
값으로는 왼쪽으로 띄워주는 **left**오른쪽으로 띄워주는 **right**가 있다.
요소를 띄운 상태에서 새로운 요소를 만들게 되면 요소가 겹치는 현상이 발생해
float 속성을 해제해 주어야 하는데, 보통 다음과 같은 형식을 보편적으로 많이 사용한다.

``` html
<div class="container clearfix">
  <div class="box"></div>
  <div class="box"></div>
</div>
```
``` css
.clearfix::after {
  content: "";
  clear: both;
  display: block;
}
.box {
  float: left
}
```
또 다른 특징은 float 속성이 추가된 요소는 display 속성의 값이 대부분 block으로 바뀐다.

## position

position은 요소의 위치를 지정할 수 있게 해준다.
속성의 값
- **relative**: 요소를 자기 자신을 기준으로 배치한다. 원래 자기가 있던 위치가 계속 유지된다.
- **absolute**: 요소를 위치상 부모 요소를 기준으로 배치한다. 배치하려고 하는 부모 요소에 position 값이 **static**(기본값)이 아니어야 한다. 보통 **relative**
- **fixed**: 요소를 viewport 기준으로 배치한다.
- **sticky**: 요소를 스크롤 영역 기준으로 배치한다. 부모 요소를 넘어 갈순 없다.

값이 정해진 상태에서는 top, bottom, left, right로 위치를 지정할 수 있다.
**absolute**나 **fixed** 값이 적용된 요소는 대부분 display 속성의 값이 block으로 바뀐다.