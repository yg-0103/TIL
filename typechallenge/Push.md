## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Push

Implement the generic version of `Array.push`

For example

```typescript
type Result = Push<[1, 2], '3'> // [1, 2, '3']
```

```typescript
// try 1

type Push<T extends unknown[], U> = [...T, U]


/* _____________ Test Cases _____________ */
import { Equal, Expect, ExpectFalse, NotEqual } from '@type-challenges/utils'

type cases = [
  Expect<Equal<Push<[], 1>, [1]>>,
  Expect<Equal<Push<[1, 2], '3'>, [1, 2, '3']>>,
  Expect<Equal<Push<['1', 2, '3'], boolean>, ['1', 2, '3', boolean]>>,
]

```





