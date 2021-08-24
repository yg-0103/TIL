## RECOIL



React의 상태관리 기능에는 한계가 있다. 

- 컴포넌트의 상태를 상위로 끌어올려 공유할 수 있지만 그렇게 되면 전체적인 리렌더링이 일어나게 된다.
- 이렇게 되면 컴포넌트가 서로 의존성이 높아져 재사용성이 떨어지고 코드를 분할 하기가 어려워 진다.

이러한 문제로 여러가지 상태 관리 라이브러리들이 있다. 그 중 하나가 recoil 이다.



### recoil 특징

- 공유 상태를 react 내부상태처럼 간단하게 get/set 할 수 있도록 api를 제공한다.
- 동시성 모드를 비롯한 새로운 react 기능과 호환 가능성도 갖는다.
- 상태 정의는 분산되므로 코드 분할이 용이하다.
- 상태를 사용하는 컴포넌트를 수정하지 않고 파생된 데이터를 관리할 수 있다.





### 주요 개념

Recoil을 사용하면 atoms 에서 selectors를 거쳐 React 컴포넌트로 내려가는 data-flow를 만들 수 있다. Atoms는 컴포넌트가 구독할 수 있는 상태의 단위다.

Selectors는 atoms의 상태 값을 동기 또는 비동기 방식을 통해 변환해 새로운 상태를 만든다.



### 1. Atoms

Atoms는 상태의 단위이며 업데이트와 구독이 가능하다. atom이 업데이트 되면 그 상태를 구독하는 컴포넌트는 새로운 값을 반영해 리 렌더링 된다.

atoms는 런타임에서 생성될 수도 있다.

```typescript
const countState = atom({
  key: 'count',
  default: 0,
})
```

atom 함수를 사용해 생성하며 **key 값은 고유 해야한다.**

컴포넌트에서 atom을 사용하려면 3가지 방법이 있다.

```react
// 읽고 쓰기
function Counter() {
  const [count, setCount] = useRecoilState(countState);
  
  return <div>{count}</div>
}

// 읽기
function Counter() {
  const count = useRecoilValue(countState);
  
  return <div>{count}</div>
}

// 쓰기
function Counter() {
  const setCount = useSetRecoilState(countState);
  
  return <div>{count}</div>
}
```





### 2. Selectors

Selector는 atoms나 다른 selectors를 입력으로 받아들이는 순수 함수다. 참조하는 atoms 또는 selectors가 업데이트 되면 해당 selector 함수도 다시 실행된다.

컴포넌트는 selectors를 atoms 처럼 구독할 수 있다.

Selectors 는 보통 기존 상태를 기반으로 하는 파생 데이터를 계산하는 데 사용된다. 최소한의 상태만 atoms에 저장하고 다른 모든 파생되는 데이터는 selectors에 명시한 함수를 통해 계산 함으로써 쓸모없는 상태의 보존을 방지한다.

```react
const countToString = selector({
  key: 'countToString',
  get: ({ get }) => {
    const count = get(count);
    return count.toString()
  }
})
```

get 속성은 계산될 함수다. 전달되는 get 인자를 통해 atoms 나 다른 selectors에 접근할 수 있다. 이때 접근한 atoms 나 selectors에 자동으로 종속 관계가 생성되므로, 참조한 상태가 업데이트 되면 이 함수도 다시 실행된다.

selector함수에 set 프로퍼티가 없으면 자동으로 읽기만 가능한 상태가 되기 때문에 useRecoilState를 허용하지 않는다.

```react
function Counter() {
  const count = useRecoilValue(countToString);
  
  return <div>{count}</div>
}
```



### 3. RecoilRoot

recoil 상태를 사용하는 부모 트리에는 RecoilRoot가 있어야 하위 컴포넌트에서 상태를 공유할 수 있다.

```react
function App () {
  return ( 
  	<RecoilRoot>
      <Counter/>
  	</RecoilRoot>
  )
}
```





## Recoil 비동기 예제

```react
const postsState = selector({
  key: 'postsState',
  get: async ({ get }) => {
    const { data: posts } = await getPosts();
		return posts;
  }
})

function PostList() {
  const posts = useRecoilValue(postsState)
  
  retrun (
    <ul>
   	 {posts.map(post => <PostItem key={post.id} post={post}/>)}
    </ul>
  )
}
```

Recoil은 기본적으로 React.Suspense와 함께 동작하도록 디자인되어 있다. 

```react
function App() {
  return (
   <React.Suspense fallback={<div>loading ...</div>}>
    	<PostList/>
    </React.Suspense>
  )
}
```



### 에러 처리

요청에 에러가 있다면 ErrorBoundary로 잡을 수 있다.

```react
const postsState = selector({
  key: 'postsState',
  get: async ({ get }) => {
    try {
      const { data: posts } = await getPosts();
			return posts;
    } catch(e) {
      console.error(e)
      throw new Error()
    }
  }
})

function App() {
   return (
    <ErrorBoundary>
   		<React.Suspense fallback={<div>loading ...</div>}>
    		<PostList/>
    	</React.Suspense>
    </ErrorBoundary>
  )
}

```



### 매개변수가 필요한 경우

매개변수를 기반으로 쿼리를 하고싶을 때는 selectorFamily helper를 사용할 수 있다.

```react
const postState = selectorFamily({
  key: 'postState',
  get: (postId) => async () => {
    const post = await getPost(postId)
    return post
  }
})

function Post ({ postId }) {
  const post = useRecoilValue(postState(postId))
  
  return <div>{post}</div>
}
```

