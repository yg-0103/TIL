### next 에서 svg 컴포넌트로 사용하기!

```jsx
// cra로 프로젝트를 시작한 경우 이런식으로 사용할 수 있었다.
import { ReactComponent as Cookie } from 'assets/cookie_icon.svg'
// next js에서 사용하려면 @svgr/webpack 을 설치해줘야 한다.
$ npm i -D @svgr/webpack 

// 설치를 하고 next.config.js 를 수정해줘야 한다

config.module.rules.push({
      test: /\\.svg$/,
      use: ['@svgr/webpack'],
    })

config.module.rules.push({
     test: /\\.(eot|woff|woff2|ttf|png|jpg|gif)$/,
     use: {
        loader: 'url-loader',
        options: {
          limit: 100000,
          name: '[name].[ext]',
        },
      },
    })

// 위와 같이 설정을 해주면 아래와 같이 사용할 수 있다
import Cookie from 'assets/cookie_icon.svg'

return <Cookie/>

// 하지만 typescript에 경우 위처럼하면 type에 문제가 생긴다.

//~.d.ts 파일을 만들어서 아래와 같은 설정을 해주면 된다.

declare module '*.svg' {
  const content: React.ComponentType
  export default content
}
```

next.config.js 에서 url-loader 가 처리해주는 부분과 @svgr/webpack 이 처리해주는 부분이 겹치면 오작동 할 수 있기 때문에 유의해서 처리해야한다.
