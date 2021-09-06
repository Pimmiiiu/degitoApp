void logicalThinking() {
  List<int> dataset1 = [10, 13, 25, 30, 12, 18, 5, 7];
  List<int> dataset2 = [9, 26, 1, 14, 11, 41, 6, 12];
  List<int> dataset = dataset2;
  int? wolfFirst;
  int? wolfSecond;
  int total = 0; // 120
  for (int i = 0; i < dataset.length; i++) {
    total = total + dataset[i];
    for (int j = 0; j < dataset.length; j++) {
      if (j != i) {
        if (dataset[i] + dataset[j] == 20) {
          wolfFirst = dataset[i];
          wolfSecond = dataset[j];
          break;
        }
      }
      if (wolfFirst != null) {
        break;
      }
    }
  }
  dataset.remove(wolfFirst);
  dataset.remove(wolfSecond);
  print(dataset);
  print(total);
}