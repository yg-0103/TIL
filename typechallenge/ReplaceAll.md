# ReplaceAll



Implement `ReplaceAll<S, From, To>` which replace the all the substring `From` with `To` in the given string `S`

For example

```typescript
type replaced = ReplaceAll<'t y p e s', ' ', ''> // expected to be 'types'
```

```typescript
// try 1  재귀를 돌렸더니 2가지 케이스가 안된다 한 번 본것은 빼면 되겠지?

type ReplaceAll<S extends string, From extends string, To extends string> = From extends '' ? S : S extends `${infer left}${From}${infer right}`?  ReplaceAll<`${left}${To}${right}`, From, To>: S;

import { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<ReplaceAll<'foobar', 'bar', 'foo'>, 'foofoo'>>,
  Expect<Equal<ReplaceAll<'foobar', 'bag', 'foo'>, 'foobar'>>,
  Expect<Equal<ReplaceAll<'foobarbar', 'bar', 'foo'>, 'foofoofoo'>>,
  Expect<Equal<ReplaceAll<'t y p e s', ' ', ''>, 'types'>>,
  Expect<Equal<ReplaceAll<'foobarbar', '', 'foo'>, 'foobarbar'>>,
  Expect<Equal<ReplaceAll<'barfoo', 'bar', 'foo'>, 'foofoo'>>,
  Expect<Equal<ReplaceAll<'foobarfoobar', 'ob', 'b'>, 'fobarfobar'>>, // 실패
  Expect<Equal<ReplaceAll<'foboorfoboar', 'bo', 'b'>, 'foborfobar'>>, // 실패
  Expect<Equal<ReplaceAll<'', '', ''>, ''>>,
]
```

```typescript
// try 2 From만 To로 변경해주고 right만 재귀를 돌려줬더니 성공 !

type ReplaceAll<S extends string, From extends string, To extends string> = From extends '' ? S : S extends `${infer left}${From}${infer right}`?  `${left}${To}${ReplaceAll<right, From, To>}`: S;

import { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<ReplaceAll<'foobar', 'bar', 'foo'>, 'foofoo'>>,
  Expect<Equal<ReplaceAll<'foobar', 'bag', 'foo'>, 'foobar'>>,
  Expect<Equal<ReplaceAll<'foobarbar', 'bar', 'foo'>, 'foofoofoo'>>,
  Expect<Equal<ReplaceAll<'t y p e s', ' ', ''>, 'types'>>,
  Expect<Equal<ReplaceAll<'foobarbar', '', 'foo'>, 'foobarbar'>>,
  Expect<Equal<ReplaceAll<'barfoo', 'bar', 'foo'>, 'foofoo'>>,
  Expect<Equal<ReplaceAll<'foobarfoobar', 'ob', 'b'>, 'fobarfobar'>>, 
  Expect<Equal<ReplaceAll<'foboorfoboar', 'bo', 'b'>, 'foborfobar'>>, 
  Expect<Equal<ReplaceAll<'', '', ''>, ''>>,
]
```

