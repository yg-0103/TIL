class Stack {
  constructor(capacity) {
    this.capacity = capacity;
    this.top = -1;
    this.array = new Array(capacity);
  }

  push(value) {
    if (this.top + 1 === this.capacity) {
      throw new Error('Stack overflow');
    }

    this.top++;
    this.array[this.top] = value;

    return value;
  }

  pop() {
    if (this.top === -1) {
      throw new Error('Stack underflow');
    }

    const value = this.array[this.top];
    this.top--;

    return value;
  }

  peek() {
    if (this.isEmpty()) return false;

    return this.array[this.top];
  }

  isEmpty() {
    return this.top === -1;
  }
}

let array = new Stack(10);

array.push(1);
array.push(2);
array.push(3);
array.push(4);
array.push(5);
array.push(6);
array.push(7);
array.push(8);
array.push(9);
array.push(10);

array.pop();
array.pop();

console.log(array.array);
