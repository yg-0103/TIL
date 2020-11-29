var star = '*';
var line = '\n';
var whiteSpace = ' ';
var result = '';
var count = 0;
for (var i = 5; i > 0; i--) {
  for (var j = 0; j < i + 4; j++) {
    result = i <= 4 && j < count ? (result += whiteSpace) : (result += star);
  }
  count++;
  result = i > 1 ? (result += line) : result;
}

console.log(result);
