input이 text + password 조합으로 있으면,

크롬이 자동으로 이메일과 패스워드를 완성시켜주는데 이것이 필요한 상황이 아니었다.

주민번호 앞자리는 text 뒷자리는 password 인 상황

```jsx
<S.Input
   	type="text"
  	id="resident-registration-first-number"
	{...register('residentRegistrationFirstNumber', {
	required: true,
	pattern: /^\\d{6}$/,
	})}
	width={110}
	error={!!errors.residentRegistrationFirstNumber}
	/>
	<span />
	<S.Input
	type="text"
	id="resident-registration-second-number"
	{...register('residentRegistrationSecondNumber', {
	required: true,
	pattern: /^[1-4]\\d{6}$/,
	})}
	onFocus={(e) => {
	e.target.setAttribute('type', 'password')
	}}
	width={110}
	error={!!errors.residentRegistrationSecondNumber}
/>
```

둘다 text input 으로 하고 focus 되면 뒷자리만 type을 password로 바꿔주면 해결!

