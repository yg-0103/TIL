## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### If

Implement a utils `If` which accepts condition `C`, a truthy return type `T`, and a falsy return type `F`. `C` is expected to be either `true` or `false` while `T` and `F` can be any type.

For example:

```typescript
type A = If<true, 'a', 'b'>  // expected to be 'a'
type B = If<false, 'a', 'b'> // expected to be 'b'
```

```typescript
// try 1
// C 를 불리언 타입으로 정해주면 true or false 밖에 오지 못하기 때문에 가능
type If<C extends boolean, T, F> = C extends true ? T : F

/* _____________ Test Cases _____________ */
import { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<If<true, 'a', 'b'>, 'a'>>,
  Expect<Equal<If<false, 'a', 2>, 2>>,
]

// @ts-expect-error
type error = If<null, 'a', 'b'>
```



