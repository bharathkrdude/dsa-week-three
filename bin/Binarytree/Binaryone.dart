// class Node {
//   late int item;
//   late Node? left , right;
//   Node(int data){
//     item = data;
//     left = null;
//     right = null;
//   }
  
// }
// class Binary {
//   Node? root;
//   Binary(){
//     root = null;
//   }
//   isEmpty(){
//     if(root == null){
//       return true;
//     }
//   }
//   insert(int data){
//     Node newNode = Node(data);
//     if (isEmpty()) {
//       root = newNode;
//     }
//     else{
//       insertNode(this.root!,newNode);
//     }
//   }
//  insertNode(Node current, Node newNode){
//   if (newNode.item < current.item) {
//     if(current.left == null){
//       current.left = newNode;
//     }else{
//       insertNode(current.left, newNode);
//     }
//   }
//  }
// }

import 'dart:collection';

class Node{
  int? data;
  Node? left,right;
  Node(this.data);
}

class BST{

  Node? root;

  insert(int data){
    Node newNode = Node(data);
    if(root == null){
      root = newNode;
      return;
    }else{
      Node? curr = root;
      while(true){
        if(newNode.data! < curr!.data!){
          if(curr.left == null){
            curr.left = newNode;
            return;
          }else{
           curr = curr.left;
          }
        }else if(newNode.data! > curr.data!){
          if(curr.right == null){
            curr.right = newNode;
            return;
          }else{
            curr = curr.right;
          }
        }else{
          print('${newNode.data} is already in the tree');
          return;
        }
      }

    }
  }


 }

void main(List<String> args) {
  BST bst = BST();
  bst.insert(1);
  bst.insert(12);
  bst.insert(14);
  bst.insert(16);
  bst.insert(18);
  bst.insert(19);
}
