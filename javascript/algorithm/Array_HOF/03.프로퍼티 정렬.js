const todos = [
  { id: 3, content: 'HTML', completed: false },
  { id: 2, content: 'CSS', completed: true },
  { id: 1, content: 'Javascript', completed: false },
];

function sortBy(key) {
  return todos.sort((a, b) =>
    a[key] === b[key] ? 0 : a[key] < b[key] ? -1 : 1
  );
}

console.log(sortBy('id'));

console.log(sortBy('content'));

console.log(sortBy('completed'));
