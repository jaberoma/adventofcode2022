import 'dart:math';

int puzzle1(List<String> elvesCalories) {
  int maxCalories = 0;
  int currentElfCalories = 0;

  elvesCalories.forEach((calories) {
    print("Processing $calories calories");
    if (calories.isEmpty) {
      maxCalories = max(maxCalories, currentElfCalories);
      currentElfCalories = 0;
    } else {
      currentElfCalories += int.parse(calories);
    }
  });

  return maxCalories;
}
