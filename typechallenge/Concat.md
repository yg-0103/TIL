## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Concat

Implement the JavaScript `Array.concat` function in the type system. A type takes the two arguments. The output should be a new array that includes inputs in ltr order

For example

```typescript
type Result = Concat<[1], [2]> // expected to be [1, 2]
```

```typescript
// try 1
// 혹시나해서 스프레드를 써봤는데 안된다, 에러를 확인하니 A rest element type must be an array type. 이런 에러가 떴다. T 와 U에 배열이 올거란 걸 알려줘봐야겠다.

type Concat<T, U> = [...T, ...U] 

/* _____________ Test Cases _____________ */
import { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<Concat<[], []>, []>>,
  Expect<Equal<Concat<[], [1]>, [1]>>,
  Expect<Equal<Concat<[1, 2], [3, 4]>, [1, 2, 3, 4]>>,
  Expect<Equal<Concat<['1', 2, '3'], [false, boolean, '4']>, ['1', 2, '3', false, boolean, '4']>>,
]

// try 2 
// 배열이라고 알려주니 똑똑한 타입스크립트가 처리해준다.
type Concat<T extends unknown[], U extends unknown[] > = [...T, ...U] 

/* _____________ Test Cases _____________ */
import { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<Concat<[], []>, []>>,
  Expect<Equal<Concat<[], [1]>, [1]>>,
  Expect<Equal<Concat<[1, 2], [3, 4]>, [1, 2, 3, 4]>>,
  Expect<Equal<Concat<['1', 2, '3'], [false, boolean, '4']>, ['1', 2, '3', false, boolean, '4']>>,
]



```



