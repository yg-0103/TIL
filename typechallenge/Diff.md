## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Diff

```typescript
Get an Object that is the difference between O & O1
```

```typescript
type Diff<O, O1> = {
  [K in keyof Omit<O, keyof O1> | keyof Omit<O1, keyof O>]: K extends keyof O ? O[K] : K extends keyof O1 ? O1[K] : never
}

import type { Equal, Expect } from '@type-challenges/utils'

type Foo = {
  name: string
  age: string
}
type Bar = {
  name: string
  age: string
  gender: number
}
type Coo = {
  name: string
  gender: number
}

type cases = [
  Expect<Equal<Diff<Foo, Bar>, { gender: number }>>,
  Expect<Equal<Diff<Bar, Foo>, { gender: number }>>,
  Expect<Equal<Diff<Foo, Coo>, { age: string; gender: number }>>,
  Expect<Equal<Diff<Coo, Foo>, { age: string; gender: number }>>,
]


```







