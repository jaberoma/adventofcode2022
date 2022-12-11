int puzzle1(List<String> rucksacksContent) {
  int prioritiesSum = 0;
  String alphabet = "abcdefghijklmnopqrstuvwxyz";

  rucksacksContent.forEach((String content) {
    Set<String> firstContent =
        content.substring(0, content.length ~/ 2).split('').toSet();
    Set<String> secondContent =
        content.substring(content.length ~/ 2).split('').toSet();
    Set<String> commonContent = firstContent.intersection(secondContent);
    int priorityPosition = alphabet.contains(commonContent.first)
        ? alphabet.indexOf(commonContent.first) + 1
        : alphabet.length +
            alphabet.toUpperCase().indexOf(commonContent.first) +
            1;
    prioritiesSum += priorityPosition;
  });

  return prioritiesSum;
}
