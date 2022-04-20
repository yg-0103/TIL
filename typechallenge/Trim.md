## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Trim



Implement `Trim<T>` which takes an exact string type and returns a new string with the whitespace from both ends removed.

For example

```typescript
type trimed = Trim<'  Hello World  '> // expected to be 'Hello World'
```

```typescript
//try 1  mapping 해서 공백이면 빼주려고 했지만 실패... 공백을 어떻게 지워야 할까?

type Trim<S extends string> = {
  [key in keyof S]: S[key] extends " " ? never : S[key]
}

type a = Trim<' str'>

/* _____________ Test Cases _____________ */
import { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<Trim<'str'>, 'str'>>,
  Expect<Equal<Trim<' str'>, 'str'>>,
  Expect<Equal<Trim<'     str'>, 'str'>>,
  Expect<Equal<Trim<'str   '>, 'str'>>,
  Expect<Equal<Trim<'     str     '>, 'str'>>,
  Expect<Equal<Trim<'   \n\t foo bar \t'>, 'foo bar'>>,
]


```



```typescript
// try 2 이런식으로 지울 수가 있구나... !!!

type Trim<S extends string> = S extends `${' ' | '\n' | '\t'}${infer R}` | `${infer R}${' ' | '\n' | '\t'}` ? Trim<R> : S


/* _____________ Test Cases _____________ */
import { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<Trim<'str'>, 'str'>>,
  Expect<Equal<Trim<' str'>, 'str'>>,
  Expect<Equal<Trim<'     str'>, 'str'>>,
  Expect<Equal<Trim<'str   '>, 'str'>>,
  Expect<Equal<Trim<'     str     '>, 'str'>>,
  Expect<Equal<Trim<'   \n\t foo bar \t'>, 'foo bar'>>,
]

```

