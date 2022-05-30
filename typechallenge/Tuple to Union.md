

## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Tuple To Union

Implement a generic `TupleToUnion<T>` which covers the values of a tuple to its values union.

For example

```typescript
type Arr = ['1', '2', '3']

type Test = TupleToUnion<Arr> // expected to be '1' | '2' | '3'
```



```typescript
// try 1 

type TupleToUnion<T extends readonly any[]> = T[number]


/* _____________ Test Cases _____________ */
import { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<TupleToUnion<[123, '456', true]>, 123 | '456' | true>>,
  Expect<Equal<TupleToUnion<[123]>, 123>>,
]



/* _____________ Further Steps _____________ */
/*
  > Share your solutions: https://tsch.js.org/10/answer
  > View solutions: https://tsch.js.org/10/solutions
  > More Challenges: https://tsch.js.org
*/


```
