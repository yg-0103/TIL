function insertionSort(array) {
  let key = 0;
  for (let i = 1; i < array.length; i++) {
    key = i;
    for (let j = i - 1; j >= 0; j--) {
      if (array[j] > array[key]) {
        [array[j], array[key]] = [array[key], array[j]];
        key--;
      } else {
        break;
      }
    }
  }
  return array;
}

console.log(insertionSort([3, 1, 0, -1, 4, 2])); // [-1, 0, 1, 2, 3, 4]
console.log(insertionSort([2, 4, 5, 1, 3])); // [1, 2, 3, 4, 5]
console.log(insertionSort([5, 2, 1, 3, 4, 6])); // [1, 2, 3, 4, 5, 6]
