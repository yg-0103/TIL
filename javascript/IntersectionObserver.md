### Intersection Observer

요소를 관찰할 수 있게 해준다.

스크롤 이벤트가 발생했을 때 내부에서 계속 getBoundingClientReat() 를 호출해 주는 것을 봤는데 리플로우를 발생시키기 때문에 성능 상으로 좋지 않을 것으로 판단해서 IntersectionObserver를 활용해 요소가 뷰포트에 진입했을 때만 한번 계산하는 것이 좋겠다고 생각해서 좀 더 자세히 공부를 해보았다.

```jsx
const io = new IntersectionObserver(callback, options)
```

관찰 대상이 등록되거나 브라우저 뷰포트와 관찰 대상이 교차하면 callback을 호출한다.

callback은 entries와 observer 두개의 인수를 가진다. entries는 IntersectionObserverEntry의 배열이다

IntersectionObserverEntry에 boundingClientRect는 getBoundingClientRect() 와 동일한 값을 얻을 수 있지만 리플로우를 발생시키지 않는다.

intersectionRect 는 교차영역에 사각형 정보를 반환한다.

**intersectionRatio 는 0 ~ 1 사이의 숫자를 반환하며 intersectionRect 영역과 boundingClientRect 영역의 비율을 의미한다.**

observer는 콜백이  실행되는 해당 인스턴스를 참조한다.

