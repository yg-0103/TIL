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



## Recoil API



### atom(options)

- key: atom을 식별하는데 사용되는 고유한 문자열
- default:  atom의 초깃값 또는 Promise 또는 동일한 타입의 값을 나타내는 다른 atom이나 selector



```react
const counter = atom({
  key: 'counter',
  default: 0,
})
```



### selector(options)

selector는 get 함수만 제공되면 읽기만 가능하지만 set 함수도 제공되면 읽고 변경할 수 있다.

- key: 고유한 문자열
- get:  파생된 값을 평가하는 함수.
  - get: 첫 번째 매개변수 객체에 포함된 속성으로 다른 atom이나 selector로 부터 값을 가져온다. 이 함수에 전달된 모든 atom과 selector는 의존성 목록에 추가된다.
- set?:  이 속성이 설정되면 selector는 쓰기 가능한 상태를 반환한다.
  - get: 다른 atom 이나 selector로부터 값을 가져온다. 이 함수에 주어진 atom이나 selector는 구독하지 않는다.
  - set: 다른 atom 상태의 값을 설정할 때 사용되는 함수 첫 번째 매개변수는 recoil 상태, 두번째 매개변수는 새로운 값이다

```react
const plusFiveCounter = selector({
  key: 'plusFiveCounter',
  get: ({ get }) => get(counter) + 5,
  set: ({ set }, newValue) => {
  	set(counter, newValue instanceof DefaultValue ? newValue : newValue * 2)
	}
})


function Counter() {
  const [count, setCount] = useRecoilState(plusFiveCounter)
  console.log(count) // 시작은 5 클릭 한번 할 때마다 15 35 ~~
  return <div onClick={() => setCount(count)}>{count}</div>
}
```

위와 같이 하게 되면 처음 count 는 0 에 5를 더한 5가 되고 클릭을 한번 할 때마다 newValue에 처음엔 5가 들어가 counter가 10으로 셋팅되고 두번 째 count는 15가 되고 클릭을 하게 되면 counter가 30이되고 count는 35가 된다



### useRecoilValueLoadable

Loadable 객체는 상태에 따라 사용가능한 값을 가지고 있거나 에러 상태이거나 비동기 진행 중일 수 있다.

- state: atom 혹은 selector의 최신 상태, 값은 hasValue, hasError, loading 중 하나다.
- contents:  hasValue 상태라면 실제 값, hasError 면 Error 객체, loading 이면 toPromise( )를 사용해여 Promise를 얻을 수 있다.



Loadable은 최신 상태에 접근하기 위한 메서드를 가지고 있다.

- getValue(): 현재 가지고 있는 값을 리턴 합니다. 아직 비동기 처리 중이라면 실행을 연기하거나 보류중인 상태를 전파하기 위해 리렌더링 합니다.
- toPromise(): selector가 resolve되면 resolve 될 Promise를 리턴합니다. 동기거나 이미 resolve 살태면 즉시 resolve되는 Promise를 리턴
- valueMaybe() : 가능하면 값을 리턴하며 아니면 undefined를 리턴
- valueOrThrow() : 가능하면 값을 리턴하며 아니면 Error를 던집니다.
- map(): Loadable의 값을 변형하기 위한 콜백을 받으며 새로운 Loadable을 변형된 상태와 함께 리턴한다.



```react
const asyncCounter = selector({
  key: 'asyncCounter',
  get: () => Promise.resolve(1)
})

function Counter() {
  const asyncCounter = useRecoilValueLoadable(asyncCounter)
  
  switch (asyncCounter.state) {
    case 'hasValue': 
      return <div>{asyncCounter.contents}</div>
    case 'loading': 
    	return <div>loading...</div>
    case 'hasError':
    	throw asyncCounter.contents;
  }
}
```



### useSetRecoilState(state)

쓰기 가능한 Recoil 상태 값을 업데이트하기 위한 setter함수를 리턴한다.

상태를 구독하지 않고 업데이트만 하려고 할때 사용한다. 컴포넌트를 구독하지 않고도 값을 설정할 수 있게 해준다.

```react
const counter = atom({
	key: 'counter',
  default: 0
})

function Button () {
  const setCounter = useSetRecoilState(counter)
  
  return <button onClick={() => setCounter((prev) => prev + 1)}> + </button>
}
```



### atomFamily(options)

- key: 유니크한 값

- default:  초기 값, 직접 값을 입력하거나 기본값을 나타내는 RecoilValue, Promise, 또는 기본값을 가져오는 함수다. 콜백 함수는 호출될 때 사용되는 매개변수의 복사값을 전달 받는다.



Atom Family는 atom의 모음을 이미한다. atomFilay를 호춯하면 전달한 매개변수에 따라 RecoilState를 제공하는 함수를 반환한다.

atomFamily는 단일 키만 제공하면, 각 기본 atom에 대한 고유한 키가 생성된다. atomFaily는 원시 타입, 배열,  객체, 원시 타입을 갖는 객체를 허용한다.

