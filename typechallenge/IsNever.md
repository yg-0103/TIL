## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### IsNever

Implement a type IsNever, which takes input type `T`. If the type of resolves to `never`, return `true`, otherwise `false`.

For example:

```typescript
type A = IsNever<never>  // expected to be true
type B = IsNever<undefined> // expected to be false
type C = IsNever<null> // expected to be false
type D = IsNever<[]> // expected to be false
type E = IsNever<number> // expected to be false
```

```typescript
// try 1 간단하게 해봤지만 역시 왜 never 가 나올까?

type IsNever<S> = S extends never ?  true : false

type b = IsNever<never> // b = never ???!!

```

```typescript
// try2 [] 로 감싸줘야 된다.

type IsNever<S> = [S] extends [never] ?  true : false
```



Typically, distributivity is the desired behavior. To avoid that behavior, you can surround each side of the `extends` keyword with square brackets. ...?!

```typescript
type ToArrayNonDist<Type> = [Type] extends [any] ? Type[] : never;
 
// 'StrArrOrNumArr' is no longer a union.
type StrArrOrNumArr = ToArrayNonDist<string | number>; // (string | number)[]

type ToArrayNonDist<Type> = Type extends any ? Type[] : never;

type StrArrOrNumArr = ToArrayNonDist<string | number>; // string[] | number[]
```



https://stackoverflow.com/questions/71193522/typescript-inferred-never-is-not-never

https://github.com/microsoft/TypeScript/issues/31751#issuecomment-498526919

https://www.typescriptlang.org/docs/handbook/2/conditional-types.html#distributive-conditional-types

