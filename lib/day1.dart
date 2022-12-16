import 'dart:math';
import 'dart:collection';

int puzzle1(List<String> elvesCalories) {
  int maxCalories = 0;
  int currentElfCalories = 0;

  for (var calories in elvesCalories) {
    if (calories.isEmpty) {
      maxCalories = max(maxCalories, currentElfCalories);
      currentElfCalories = 0;
    } else {
      currentElfCalories += int.parse(calories);
    }
  }

  return maxCalories;
}

int puzzle2(List<String> elvesCalories) {
  SplayTreeSet<int> sortedCalories = SplayTreeSet();
  int currentElfCalories = 0;
  for (var calories in elvesCalories) {
    if (calories.isEmpty) {
      sortedCalories.add(currentElfCalories);
      currentElfCalories = 0;
    } else {
      currentElfCalories += int.parse(calories);
    }
  }

  return sortedCalories
      .toList()
      .reversed
      .take(3)
      .fold(0, (prev, element) => prev + element);
}
