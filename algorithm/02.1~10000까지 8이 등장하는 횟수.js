/*
2. 1 ~ 10,000의 숫자 중 8이 등장하는 횟수 구하기 (Google)
1부터 10,000까지 8이라는 숫자가 총 몇번 나오는가? 이를 구하는 함수를 완성하라.

단, 8이 포함되어 있는 숫자의 갯수를 카운팅 하는 것이 아니라 8이라는 숫자를 모두 카운팅 해야 한다. 예를 들어 8808은 3, 8888은 4로 카운팅 해야 한다.

(hint) 문자열 중 n번째에 있는 문자 : str.charAt(n) or str[n]
*/
function getCount8() {
  let count = 0;
  // Array.from({ length: 10000 }, (_, i) => {
  //   [...(i + '')].forEach((v) => (v === '8' ? ++count : count));
  // });
  // return count;
  Array.from({ length: 10000 }, (_, i) => {
    while (i >= 1) {
      if (Math.floor(i % 10) === 8) count++;
      i = Math.floor(i / 10);
    }
  });
  return count;
}
console.log(getCount8()); // 4000
