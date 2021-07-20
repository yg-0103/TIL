### next/link 사용 시

```jsx
export default function ApplyLink() {

  return (
		<Link href="<https://외부링크/>">
	    <S.Link>
	      이동
	      <S.LinkIconWrapper>
	        <Arrow direction="right" size={16} color={COLORS.WHITE} strokeWidth={2} />
	      </S.LinkIconWrapper>
	    </S.Link>
		</Link>

  )

}
```

위와 같이 Link 컴포넌트 내부에서 스타일드컴포넌트로 만든 div, button 같은 태그는 괜찮지만 a태그가 들어가면 링크기능이 동작안하는 이슈가 발생했다.. ! (route 이동이 아닌 외부링크로 이동시)

Link 컴포넌트에 passHref 라는 prop을 주면 정상동작 하긴 했지만 굳이 route가 아닌 다른 링크로 이동하는 일에 Link 컴포넌트를 쓰는 것 보단 a 태그에 직접 href를 주는 게 좋을 것 같다고 해서 겉에 Link 태그를 걷어내는 것으로 처리했다.

passHref: boolean = 기본 값은 false로 href prop을 자식에게 강제로 전달하게 한다
