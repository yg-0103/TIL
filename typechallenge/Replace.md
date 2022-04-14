# Replace



Implement `Replace<S, From, To>` which replace the string `From` with `To` once in the given string `S`

For example

```typescript
type replaced = Replace<'types are fun!', 'fun', 'awesome'> // expected to be 'types are awesome!'
```

```typescript
// try 1 
type Replace<S extends string, From extends string, To extends string> = 
  From extends '' ? S :
 S extends `${infer left}${From}${infer right}` ? `${left}${To}${right}`: S;

/* _____________ Test Cases _____________ */
import { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<Replace<'foobar', 'bar', 'foo'>, 'foofoo'>>,
  Expect<Equal<Replace<'foobarbar', 'bar', 'foo'>, 'foofoobar'>>,
  Expect<Equal<Replace<'foobarbar', '', 'foo'>, 'foobarbar'>>,
  Expect<Equal<Replace<'foobarbar', 'bra', 'foo'>, 'foobarbar'>>,
  Expect<Equal<Replace<'', '', ''>, ''>>,
]

```

