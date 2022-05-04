## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Awaited

If we have a type which is wrapped type like Promise. How we can get a type which is inside the wrapped type? For example if we have `Promise<ExampleType>` how to get ExampleType?

```typescript
// try 1

type MyAwaited<T> = T extends Promise<infer U> ? U : never 

import { Equal, Expect } from '@type-challenges/utils'

type X = Promise<string>
type Y = Promise<{ field: number }>
type Z = Promise<Promise<string | number>> // 이 부분에서 문제가 생긴다 한꺼풀더 어떻게 벗겨낼까?

type cases = [
  Expect<Equal<MyAwaited<X>, string>>,
  Expect<Equal<MyAwaited<Y>, { field: number }>>,
  Expect<Equal<MyAwaited<Z>, string | number>>,
```

```typescript
// try 2
// Promise를 어떻게 하면 한겹 더 벗겨줄 수 있을까 ? 아래와 같이하니 일단은 성공 하지만 아래 ts-expect-error 가 빨개진다..

type MyAwaited<T> = T extends Promise<infer U> ? U extends Promise<infer K> ? K : U : never

type X = Promise<string>
type Y = Promise<{ field: number }>
type Z = Promise<Promise<string | number>> 

type cases = [
  Expect<Equal<MyAwaited<X>, string>>,
  Expect<Equal<MyAwaited<Y>, { field: number }>>,
  Expect<Equal<MyAwaited<Z>, string | number>>,
  
@ts-expect-error //
type error = MyAwaited<number>
  
// try 3
// T 의 타입을 잡아주니 빨개지는 부분은 사라짐, 하지만 더 깊어 질 경우 어떻게 해야될지...
type MyAwaited<T extends Promise<any>> = T extends Promise<infer U> ? U extends Promise<infer K> ? K : U : never
```

```typescript
// solution
// type에도 재귀를 사용할 수 있었구나.. 그리고 무슨타입이 올지 모를 때는 any 보단 unknown이 좋아보인다.
type MyAwaited<T extends Promise<unknown>> = T extends Promise<infer U> ? U extends Promise<unknown> ?  MyAwaited<U>: U : never
```

