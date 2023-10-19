void heapify(List list, int n, int i) {
  int largest = i;
  int l = 2*i + 1;
  int r = 2*i + 2;

  if (l < n && list[l] > list[largest]) {
    largest = l;
  }

  if (r < n && list[r] > list[largest]) {
    largest = r;
  }

  if (largest != i) {
    swapList(list, i, largest);
    heapify(list, n, largest);
  }
}

void swapList(List list, int i, int largest) {
  int swap = list[i];
  list[i] = list[largest];
  list[largest] = swap;
}

void heapSort(List list){
  int n = list.length;
  for (int i = (n ~/ 2 ) ; i >= 0; i--){
    heapify(list, n, i);
  }

  for (int i = n-1; i>=0; i--) {
    swap(list, i);
    heapify(list, i, 0);
  }
}

void swap(List list, int i) {
  int temp = list[0];
  list[0] = list[i];
  list[i] = temp;
}

class MaxBinaryHeap {
  List<int> values = [];


  void insert(int value) {
    values.add(value);
    int index = values.length - 1;
    int parent = ((index - 1) / 2).floor();


    while (index > 0 && values[index] > values[parent]) {
      // swap values[index] and values[parent]
      int temp = values[index];
      values[index] = values[parent];
      values[parent] = temp;


      index = parent;
      parent = ((index - 1) / 2).floor();
    }
  }


  int extractMax() {
    int max = values[0];
    int end = values.removeLast();


    if (values.isNotEmpty) {
      values[0] = end;
      heapify(0);
    }


    return max;
  }


  void heapify(int index) {
    int maxIndex = index;
    int leftChildIndex = 2 * index + 1;
    int rightChildIndex = 2 * index + 2;


    if (leftChildIndex < values.length && values[leftChildIndex] > values[maxIndex]) {
      maxIndex = leftChildIndex;
    }


    if (rightChildIndex < values.length && values[rightChildIndex] > values[maxIndex]) {
      maxIndex = rightChildIndex;
    }


    if (maxIndex != index) {
      // swap values[index] and values[maxIndex]
      int temp = values[index];
      values[index] = values[maxIndex];
      values[maxIndex] = temp;
      heapify(maxIndex);  
    }
  }


  void display() {
    print(values);
  }


  void buildHeap(List<int> arr) {
    for (int i = 0; i < arr.length; i++) {
      insert(arr[i]);
    }
  }
}


void main() {
  MaxBinaryHeap heap = MaxBinaryHeap();
  heap.buildHeap([10, 20, 15, 55, 25, 35, 615, 195]);
  heap.display();
}
