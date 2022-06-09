## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### AnyOf

Implement Python liked `any` function in the type system. A type takes the Array and returns `true` if any element of the Array is true. If the Array is empty, return `false`.

For example:

```typescript
type Sample1 = AnyOf<[1, '', false, [], {}]> // expected to be true.
type Sample2 = AnyOf<[0, '', false, [], {}]> // expected to be false.
```

```typescript
// try 1 간단하게 해봤지만 객체, 배열이 문제 인 것 같다 


type AnyOf<T extends readonly any[]> = T[number] extends [] | 0 | '' | false | {} ? false : true
```

```typescript
// try 2

type AnyOf<T extends readonly any[]> = T[number] extends  0 | '' | false  | [] ? false : keyof T[number] extends string ? true : false

/* _____________ Test Cases _____________ */
import type { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<AnyOf<[1, 'test', true, [1], { name: 'test' }, { 1: 'test' }]>, true>>,
  Expect<Equal<AnyOf<[1, '', false, [], {}]>, true>>,
  Expect<Equal<AnyOf<[0, 'test', false, [], {}]>, true>>,
  Expect<Equal<AnyOf<[0, '', true, [], {}]>, true>>,
  Expect<Equal<AnyOf<[0, '', false, [1], {}]>, true>>,
  Expect<Equal<AnyOf<[0, '', false, [], { name: 'test' }]>, true>>,
  Expect<Equal<AnyOf<[0, '', false, [], { 1: 'test' }]>, true>>,
  Expect<Equal<AnyOf<[0, '', false, [], { name: 'test' }, { 1: 'test' }]>, true>>,
  Expect<Equal<AnyOf<[0, '', false, [], {}]>, false>>, /// {} 빼면 성공인데... 실패   keyof {} never 인데 왜...
  Expect<Equal<AnyOf<[]>, false>>,
]
```

```typescript
// try 3 결국 답확인 { [key: string]: never } 를 사용하면 됐구나..

type AnyOf<T extends readonly any[]> = 
T[number] extends 0 | '' | false | [] | {[key: string]: never} ? 
false : 
true ;


```







