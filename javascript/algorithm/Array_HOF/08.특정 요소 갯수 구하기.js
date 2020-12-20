let todos = [
  { id: 3, content: 'HTML', completed: false },
  { id: 2, content: 'CSS', completed: true },
  { id: 1, content: 'Javascript', completed: false },
];

function countCompletedTodos() {
  return todos.reduce((acc, cur) => (cur.completed === true ? ++acc : acc), 0);
}

console.log(countCompletedTodos()); // 1
