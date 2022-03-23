

### Typescript infer keyword

조건부 타입에서 infer 키워드는 extends 절에서 사용 가능하고 타입변수를 참조하기 위해서 사용된다

ex)

```jsx
// T 가 [infer U, ...unknown[]]의 서브타입이면 U, 아니면 never
type First<T> =
  T extends [infer U, ...unknown[]]
    ? U
    : never;

type SomeTupleType = [string, number, boolean];
type NumberType = number
type FirstType = First<SomeTupleType>; // string
type SeconType = First<NumberType>; // never;
```

### Typescript is keyword

```jsx
function isString(test: any): test is string{
    return typeof test === “string”;
}

function example(foo: any){
    if(isString(foo)){
        console.log(“it is a string” + foo);
        console.log(foo.length); // string function
    }
}
example(“hello world”);
```

위와 같이 반환 값에 test is string 으로 해주면,

아래 isString(foo) 블럭 아래의 foo 는 string 타입으로 타입을 좁혀준다.