```React
const elementPositionStateFamily = atomFamily({
  key: 'ElementPosition',
  default: [0, 0],
})

function ElementListItem({ elementId }) {
  const position = useRecoilValue(elementPositionStateFamily(elementId))
  
  return (
  	<div>
    	Element: { elementID }
      Position { position }
    </div>
  )
}
```

각 요소에 분리된 atom을 갖게하는 이 패턴을 사용하면 모두 자체 개별 구독을 유지한다는 장점을 얻을 수 있다. 한 요소의 값을 업데이트하면 해당 atom을 구독하는 컴포넌트만 업데이트 된다.



### selectorFamily(options)

- key: 유니크한 값,
- get:  selector의 인터페이스와 동일
- set?: selector 인터페이스와 동일



selectorFmaily는 selector에 매개변수를 사용할 수 있게 한다.

```react
const counter = atom({
  key: 'counter',
  default: 1
})

const plusCounter = selectorFamaily({
  key: 'plusCounter',
  get: (count) => (get) => {
    return get(counter) + count
  }
  set: (count) => ({ set }, newValue) => {
  	set(counter, newValue + count)
	}
})

function Counter() {
  const count = useRecoilValue(counter)
  
  const plusCount = useRecoilValue(plusCounter(count))
  
  return <div>{plusCount}</div>
}
```

selectorFamily는 쿼리에 매개변수를 전달하는데 더 유용하다

```react
const post = selectorFamily({
  key: 'post',
  get: (postId) => async ({ get }) => {
    const { data: post } = await getPost(postId)
    return post
  }
})

function Post({ postId }) {
  const post = useRecoilValue(post(postId))
  
  return <div>{post}</div>
}
```



### waitForAll(dependencies)

여러 비동기를 동시에 평가할 수 있는 helper다.

Recoil state가 사용되는 모든 곳에서 사용할 수 있다.

```react
function FriendsInfo() {
  const [friendA, friendB] = useRecoilValue(waitForAll([friendAState, friendBState]))
  
  return (
    <div>
    	Friend A Name: { friendA.name }
      Friend B Name: { friendB.name }
    </div>
  )
}

const firendsInfoQuery = selector({
  key: 'FriendsInfoQuery',
  get: ({ get }) => {
    const { friendList } = get(currentUserInfoQuery)
    const friends = get(waitForAll(
    	friendList.map(friendId => userInfoQuery(friendId))
    ))
    return friends
  }
})


const customerInfoQuery = selectorFamily({
  key: 'customerInfoQuery',
  get: id => ({ get }) => {
    const { info, invoices, payments } = get(waitForAll({
      info: custormerInfoQuery(id),
      invoices: invoicesQuery(id),
      payments: paymentsQuery(id)
    }))
    
    return {
      name: info.name,
      transactions: [
        ...invoices,
        ...payments
      ]
    }
  }
})
```



### waitForNone(dependencies)

waitForNone은 waitForAll과 비슷하지만, 값을 직접 반환하는 대신 Loadable을 반환한다. 점진적 로딩을 할때 유용하다.



```react
function PostList({ postIds }) {
  const posts = useReCoilValue(waitForNone(postIds.map(postId => asyncPost(postId))))
  
  return (
  	<ul>
    	{posts.map((loadablePost) => {
        switch (loadablePost.state) {
          case 'hasValue':
            return <Post post={loadablePost.contents}/>
          case 'hasError':
          	return <Error>{loadablePost.contents}</Error>
          case 'loading':
          	return <Loading/>  
        }
      })}
    </ul>
  )
}
```



### useRecoilCallback(callback, deps)

이 hook은 useCallback과 비슷하지만 Recoil상태에서 callback이 동작하도록 API를 제공한다.

이 hook을 사용하는 이유

- atom 혹은 selector가 업데이트 될 때 리렌더링하기 위해 컴포넌트를 구독하지 않고 비동기적으로 Recoil 상태를 읽기 위해
- 렌더링 할 때에 수행하고 싶지 않은 비동기 동작에 대한 조회를 연기할 때
- Recoil 상태를 읽거나 쓰려는 경우 부수효과를 실행

---

- callback: 콜백은 현재 Recoil 상태를 비동기로 업데이 하기위해 대기한다.
- deps: 콜백을 메모하기 위한 선택적 의존성 모음

콜백 인터페이스

- snapshot: Recoil atom 상태의 읽을수 있게 해준다. atom값은 정적이지만 비동기 selector는 보류중이거나 resolve 될 수 있다.
- gotoSnapshot: 전역 상태를 제공된 Snapshot에 일치하도록 업데이트한다.
- set: atom 혹은 selector의 값을 설정한다.
- reset: atom 혹은 selector를 기본값으로 초기화한다.



상태 지연하여 읽기

```react
const itemsInCart = atom({
  key: 'itemsInCart',
  default: 0
})

function CartInfoDebug() {
  const logCartItems = useRecoilCallback(({ snapshot}) => async () => {
    const numItemInCart = await snapshot.getPromise(itemsInCart)
    console.log('Items in Cart: ', numItemInCart)
  })
  
  return (
  	<div>
    	<button onClick={logCartItems}>Log Cart Items</button>
    </div>
  )
}
```

