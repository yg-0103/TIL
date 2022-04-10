

## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges/issues/6275)



### Pick

Implement the built-in `Pick<T, K>` generic without using it.

Constructs a type by picking the set of properties `K` from `T`

```typescript
interface Todo {
  title: string
  description: string
  completed: boolean
}

type TodoPreview = MyPick<Todo, 'title' | 'completed'>

const todo: TodoPreview = {
    title: 'Clean room',
    completed: false,
}
```

해당 문제는 Pick을 사용하지 않고 Pick 을 구현해보기

```typescript
interface Todo {
  title: string
  description: string
  completed: boolean
}

// 해당 객체에 키를 선택해야하므로 첫인자는 객체가 와야함, 두번째는 객체의 각 키들이 올 수 있기 때문에 keyof를 통해 K가 T의 키라는 것을 명시
// 인덱스 시그니쳐는 string | number 밖에 될 수 없기 때문에 in 키워드를 사용해 매핑된 객체 타입을 사용 
type MyPick<T, K extends keyof T> = { [key in K]: T[key] }
// 위와 같이 할 경우 key in 'title' | 'compeleted' : Todo[key] 와 같은 형식으로 됨

type TodoPreview = MyPick<Todo, 'title' | 'completed'>

const todo: TodoPreview = {
  title: 'Clean room',
  completed: false,
}

```



[MappedTypes](https://www.typescriptlang.org/docs/handbook/2/mapped-types.html)

