var star = '*';
var line = '\n';
var whiteSpace = ' ';
var result = '';
var count = 1;
for (var i = 5; i > 0; i--) {
  for (var j = 1; j <= 5; j++) {
    result = j < count ? (result += whiteSpace) : (result += star);
  }
  count++;
  result = i > 1 ? (result += line) : result;
}
console.log(result);
