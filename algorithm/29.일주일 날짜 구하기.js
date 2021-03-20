/*
29. 일주일 날짜 구하기

오늘을 기준으로 YYYY-MM-DD 형식의 문자열을 요소로 갖는 배열로 일주일 간의 날짜를 구하는 함수를 완성하라. 

단, 함수가 반환하는 배열은 일요일부터 시작해서 토요일까지 구성한다.
*/

function getCurrentWeek(time) {
  const date = new Date(time);
  const year = date.getFullYear();
  const month = date.getMonth() + 1;
  const today = date.getDate();
  const day = date.getDay();
  let result = [];

  for (let i = 0; i < day; i++) {
    result.push(
      `${year}-${month < 10 ? '0' + month : month}-${
        today - day + i < 10 ? '0' + (today - day + i) : today - day + i
      }`
    );
  }
  for (let j = day; j < 7; j++) {
    result.push(
      `${year}-${month < 10 ? '0' + month : month}-${
        today - day + j < 10 ? '0' + (today - day + j) : today - day + j
      }`
    );
  }
  return result;
}

console.log(getCurrentWeek('2020/12/10'));
/*
오늘이 2020-04-21인 경우,
[
  '2020-04-19',
  '2020-04-20',
  '2020-04-21',
  '2020-04-22',
  '2020-04-23',
  '2020-04-24',
  '2020-04-25'
]
*/
