## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Includes

Implement the JavaScript `Array.includes` function in the type system. A type takes the two arguments. The output should be a boolean `true` or `false`.

For example

```typescript
type isPillarMen = Includes<['Kars', 'Esidisi', 'Wamuu', 'Santana'], 'Dio'> // expected to be `false`
```

```typescript
// try 1
type Includes<T extends readonly any[], U> = U extends T[number] ? true : false
// 타입이 정확히 as const 같은 느낌으로 추론이 안되는 것 같다 어떻게 정확하게 명시할 수 있을까?

/* _____________ Test Cases _____________ */
import { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<Includes<['Kars', 'Esidisi', 'Wamuu', 'Santana'], 'Kars'>, true>>,
  Expect<Equal<Includes<['Kars', 'Esidisi','Wamuu', 'Santana'], 'Dio'>, false>>,
  Expect<Equal<Includes<[1, 2, 3, 5, 6, 7], 7>, true>>,
  Expect<Equal<Includes<[1, 2, 3, 5, 6, 7], 4>, false>>,
  Expect<Equal<Includes<[1, 2, 3], 2>, true>>,
  Expect<Equal<Includes<[1, 2, 3], 1>, true>>,
  Expect<Equal<Includes<[{}], { a: 'A' }>, false>>, // 실패  뭔가 ObjectType 이면 다 ok
  Expect<Equal<Includes<[boolean, 2, 3, 5, 6, 7], false>, false>>, // 실패  boolean type 이면 다 ok 이런느낌?
  Expect<Equal<Includes<[true, 2, 3, 5, 6, 7], boolean>, false>>, // 실패
  Expect<Equal<Includes<[false, 2, 3, 5, 6, 7], false>, true>>,
  Expect<Equal<Includes<[{ a: 'A' }], { readonly a: 'A' }>, false>>, // 실패
  Expect<Equal<Includes<[{ readonly a: 'A' }], { a: 'A' }>, false>>, // 실패
]
```

```typescript
// solution
// 한개씩 재귀돌면서 타입 확인을 하는 방법인듯..? 
type Includes<T extends readonly unknown[], U> = T extends [infer First, ...infer Rest]
? Equal<First, U> extends true
  ? true
  : Includes<Rest, U>
: false;


/* _____________ Test Cases _____________ */
import { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<Includes<['Kars', 'Esidisi', 'Wamuu', 'Santana'], 'Kars'>, true>>,
  Expect<Equal<Includes<['Kars', 'Esidisi','Wamuu', 'Santana'], 'Dio'>, false>>,
  Expect<Equal<Includes<[1, 2, 3, 5, 6, 7], 7>, true>>,
  Expect<Equal<Includes<[1, 2, 3, 5, 6, 7], 4>, false>>,
  Expect<Equal<Includes<[1, 2, 3], 2>, true>>,
  Expect<Equal<Includes<[1, 2, 3], 1>, true>>,
  Expect<Equal<Includes<[{}], { a: 'A' }>, false>>,
  Expect<Equal<Includes<[boolean, 2, 3, 5, 6, 7], false>, false>>,
  Expect<Equal<Includes<[true, 2, 3, 5, 6, 7], boolean>, false>>,
  Expect<Equal<Includes<[false, 2, 3, 5, 6, 7], false>, true>>,
  Expect<Equal<Includes<[{ a: 'A' }], { readonly a: 'A' }>, false>>,
  Expect<Equal<Includes<[{ readonly a: 'A' }], { a: 'A' }>, false>>,
]

```



