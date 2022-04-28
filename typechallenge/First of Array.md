## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### First of Array

Implement a generic `First<T>` that takes an Array `T` and returns it's first element's type.

For example

```typescript
type arr1 = ['a', 'b', 'c']
type arr2 = [3, 2, 1]

type head1 = First<arr1> // expected to be 'a'
type head2 = First<arr2> // expected to be 3
```

```typescript
type arr1 = ['a', 'b', 'c']

type arr2 = [3, 2, 1]

type First<T extends any[]> = T[0]

type First2<T extends any[]> = T extends [] ? never : T[0]

// infer는  extends 절에서만 사용가능하며 특정 변수를 설정해 반환하거나 참조할 수 있게 해준다.
type First3<T> = T extends [infer U, ...unknown[]] ? U : never

type head = First<[]> // undefined

type head2 = First<arr2> // 3

type head3 = First2<[]> // never

type head4 = First2<arr2> // 3

```





