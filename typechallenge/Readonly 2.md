## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Readonly 2

Implement a generic `MyReadonly2<T, K>` which takes two type argument `T` and `K`.

`K` specify the set of properties of `T` that should set to Readonly. When `K` is not provided, it should make all properties readonly just like the normal `Readonly<T>`.

For example

```typescript
interface Todo {
  title: string
  description: string
  completed: boolean
}

const todo: MyReadonly2<Todo, 'title' | 'description'> = {
  title: "Hey",
  description: "foobar",
  completed: false,
}

todo.title = "Hello" // Error: cannot reassign a readonly property
todo.description = "barFoo" // Error: cannot reassign a readonly property
todo.completed = true // OK
```



```typescript
// try 1
// K를 뺴고 매핑을 해주고 & 로 readonly를 처리 하려고 했는데 왜 1번은 실패지?
type MyReadonly2<T, K extends keyof T> = {
  [key in keyof Omit<T, K>]: T[key]
}  & { readonly [key in keyof Pick<T,K>]: T[key] }


type a = MyReadonly2<Todo1, 'title'>

/* _____________ Test Cases _____________ */
import { Alike, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Alike<MyReadonly2<Todo1>, Readonly<Todo1>>>, // 실패
  Expect<Alike<MyReadonly2<Todo1, 'title' | 'description'>, Expected>>,
  Expect<Alike<MyReadonly2<Todo2, 'title' | 'description'>, Expected>>,
]

interface Todo1 {
  title: string
  description?: string
  completed: boolean
}

interface Todo2 {
  readonly title: string
  description?: string
  completed: boolean
}

interface Expected {
  readonly title: string
  readonly description?: string
  completed: boolean
}

```

```typescript
//try 2
// 결국 정답을 참고 K의 기본값을 설정해주면 해결이 되는데 이유를 모르겠다..

type MyReadonly2<T, K extends keyof T = keyof T> = {
  [key in keyof Omit<T, K>]: T[key]
}  & { readonly [key in keyof Pick<T,K>]: T[key] }


type a = MyReadonly2<Todo1, 'title'>

/* _____________ Test Cases _____________ */
import { Alike, Expect } from '@type-challenges/utils'

type cases = [
  Expect<Alike<MyReadonly2<Todo1>, Readonly<Todo1>>>, // 실패
  Expect<Alike<MyReadonly2<Todo1, 'title' | 'description'>, Expected>>,
  Expect<Alike<MyReadonly2<Todo2, 'title' | 'description'>, Expected>>,
]

interface Todo1 {
  title: string
  description?: string
  completed: boolean
}

interface Todo2 {
  readonly title: string
  description?: string
  completed: boolean
}

interface Expected {
  readonly title: string
  readonly description?: string
  completed: boolean
}



```