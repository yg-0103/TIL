

## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges/issues/6275)



### Readonly

Implement the built-in `Readonly<T>` generic without using it.

Constructs a type with all properties of T set to readonly, meaning the properties of the constructed type cannot be reassigned.

```typescript
interface Todo {
  title: string
  description: string
}

const todo: MyReadonly<Todo> = {
  title: "Hey",
  description: "foobar"
}

todo.title = "Hello" // Error: cannot reassign a readonly property
todo.description = "barFoo" // Error: cannot reassign a readonly property
```



```typescript
interface Todo {
  title: string
  description: string
}

// T 에 객체가 들어와 해당 키들을 모두 readonly로 변경
type MyReadonly<T> = {
  readonly [key in keyof T]: T[key]
}

const todo: MyReadonly<Todo> = {
  title: 'Hey',
  description: 'foobar',
}

todo.title = 'Hello' // Error: cannot reassign a readonly property
todo.description = 'barFoo' // Error: cannot reassign a readonly property
```



추가로 readonly를 수정가능 하게 변경할 수 도 있다

```typescript

interface Todo {
  readonly title: string
  readonly description: string
}

type MyReadonly<T> = {
  -readonly [key in keyof T]: T[key]
}

const todo: MyReadonly<Todo> = {
  title: 'Hey',
  description: 'foobar',
}

todo.title = 'Hello' 
todo.description = 'barFoo'
```

[MappedTypes](https://www.typescriptlang.org/docs/handbook/2/mapped-types.html)

