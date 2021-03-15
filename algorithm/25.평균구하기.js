/*
25. 평균구하기

인수로 주어진 배열의 평균을 구하는 함수를 완성하라.
*/

function average(array) {
  return array.reduce(
    (acc, cur, i) =>
      i === array.length - 1 ? (acc + cur) / array.length : acc + cur,
    0
  );
}

console.log(average([5, 3, 4])); // 4
