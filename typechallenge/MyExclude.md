## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### MyExclude

Implement the built-in Exclude<T, U>

> Exclude from T those types that are assignable to U

빌트인 Exclude를 구현 해보자

#### Exclude<UnionType, ExcludedMembers> 

Constructs a type by excluding from UnionType all union members that are assignable to ExcludedMembers

ExcludedMembers를 제외한 Union Type으로 타입을 구성한다

```typescript
type MyExclude<T, U> = T extends U ? never : T

type a = MyExclude<1 | 'a' | [], number> // 'a' | []

```

