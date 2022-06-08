## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Merge

Merge two types into a new type. Keys of the second type overrides keys of the first type.

For example

```typescript
type foo = {
  name: string;
  age: string;
}
type coo = {
  age: number;
  sex: string
}

type Result = Merge<foo,coo>; // expected to be {name: string, age: number, sex: string}
```

```typescript
// 오랜만에해서 감 잡을 겸 답을 봐버림...
type Merge<F, S> = {
  [key in keyof F | keyof S] : key extends keyof S ? S[key] : key extends keyof F ? F[key] : never
}

/* _____________ Test Cases _____________ */
import type { Equal, Expect } from '@type-challenges/utils'

type Foo = {
  a: number
  b: string
}
type Bar = {
  b: number
  c: boolean
}

type cases = [
  Expect<Equal<Merge<Foo, Bar>, {
    a: number
    b: number
    c: boolean
  }>>,
]

```

