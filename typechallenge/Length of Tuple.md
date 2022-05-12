## Type Challenge 

[타입챌린지](https://github.com/type-challenges/type-challenges)



### Length of Tuple



For given a tuple, you need create a generic `Length`, pick the length of the tuple

For example

```typescript
type tesla = ['tesla', 'model 3', 'model X', 'model Y']
type spaceX = ['FALCON 9', 'FALCON HEAVY', 'DRAGON', 'STARSHIP', 'HUMAN SPACEFLIGHT']

type teslaLength = Length<tesla>  // expected 4
type spaceXLength = Length<spaceX> // expected 5
```



```typescript
type tesla = ['tesla', 'model 3', 'model X', 'model Y']
type spaceX = ['FALCON 9', 'FALCON HEAVY', 'DRAGON', 'STARSHIP', 'HUMAN SPACEFLIGHT']

type Length<T extends any[]> = T['length']
type Length<T extends readonly any[]> = T['length']
 
type teslaLength = Length<[tesla]>  // expected 4
type spaceXLength = Length<spaceX> // expected 5
```

