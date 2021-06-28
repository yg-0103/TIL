### Intersection Observer

요소를 관찰할 수 있게 해준다.

스크롤 이벤트가 발생했을 때 내부에서 계속 getBoundingClientReat() 를 호출해 주는 것을 봤는데 리플로우를 발생시키기 때문에 성능 상으로 좋지 않을 것으로 판단해서 IntersectionObserver를 활용해 요소가 뷰포트에 진입했을 때만 한번 계산하는 것이 좋겠다고 생각해서 Intersection Observer의 제대로 몰랐던 개념을 다시 한 번 정리했다.

```jsx
const io = new IntersectionObserver(callback, options)
```

관찰 대상이 등록되거나 가시성에 변화가 생기면 callback을 호출한다.

callback은 entries와 observer 두개의 인수를 가진다. entries는 IntersectionObserverEntry의 배열이다

### IntersectionObserverEntry

**boundingClientRect**: getBoundingClientRect() 와 동일한 값을 얻을 수 있지만 리플로우를 발생시키지 않는다.

**intersectionRect**: 교차영역에 사각형 정보를 반환한다.

**intersectionRatio: 0 ~ 1 사이의 숫자를 반환하며 intersectionRect 영역과 boundingClientRect 영역의 비율을 의미한다.**

**rootBounds**: 루트요소의 사각형정보를 반환한다. rootMargin에 영향을 받으며 root옵션을 설정하지 않으면 null 이다.

### Options

**threshold**: 기본 값은 [0]이고 배열로 0 ~ 1까지 사이의 값으 여러게 넣어줄 수 있다.

ex) [0, 0.3, 1] 타겟의 가시성이 0%, 30%, 100%일 때 모두 옵저버가 실행된다.