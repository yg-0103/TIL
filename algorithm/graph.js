class Vertex {
  constructor(value, adjList = new Array()) {
    this.value = value;
    this.adjList = adjList;
  }
}

class Graph {
  constructor() {
    this.vertices = new Array();
  }

  insert(value, adjList) {
    const v = new Vertex(value, adjList);
    this.vertices.push(v);
    const vInd = this.vertices.length - 1;
    for (let i = 0; i < v.adjList.length; i++) {
      const adjVInd = v.adjList[i];
      const adjV = this.vertices[adjVInd];
      adjV.adjList.push(vInd);
    }
  }

  bfs(vertexInd, targetValue) {
    const visited = new Array(this.vertices.length).fill(0);

    const queue = [];
    queue.push(vertexInd);

    while (queue.length > 0) {
      const vInd = queue.shift();

      if (visited[vInd] === 1) {
        continue;
      }

      visited[vInd] = 1;
      const v = this.vertices[vInd];
      if (v.value === targetValue) {
        return true;
      }

      for (let i = 0; i < v.adjList.length; i++) {
        const adjVertInd = v.adjList[i];

        if (visited[adjVertInd] !== 1) {
          queue.push(adjVertInd);
        }
      }
    }
  }

  dfs(vertexInd, targetValue) {
    let isFound = false;
    const visited = new Array(this.vertices.length).fill(0);

    function recursive(vertInd) {
      if (isFound) return;
      if (visited[vertInd] === 1) return;

      visited[vertInd] = 1;
      if (vertices[vertInd].value === targetValue) {
        isFOund = true;
        return;
      }

      for (let i = 0; i < v.adjList.length; i++) {
        const adjVertInd = v.adjList[i];
        if (visited[adjVertInd] === 0) {
          recursive(adjVertInd);
        }
      }
    }
    recursive(vertexInd);
    return isFound;
  }
}
