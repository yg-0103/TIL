function solution(n) {
  function hanoi(n, from, to, support) {
    if (n === 1) return [[from, to]];

    return hanoi(n - 1, from, support, to).concat(
      [[from, to]],
      hanoi(n - 1, support, to, from)
    );
  }
  return hanoi(n, 1, 3, 2);
}
