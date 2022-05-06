## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Append Argument

For given function type `Fn`, and any type `A` (any in this context means we don't restrict the type, and I don't have in mind any type 😉) create a generic type which will take `Fn` as the first argument, `A` as the second, and will produce function type `G` which will be the same as `Fn` but with appended argument `A` as a last one.

For example,

```typescript
type Fn = (a: number, b: string) => number

type Result = AppendArgument<Fn, boolean> 
// expected be (a: number, b: string, x: boolean) => number
```



```typescript
// try 1 K를 가져오고 싶은데 가져올 수가 없다.. 어떻게 arg를 가져올 수 있을까?
type AppendArgument<Fn extends (...arg: infer K) => any, A extends any> =  (...K, x: A) => ReturnType<Fn>


```

```typescript
// try 2  왜 K를 저기 그냥 풀고 싶은데 풀 수가 없을까...!

type AppendArgument<Fn extends (...arg: any[]) => any, A extends any> = Fn extends  (...args: infer K) => any ? (...K , x: A) => ReturnType<Fn> : never
```

```typescript
// try 3 args에 타입을 넣어주고 ...args 해서 해결 !
type AppendArgument<Fn extends (...arg: any[]) => any, A extends any> = Fn extends  (...args: infer K) => any ? (...arg: [...K, A]) => ReturnType<Fn> : never


/* _____________ Test Cases _____________ */
import type { Equal, Expect } from '@type-challenges/utils'

type Case1 = AppendArgument<(a: number, b: string) => number, boolean>
type Result1 = (a: number, b: string, x: boolean) => number

type Case2 = AppendArgument<() => void, undefined>
type Result2 = (x: undefined) => void

type cases = [
  Expect<Equal<Case1, Result1>>,
  Expect<Equal<Case2, Result2>>,
]
```

