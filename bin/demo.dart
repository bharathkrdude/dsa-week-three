import 'Heaps/heap.dart';

heapify(List arr,int n,int i){
 int largest = i;
 int leftChildIndex = 2*i+1;
 int rightChildIndex =2*i+2;
 if(leftChildIndex<n && arr[leftChildIndex]> arr[largest]){
  largest = leftChildIndex;
 }
 if (rightChildIndex <n&& arr[rightChildIndex>arr[largest]]){
  largest = rightChildIndex;
 }
 if(largest != i){
  swaparr(arr, i, largest);
  heapify(arr, n, largest);
 }
}
swaparr(List arr,int i,int largest){
  int swap = arr[i];
  arr[i] = arr[largest];
  arr[largest] = swap;
}
void heapSort(List arr){
  int n= arr.length;
  for (int i = (n~/2);i>=0;i--){
    heapify(arr, n, i);
  }
  for(int i =n-1;i>=0;i--){
    swap(arr, i);
    heapify(arr, i, 0);
  }
}
swap (List arr)

 bool isBST(Node? root,{dynamic min = null,dynamic max = null}){
  if(root == null){
    return true;
  }
  if((min != null && root.data! <=min ) || (max != null && root.data! >= max )){
    return false;
  }
  if(!isBST(root.left,min: min,max: root.data)|| !isBST(root.right,min: root.data,max: max)){
    return false;
  }
  return true;
 }
void main(List<String> args) {
  List arr = [45,90,23,12,56,32];
  heapSort(arr);
  print(arr);
}