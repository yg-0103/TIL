## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Omit

Implement the built-in `Omit<T, K>` generic without using it.

Constructs a type by picking all properties from `T` and then removing `K`

For example

```typescript
interface Todo {
  title: string
  description: string
  completed: boolean
}

type TodoPreview = MyOmit<Todo, 'description' | 'title'>

const todo: TodoPreview = {
  completed: false,
}
```

```typescript
//try 1
// never일게 아니라 아예 존재하지 않아야 되는데 어떻게 해야할까..

type MyOmit<T, K> = {
  [key in keyof T] : key extends K ? never : T[key]
}


/* _____________ Test Cases _____________ */
import { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<Expected1, MyOmit<Todo, 'description'>>>,
  Expect<Equal<Expected2, MyOmit<Todo, 'description' | 'completed'>>>
]

interface Todo {
  title: string
  description: string
  completed: boolean
}

interface Expected1 {
  title: string
  completed: boolean
}

interface Expected2 {
  title: string
}

```

```typescript
//try 2
// 결국 정답확인..
type MyExclude<T, K> = T extends K ? never : T 

type MyOmit<T, K> = {
  [key in keyof T as MyExclude<key, K>] :  T[key]
}

type a = MyOmit<Todo, 'title'>

/* _____________ Test Cases _____________ */
import { Equal, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Equal<Expected1, MyOmit<Todo, 'description'>>>,
  Expect<Equal<Expected2, MyOmit<Todo, 'description' | 'completed'>>>
]

interface Todo {
  title: string
  description: string
  completed: boolean
}

interface Expected1 {
  title: string
  completed: boolean
}

interface Expected2 {
  title: string
}

```