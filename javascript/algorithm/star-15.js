var star = '*';
var line = '\n';
var whiteSpace = ' ';
var result = '';
var count = 4;
for (var i = 0; i < 5; i++) {
  for (var j = 0; j < i + 5; j++) {
    result = j < count ? (result += whiteSpace) : (result += star);
  }
  count--;
  result = i < 4 ? (result += line) : result;
}

console.log(result);
