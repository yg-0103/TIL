function bubbleSort(array) {
  let swapIdx = 0;
  const swap = (fir, sec, idx) => {
    [array[idx], array[idx + 1]] = [sec, fir];
    swapIdx++;
  };

  for (let i = 0; i < array.length - 1; i++) {
    swapIdx = 0;
    for (let j = 0; j < array.length - i - 1; j++) {
      if (array[j] > array[j + 1]) {
        swap(array[j], array[j + 1], j);
      }
    }
    if (swapIdx === 0) break;
  }
  return array;
}

console.log(bubbleSort([2, 4, 5, 1, 3, 1, 1])); // [1, 2, 3, 4, 5]
console.log(bubbleSort([5, 2, 1, 3, 4, 6])); // [1, 2, 3, 4, 5, 6]
console.log(bubbleSort([3, 1, 0, -1, 4, 2])); // [-1, 0, 1, 2, 3, 4]
