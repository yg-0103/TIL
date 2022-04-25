## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Length of String

Compute the length of a string literal, which behaves like `String#length`.

```typescript
//try 1 간단히 시도해봤지만 number 라고 뜨는구나..
type LengthOfString<S extends string> = S['length'] 


```

```typescript
// try 2 Readonly 로 하면 될까 했지만 실패..! 

type LengthOfString<S extends string> = Readonly<S>['length']

```

```typescript
// try 3 스트링을 배열로 변경하면 length가 잘 잡히는 지 테스트 잘잡히는 것 같다 이제 어떻게 전체를 배열로 만들까?

type LengthOfString<S extends string> =  S extends "" ? 0 : S extends `${infer K}${infer Y}`  ? [K, Y]['length'] : never

type a = LengthOfString<"hi"> // 2

```

```typescript
// try 4 결국 답확인... 인수를 하나 더받아야 했구나...! 

type LengthOfString<S extends string, len extends string[] = []> = S extends `${infer F}${infer R}` ? LengthOfString<R, [F, ...len]>: len['length'];

import type { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<LengthOfString<''>, 0>>,
  Expect<Equal<LengthOfString<'kumiko'>, 6>>,
  Expect<Equal<LengthOfString<'reina'>, 5>>,
  Expect<Equal<LengthOfString<'Sound! Euphonium'>, 16>>,
]
```



