## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Unshift

Implement the type version of `Array.unshift`

For example

```typescript
type Result = Unshift<[1, 2], 0> // [0, 1, 2,]
```

```typescript
// try 1
type Unshift<T extends unknown[], U> = [U, ...T]


/* _____________ Test Cases _____________ */
import { Equal, Expect, ExpectFalse, NotEqual } from '@type-challenges/utils'

type cases = [
  Expect<Equal<Unshift<[], 1>, [1]>>,
  Expect<Equal<Unshift<[1, 2], 0>, [0, 1, 2,]>>,
  Expect<Equal<Unshift<['1', 2, '3'],boolean>, [boolean, '1', 2, '3']>>,
]



```





