## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Trim Left

Implement `TrimLeft<T>` which takes an exact string type and returns a new string with the whitespace beginning removed.

For example

```typescript
type trimed = TrimLeft<'  Hello World  '> // expected to be 'Hello World  '
```

```typescript
//try 1 
type TrimLeft<S extends string> = S extends `${'\n' | '\t' | ' '}${infer K}` ? TrimLeft<K> : S

/* _____________ Test Cases _____________ */
import { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<TrimLeft<'str'>, 'str'>>,
  Expect<Equal<TrimLeft<' str'>, 'str'>>,
  Expect<Equal<TrimLeft<'     str'>, 'str'>>,
  Expect<Equal<TrimLeft<'     str     '>, 'str     '>>,
  Expect<Equal<TrimLeft<'   \n\t foo bar '>, 'foo bar '>>,
  Expect<Equal<TrimLeft<''>, ''>>,
  Expect<Equal<TrimLeft<' \n\t'>, ''>>,
]

```



