## react-hook-form

기본 컨셉은 register를 활용해 컴포넌트를 hook과 연결해서 값이 검사될 수 있도록 만들고 submit 시 값을 모아준다.

ex)

```jsx
import React from "react";
import { useForm } from "react-hook-form";

export default function App() {
  const { register, handleSubmit } = useForm();
  const onSubmit = data => console.log(data);
   
  return (
    <form onSubmit={handleSubmit(onSubmit)}>
      <input {...register("firstName")} />
      <select {...register("gender")}>
        <option value="female">female</option>
        <option value="male">male</option>
        <option value="other">other</option>
      </select>
      <input type="submit" />
    </form>
  );
}
```

register의 두번째 인수로 required, min, max, minLength, maxLength, pattern, validate 등 유효성 검사를 도와준다.

### file Input 관련

file input 은 보통 커스터마이징 해서 사용하기 때문에 숨겨놓고 label을 클릭 했을때 반응하게 만든다.

하지만 file값이 바뀌면 리렌더링이 일어나야 readonly 인풋의 값이 화면에 반영되는데

리렌더링이 일어나지 않아서 화면에 반영되지 않는 이슈가 발생

```tsx
useEffect(() => {
    watch(['accountCopyImage', 'identityDocumentImage'])
  }, [])
```

useForm 에서 watch 함수를 꺼내서 호출해주면 값이 바뀔때 리렌더링을 해준다.