## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Parameters

Implement the built-in Parameters generic without using it.

```typescript
// try 1

type MyParameters<T extends (...args: any[] ) => any> = T extends (...args: infer K) => K ? K : never // 물음표 앞에 K에 빨간 줄이 가는데 아래는 통과한다 뭐지 ? 에러는 "Cannot find name 'K'"

/* _____________ Test Cases _____________ */
import { Equal, Expect, ExpectFalse, NotEqual } from '@type-challenges/utils'

const foo = (arg1: string, arg2: number): void => {}
const bar = (arg1: boolean, arg2: {a: 'A'}): void => {}
const baz = (): void => {}

type cases = [
  Expect<Equal<MyParameters<typeof foo>, [string, number]>>,
  Expect<Equal<MyParameters<typeof bar>, [boolean, {a: 'A'}]>>,
  Expect<Equal<MyParameters<typeof baz>, []>>,
]

```

```typescript
//try 2

type MyParameters<T extends (...args: any[] ) => any> = T extends (...args: infer K) => infer R ? K : never // 성공한다 하지만 R을 사용안했는데..?

/* _____________ Test Cases _____________ */
import { Equal, Expect, ExpectFalse, NotEqual } from '@type-challenges/utils'

const foo = (arg1: string, arg2: number): void => {}
const bar = (arg1: boolean, arg2: {a: 'A'}): void => {}
const baz = (): void => {}

type cases = [
  Expect<Equal<MyParameters<typeof foo>, [string, number]>>,
  Expect<Equal<MyParameters<typeof bar>, [boolean, {a: 'A'}]>>,
  Expect<Equal<MyParameters<typeof baz>, []>>,
]
```



