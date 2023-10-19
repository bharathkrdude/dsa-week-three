void heap(List arr,int n,int i){
  int largest = i;
  int l = 2*i +1;
  int r = 2*i +2;
  if (l <n && arr[l] > arr[largest]) {
    largest = l;
     
  }
}