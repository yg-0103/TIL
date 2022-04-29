## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Permutation

Implement permutation type that transforms union types into the array that includes permutations of unions.

```typescript
type perm = Permutation<'A' | 'B' | 'C'>; // ['A', 'B', 'C'] | ['A', 'C', 'B'] | ['B', 'A', 'C'] | ['B', 'C', 'A'] | ['C', 'A', 'B'] | ['C', 'B', 'A']
```



```typescript
//try 1 간단하게 해봤는데 한개씩 배열에 담기고 있다 [A] | [B] | [C] 이렇게... 어떻게 다담을 수 있을까
type Permutation<T> = T extends any ? [T] : never

```

```typescript
// try 2 결국 정답확인... 

type Permutation<T, U = T> = [T] extends [never] ? [] : T extends T ? [T, ...Permutation<Exclude<U, T>>] : never;


/* _____________ Test Cases _____________ */
import type { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<Permutation<'A'>, ['A']>>,
  Expect<Equal<Permutation<'A' | 'B' | 'C'>, ['A', 'B', 'C'] | ['A', 'C', 'B'] | ['B', 'A', 'C'] | ['B', 'C', 'A'] | ['C', 'A', 'B'] | ['C', 'B', 'A']>>,
  Expect<Equal<Permutation<'B' | 'A' | 'C'>, ['A', 'B', 'C'] | ['A', 'C', 'B'] | ['B', 'A', 'C'] | ['B', 'C', 'A'] | ['C', 'A', 'B'] | ['C', 'B', 'A']>>,
  Expect<Equal<Permutation<never>, []>>,
]
```



