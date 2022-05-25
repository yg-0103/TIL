

## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Tuple To Object

Give an array, transform into an object type and the key/value must in the given array.

For example

```typescript
const tuple = ['tesla', 'model 3', 'model X', 'model Y'] as const

type result = TupleToObject<typeof tuple> 
// expected { tesla: 'tesla', 'model 3': 'model 3', 'model X': 'model X', 'model Y': 'model Y'}
```



```typescript
const tuple = ['tesla', 'model 3', 'model X', 'model Y'] as const
// 위와 같이 정해진 tuple type은 다음 과 같은 모습이다
{
  0: 'tesla',
  1: 'model 3',
  2: 'model X',
  3: 'model Y',
  readonly length: 7,
}

type tesla = typeof tuple[0]
type model3 = typeof tuple[1]
// ......

type TupleToObject<T extends readonly string[]> = {
  [key in T[number]]: key
}

// [key in T[0]] : key = tesla  { tesla: 'tesla'}  

type result = TupleToObject<typeof tuple>

```



[MappedTypes](https://www.typescriptlang.org/docs/handbook/2/mapped-types.html)

