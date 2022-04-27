let result = [];

function solution(ball, order) {
  if (!ball.length) return result;

  for (let i = 0; i < order.length; i++) {
    const targetIndex = ball.indexOf(order[i]);
    if (targetIndex === ball.length - 1 || targetIndex === 0) {
      result = [...result, ...ball.splice(targetIndex, 1)];
      return solution(ball, order);
    }
  }
}

console.log(solution([11, 2, 9, 13, 24], [9, 2, 13, 24, 11]));
