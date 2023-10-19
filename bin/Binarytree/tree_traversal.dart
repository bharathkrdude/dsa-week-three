// class Node {
//   late int item;
//  late Node left, right;

//   Node(int key){
//     item = key;
//     left = null;
//     right = null;
//   }
// }

// class BinaryTree {
//    Node? root;

//   BinaryTree(){
//     root = null;
//   }

//   void postOrderTraversal(Node? node){
//     if (node == null) return;
//     postOrderTraversal(node.left);
//     postOrderTraversal(node.right);
//     print("${node.item} ->");
//   }

//   void inOrderTraversal(Node? node){
//     if (node == null) return;
//     inOrderTraversal(node.left);
//     print("${node.item} ->");
//     inOrderTraversal(node.right);
//   }

//   void preOrderTraversal(Node? node){
//     if (node == null) return;
//     print("${node.item} ->");
//     preOrderTraversal(node.left);
//     preOrderTraversal(node.right);
//   }
//   // check for full binary tree
//   bool? isFullBinaryTree(Node node){
//     //chek if tree is empty
//     if(node == null) return true;
//     if(node.left == null && node.right == null) return true;
//     // 3- Checking all the sub trees
//     if((node.left !=null) && (node.right != null)){
//       return (isFullBinaryTree(node.left) && isFullBinaryTree(node.right));
//     }
//     return false;
//   }

// }

// void main(List<String> args) {
//   BinaryTree tree = BinaryTree();
//   tree.root = Node(1);
//   tree.root!.left = Node(12);
//   tree.root!.right = Node(9);
//   tree.root!.left.left = Node(5);
//   tree.root!.left.right = Node(6);

//   print("In order Traversal");
//   tree.inOrderTraversal(tree.root);
//   print("Preorde Traversal");
//   tree.preOrderTraversal(tree.root);
//   print("Postorder Traversal");
//   tree.postOrderTraversal(tree.root);
// }

import 'dart:collection';

import 'Binaryone.dart';

class Node {
  late int item;
  late Node? left, right;

  Node(int key) {
    item = key;
    left = null;
    right = null;
  }
}

class BinaryTree {
  Node? root;

  BinaryTree() {
    root = null;
  }

  void postOrderTraversal(Node? node) {
    if (node == null) return;
    postOrderTraversal(node.left);
    postOrderTraversal(node.right);
    print("${node.item} ->");
  }

  void inOrderTraversal(Node? node) {
    if (node == null) return;
    inOrderTraversal(node.left);
    print("${node.item} ->");
    inOrderTraversal(node.right);
  }

  void preOrderTraversal(Node? node) {
    if (node == null) return;
    print("${node.item} ->");
    preOrderTraversal(node.left);
    preOrderTraversal(node.right);
  }

  bfs() {
    final queue = Queue<Node>();
    queue.addLast(root!);
    while (queue.isNotEmpty) {
      var current = queue.removeFirst();
      print(current.item);
      if (current.left != null) {
        queue.addLast(current.left!);
      }
      if (current.right != null) {
        queue.addLast(current.right!);
      }
    }
  }

 bool isBST(Node? root, {dynamic min = null, dynamic max = null}) {
  if (root == null) {
    return true;
  }
  if ((min != null && root.item <= min) || (max != null && root.item >= max)) {
    return false;
  }
  if (!isBST(root.left, min: min, max: root.item) || !isBST(root.right, min: root.item, max: max)) {
    return false;
  }
  return true;
}

  bool isFullBinaryTree(Node root) {
    if (root.left == null && root.right == null) return true;
    if (root.left != null && root.right != null) {
      return isFullBinaryTree(root.left!) && isFullBinaryTree(root.right!);
    }
    return false;
  }

  bool isCompleteBinaryTree(Node root) {
    if (root == null) {
      return true;
    }
    final queue = Queue<Node>();
    var flag = false;
    queue.addLast(root);
    while (queue.isNotEmpty) {
      var tempNode = queue.removeFirst();
      if (tempNode.left != null) {
        if (flag == true) {
          return false;
        }
        queue.addLast(tempNode.left!);
      } else {
        flag = true;
      }
      if (tempNode.right != null) {
        if (flag == true) {
          return false;
        }
        queue.addLast(tempNode.right!);
      } else {
        flag = true;
      }
    }
    return true;
  }
}

void main(List<String> args) {
  BinaryTree tree = BinaryTree();
  // tree.root = Node(1);
  // tree.root!.left = Node(12);
  // tree.root!.right = Node(9);
  // tree.root!.left!.left = Node(5);
  // tree.root!.left!.right = Node(6);

  // print("In order Traversal");

  // tree.inOrderTraversal(tree.root);
  // print("Preorder Traversal");
  // tree.preOrderTraversal(tree.root);
  // print("Postorder Traversal");
  // tree.postOrderTraversal(tree.root);
  tree.root = Node(1);
  tree.root!.left = Node(2);
  tree.root!.right = Node(3);
  tree.root!.left!.left = Node(4);
  tree.root!.left!.right = Node(5);
  tree.root!.right!.left = Node(6);
  tree.root!.right!.right = Node(7);
  tree.isBST(tree.root);
  print("${tree.isBST(tree.root)}");
}
