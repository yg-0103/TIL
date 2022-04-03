# Last of Array



Implement a generic `Last<T>` that takes an Array `T` and returns its last element.

For example

```typescript
type arr1 = ['a', 'b', 'c']
type arr2 = [3, 2, 1]

type tail1 = Last<arr1> // expected to be 'c'
type tail2 = Last<arr2> // expected to be 1
```

```typescript
// try 1 
type Last<T extends any[]> = T extends [...any, infer K] ? K : never

type a = Last<[3, 2, 1]>

/* _____________ Test Cases _____________ */
import { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<Last<[3, 2, 1]>, 1>>,
  Expect<Equal<Last<[() => 123, { a: string }]>, { a: string }>>,
]

```

