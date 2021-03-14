class Node {
  constructor(value, prev, next) {
    this.value = value;
    this.prev = prev;
    this.next = next;
  }
}

class DoublyLinkedList {
  constructor() {
    this.head = null;
    this.tail = null;
  }

  isEmpty() {
    return !this.head;
  }

  prepend(value) {
    const node = new Node(value, null, this.head);

    if (this.head) {
      this.head.prev = node;
      this.head = node;
    } else {
      this.head = node;
      this.tail = node;
    }
  }
  append(value) {
    const node = new Node(value, this.tail, null);

    if (this.tail) {
      this.tail.next = node;
      this.tail = node;
    } else {
      this.tail = node;
      this.head = node;
    }
  }

  setHead(index) {
    let count = 0;
    let node = this.head;

    while (count < index) {
      if (!node.next) return false;
      node = node.next;
      count++;
    }
    this.head = node;
  }

  access(index) {
    let count = 0;
    let node = this.head;

    while (count < index) {
      if (!node) return false;
      node = node.next;
      count++;
    }

    return node.value;
  }

  insert(index, value) {
    let count = 0;
    let node = this.head;

    while (count < index) {
      node = node.next;
      count++;
      if (!node) break;
    }

    if (node === this.head) {
      this.prepend(value);
      return;
    }

    if (!node) {
      throw new Error('리스트의 길이보다 인덱스가 큽니다.');
    }

    if (node) {
      const prevNode = node.prev;
      const newNode = new Node(value, prevNode, node);
      prevNode.next = newNode;
      return;
    }
  }

  remove(index) {
    let count = 0;
    let node = this.head;

    while (count < index) {
      node = node.next;
      count++;
      if (!node) break;
    }

    if (node === this.head) {
      this.head = node.next;
      this.head.prev = null;
      return;
    }

    if (!node) {
      throw new Error('리스트의 길이보다 인덱스가 큽니다.');
    }

    if (node) {
      const prevNode = node.prev;
      const nextNode = node.next;
      node.prev.next = nextNode;
      return;
    }
  }

  print() {
    let node = this.head;

    while (node.next) {
      console.log(node.value);
      node = node.next;
    }
    console.log(node.value);
  }

  printInv() {
    let node = this.tail;

    while (node.prev) {
      console.log(node.value);
      node = node.prev;
    }
    console.log(node.value);
  }
}

myList = new DoublyLinkedList();

// for (let i = 0; i < 10; i++) {
//   myList.append(i + 1);
// }
// myList.print();
// myList.printInv();

// for (let i = 0; i < 10; i++) {
//   myList.prepend(i + 1);
// }
// myList.print();
// myList.printInv();

// const value = myList.access(0);
// console.log(`myList.access(3) = ${value}`);

// myList.insert(8, 128);
// myList.print();
// myList.printInv();

// myList.remove(4);
// myList.print();
// myList.printInv();

// myList.setHead(10);
// myList.print();
// myList.printInv();
