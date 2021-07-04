// var star = '*';
// var line = '\n';
// var result = '';

// for (var i = 0; i < 5; i++) {
//   for (var j = 5; j > i; j--) {
//     result += star;
//   }
//   result = i < 4 ? (result += line) : result;
// }

// console.log(result);
function star(n, a) {
  let result = '';
  result = Array.from({ length: n })
    .map((v, i, arr) => {
      return (result += a);
    })
    .join('\n');

  return result;
}
console.log(star(5, '*'));
