class BinaryTree {
  constructor(array) {
    this.array = array;
  }

  preorder() {
    let s = '';
    const recursive = index => {
      if (index >= this.array.length) return;
      const value = this.array[index];

      s += ` ${value}`;
      recursive(2 * index + 1);
      recursive(2 * index + 2);
    };
    recursive(0);
    console.log(s);
  }

  inorder() {
    let s = '';
    const recursive = index => {
      if (index >= this.array.length) return;

      recursive(2 * index + 1);

      const value = this.array[index];
      s += ` ${value}`;

      recursive(2 * index + 2);
    };
    recursive(0);
    console.log(s);
  }

  postorder() {
    let s = '';
    const recursive = index => {
      if (index >= this.array.length) return;

      recursive(2 * index + 1);
      recursive(2 * index + 2);

      const value = this.array[index];
      s += ` ${value}`;
    };
    recursive(0);
    console.log(s);
  }

  bfs(targetValue) {
    for (let i = 0; i < this.array.length; i++) {
      if (this.array[i] === targetValue) {
        return true;
      }
    }
    return false;
  }

  dfs(targetValue) {
    let isFound = false;
    const recursive = index => {
      if (index >= this.array.length) return;
      if (isFound === true) return;

      const value = this.array[index];

      if (value === targetValue) {
        isFound = true;
      }
      recursive(2 * index + 1);
      recursive(2 * index + 2);
    };

    recursive(0);

    return isFound;
  }
}

const tree = new BinaryTree([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);
tree.preorder();
