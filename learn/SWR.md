

### 1. SWR 이란?

swr 이란 원격데이터를 가져오기 위한 커스텀 훅 모듈로 원격 서버의 상태를 가져와서 리액트 컴포넌트에 넣어주는 기능을 제공한다.

```typescript
import useSWR from 'swr'

function ProductList() {
  const { data, error} = useSWR('/api/product', url => {
    return fetch(url).then(res => res.json())
  })
  
  if(!data) return <div>로딩 중...</div>
  if(error) return <div>에러 발생..!</div>
  
  return (
  	<>
    	{data.map(product => <ProductItem product={product}/>)}
    </>
  )
}
```

구성은 아래와 같다.

```typescript
const { data, eror, isValidating, mutate} = useSWR(key, fetcher, option)
```

**key** : url

**fetcher** : Promise를 반환하는 함수

**options**  {

​	**initialData**: loding 중일 때 보여질 초기 data

​	**revalidateOnMount** : component가 mount 될 때 재 실행 여부 boolean

​	**fetcher** : fetcher 함수

​	**revalidateOnFocus** : 다른 tab에서 다시 돌아와 focus 될 때 재 실행 여부 기본 값 = true

​	**revalidateOnReconnect** : network가 다시 연결되었을 때 재 실행 여부 기본 값 = true

​	**refreshInterval** : polling 주기 설정 기본값 = 0

​	**refreshWhenHidden** : focus가 없을 때에도 polling 여부 기본값 = false

​	**refreshWhenOffline** : offline 일 때에도 polling 여부 기본값 = false

​	**shouldRetryOnError** : fetcher error 발생 시 재 실행 여부 기본값 = true

​	**dedupingInterval** : 캐싱 시간(설정 시간 내에 같은 키로 또 요청이 발생하면 캐싱한 데이터 활용) 기본 값 = 2000

​	**focusThrottleInterval** :  일정 기간 동안 한 번만 재 실행 기본 값 = 5000

​	**loadingTimeout** : onLoadingSlow를 실행 시킬 제한시간 기본 값 = 3000

​	**suspense** : suspense 반응 모드 활성화 기본값 = false

​	**errorRetryInterval** : 에러 시 재시도 간격

​	**errorRetryCount** : 에러 시 최대 재시도 횟수

​	**onLoadingSlow(key , config)** : loadingTimeout 시간을 넘어설 경우 실행 될 callback

​	**onSuccess(data, key, config)** : 요청 성공 시 실행 될 callback

​	**onError(err, key, config)** : 에러 발생 시 실행 될 callback

}



### 2. Global Configuration

Child component 들에게 동일한 options를 부여할 수 있게 한다.

```typescript
function App () {
  return (
    <SWRConfig 
      value={{
        refreshInterval: 3000,
        fetcher: (resource, init) => fetch(resource, init).then(res => res.json())
      }}
    >
      <Dashboard />
    </SWRConfig>
  )
}
```



### 3. Mutation

동일한 key를 가진 전역의 모든 SWR을 revalidation 할 수 있다.

```typescript
import useSWR, { mutate } from 'swr'

function App () {
  return (
    <div>
      <Profile />
      <button onClick={() => {
        
        document.cookie = 'token=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;'

        
        mutate('/api/user', newData)
      }}>
        Logout
      </button>
    </div>
  )
}
```

```typescript
import useSWR from 'swr'

function ProductList() {
  const { data, error, mutate } = useSWR('/api/product', url => {
    return fetch(url).then(res => res.json())
  })
  
  if(!data) return <div>로딩 중...</div>
  if(error) return <div>에러 발생..!</div>
  
  return (
  	<>
    	{data.map(product => <ProductItem product={product}/>)}
													// 로컬 데이터를 즉시 업데이트 두번째 인수로 refetch 여부
			<button onClick={() => mutate({...data, product: newProducts}, false)}>click</button>
    </>
  )
}
```

