

## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Chainable Options

Chainable options are commonly used in Javascript. But when we switch to TypeScript, can you properly type it?

In this challenge, you need to type an object or a class - whatever you like - to provide two function `option(key, value)` and `get()`. In `option`, you can extend the current config type by the given key and value. We should about to access the final result via `get`.

For example

```typescript
declare const config: Chainable

const result = config
  .option('foo', 123)
  .option('name', 'type-challenges')
  .option('bar', { value: 'Hello World' })
  .get()

// expect the type of result to be:
interface Result {
  foo: number
  name: string
  bar: {
    value: string
  }
}
```



```typescript
// try 1 Chaining 을 하려면 기본적으로 같은 타입을 리턴해줘야 하겠지..? R[T] === K 면 있는거니까 아래처럼 해봤는데 실패..
type Chainable<R = {}> = {
  option<T extends keyof R, K>(key: K extends R[T] ? never: T , value: K): Chainable<{ [key in T]: K }>
  get(): any
}


/* _____________ Test Cases _____________ */
import { Alike, Expect } from '@type-challenges/utils'

declare const a: Chainable

const result1 = a
  .option('foo', 123)
  .option('bar', { value: 'Hello World' })
  .option('name', 'type-challenges')
  .get()

const result2 = a
  .option('name', 'another name')
  // @ts-expect-error
  .option('name', 'last name')
  .get()

type cases = [
  Expect<Alike<typeof result1, Expected1>>,
  Expect<Alike<typeof result2, Expected2>>,
]

type Expected1 = {
  foo: number
  bar: {
    value: string
  }
  name: string
}

type Expected2 = {
  name: string
}

```