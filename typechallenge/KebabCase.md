## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### KebabCase

```typescript
FooBarBaz -> foo-bar-baz
```

```typescript
// try 1 이런식으로 접근해보기로 함..

type KebabCase<S> = S extends `${infer R}${infer U}` ? R extends Uppercase<R> ? `-${Lowercase<R>}${U}` : `-${R}${U}` :  `-${R}${U}`

type b = KebabCase<'FooBar'>
```

```typescript
// try 2 맨앞에만 뺴면 될 것 같은데...!!!
type KebabCase<S> = S extends `${infer F}${infer R}` ? F extends Uppercase<F> ? `-${Lowercase<F>}${KebabCase<R>}` : `${F}${KebabCase<R>}` : S

type b = KebabCase<'FooBar'> // -foo-bar
```

```typescript
// try 3 앞에를 날렸더니..

type First<S> = S extends `${infer F}${infer R}` ? F extends Capitalize<F> ? `-${Uncapitalize<F>}${First<R>}` : `${F}${First<R>}` : S

type KebabCase<S> = First<S> extends `${infer F}${infer B}` ? B : never


type b = KebabCase<'foo-bar'> // oo--bar
```

```typescript
// try 4 결국 답을 봄... 첫번째를 저렇게 할 수 있구나..!

type KebabCase<S extends string, IsFirst extends boolean = true> =
  S extends `${infer First}${infer Rest}`
    ? First extends Lowercase<First>
      ? `${First}${KebabCase<Rest, false>}`
      : `${IsFirst extends true ? '' : '-'}${Lowercase<First>}${KebabCase<Rest, false>}`
    : S

```

