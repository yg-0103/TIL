var star = '*';
var line = '\n';
var whiteSpace = ' ';
var result = '';

for (var i = 5; i > 0; i--) {
  for (var j = 0; j < 5; j++) {
    result = j < i - 1 ? (result += whiteSpace) : (result += star);
  }
  result = i > 1 ? (result += line) : result;
}
console.log(result);
