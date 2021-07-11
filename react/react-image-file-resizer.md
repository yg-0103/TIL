

## react-image-file-resizer



client 단 에서 입력받은 image file이 크기가 다다르고 용량이 굉장히 큰 파일이 올 수도 있으므로 file 크기를 resizing 해준다.

```tsx
const resizeFile = (file: File) => {
    return new Promise<File>((resolve) => {
      Resizer.imageFileResizer(
        file,
        // max-width
        720,
        // max-height
        720,
        // format
        'WEBP',
        // quality
        100,
        // rotation
        0,
        // responseUriFunc
        (dataURI) => {
          resolve(dataURI as File)
        },
        // outputType
        'file'
      )
    })
  }
```

## Option (위쪽부터 순서대로)



### 필수

file: 변환할 파일 string | File | Blob | ProgressEvent<FileReader> 이렇게 올 수 있다.

maxWidth: 새로 만들어질 이미지의 최대 넓이

maxHeight: 새로 만들어질 이미지의 최대 높이

compressFormat: 새로운 이미지의 파일포맷 (JPEG, PNG, WEBP)

quality: 새로운 이미지의 quality

rotation: 이미지의 각도 설정 (90, 180, 270, 360)

responseUriFunc: 새로운 이미지(base64, file, blob)를 parameter로 받아오는 callback 함수

### 옵션

outputType: 새로운 이미지의 타입(base64, file, blob) default = base64

minWidth: 새로 만들어질 이미지의 최소 넓이

minHeight: 새로 만들어질 이미지의 최소 높이