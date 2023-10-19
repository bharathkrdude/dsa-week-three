class Graph {
  
  Map<String, List<String>> aList;


  Graph() : aList = {};

  void addVertex(String vertex) {
    aList[vertex] = [];
  }


  void addEdge(String v1, String v2) {
    aList[v1]?.add(v2);
    aList[v2]?.add(v1);
  }


  void removeEdge(String v1, String v2) {
    if (aList.containsKey(v1) && aList.containsKey(v2)) {
      aList[v1]?.remove(v2);
      aList[v2]?.remove(v1);
    }
  }


  void removeVertex(String vertex) {
    if (aList.containsKey(vertex)) {
      List<String> connections = List.from(aList[vertex]!);
      for (String connection in connections) {
        removeEdge(vertex, connection);
      }
      aList.remove(vertex);
    }
  }


  void dfs(String start) {
    List<String> result = [];
    Map<String, bool> visited = {};
    dfsHelper(start, visited, result);
    print(result);
  }


  void dfsHelper(String vertex, Map<String, bool> visited, List<String> result) {
    if (!visited.containsKey(vertex)) {
      visited[vertex] = true;
      result.add(vertex);
      for (String neighbor in aList[vertex]!) {
        dfsHelper(neighbor, visited, result);
      }
    }
  }


  void display() {
    print(aList);
  }
}


void main() {
  Graph graph = Graph();
  graph.addVertex("A");
  graph.addVertex("B");
  graph.addVertex("C");
  graph.addVertex("D");
  graph.addVertex("E");
  graph.addVertex("F");
  graph.addEdge("A", "B");
  graph.addEdge("A", "C");
  graph.addEdge("B", "D");
  graph.addEdge("C", "E");
  graph.addEdge("D", "E");
  graph.addEdge("D", "F");
  
  graph.display();
 
}
