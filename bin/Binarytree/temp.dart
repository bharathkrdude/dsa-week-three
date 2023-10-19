import 'dart:collection';

class Node {
  late int item;
  late Node? left,right;

  Node(int key){
    item = key;
    left = null;
    right = null;
  }
}
class BinaryTree {
  Node? root;
  BinaryTree(){
    root = null;
  }
  void postOrderTraversal(Node? node){
    if(node == null ) return;
    postOrderTraversal(node.left);
    postOrderTraversal(node.right);
    print("${node.item} ->");
  }
  void inOrderTraversal(Node? node){
    if(node == null) return;
    inOrderTraversal(node.left);
    print("${node.item} ->");
    inOrderTraversal(node.right);
  }

  bfs(){
    final queue = Queue<Node>();
    queue.addLast(root!);
    while (queue.isNotEmpty) {
      var current = queue.removeFirst();
      print(current.item);
      if (current.left!=null) {
        queue.addLast(current.left!);
        if (current.right != null) {
          queue.addLast(current.right!);
        }
      }
    }
  }
  isBST(Node root, {dynamic min = null,dynamic max = null}){
    if (root == null) {
      return true;
    }
    if ((min !=null && root.item <=min) || (max !=null && root.item>=max)) {
      return false;
    }
    if ((isBST(root.left!,min: min,max: root.item)!=null || (isBST(root.right!,min: root.item,max: max)!=null))) {
      return false;
    }
    return true;
  }
}
class MaxBinaryHeap {
  List<int> values = [];
  void insert(int value){
    values.add(value);
    int index = values.length-1;
    int parent = ((index -1)/2).floor();
    while (index > 0 && values[index] > values[parent]) {
      int temp = values[index];
      values[index] = values[parent];
      values[parent] = temp;

      index = parent ;
      parent = ((index-1)/2).floor();
    }
  }
}

class Graph {
  Map<String, List<String>> aList;
  Graph() : aList ={};
  void addVertex(String Vertex){
    aList[Vertex] = [];
  }
  void addEdge(String v1, String v2){
    aList[v1]?.add(v2);
    aList[v2]?.add(v1);
  }
  void removeEdge(String v1,String v2){
    if(aList.containsKey(v1) && aList.containsKey(v2)){
      aList[v1]?.remove(v2);
      aList[v2]?.remove(v1);
    }
  }
  void removeVertex(String vertex){
    if (aList.containsKey(vertex)) {
      List<String> connections = List.from(aList[vertex]!);
      for (String connection in connections) {
        removeEdge(vertex, connection);
      }
      aList.remove(vertex);
    }
  }
}

class Nodes {
  late int item;
  late Nodes? left, right;
  Node(int key){
    item = key;
    left = null;
    right = null;
  }
  
}class BSR{
    Nodes? root;
    BSR(){
      root = null;
    }
  }
  void main(List<String> args) {
  
}