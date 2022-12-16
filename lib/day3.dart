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

int puzzle2(List<String> rucksacksContent) {
  int prioritiesSum = 0;
  String alphabet = "abcdefghijklmnopqrstuvwxyz";

  String previousContent = '';
  Set<String> commonContentInGroup = Set();
  for (int idx = 0; idx < rucksacksContent.length; idx++) {
    String content = rucksacksContent.elementAt(idx);
    if (previousContent.isEmpty) {
      previousContent = content;
    } else {
      int mod = (idx + 1) % 3;
      if (mod == 0) {
        commonContentInGroup =
            commonContentInGroup.intersection(_stringToSet(content));

        int priorityPosition = alphabet.contains(commonContentInGroup.first)
            ? alphabet.indexOf(commonContentInGroup.first) + 1
            : alphabet.length +
                alphabet.toUpperCase().indexOf(commonContentInGroup.first) +
                1;
        prioritiesSum += priorityPosition;

        commonContentInGroup.clear();
        previousContent = '';
      } else {
        commonContentInGroup =
            _stringToSet(previousContent).intersection(_stringToSet(content));
        previousContent = content;
      }
    }
  }

  return prioritiesSum;
}

Set<String> _stringToSet(String content) {
  return content.split('').toSet();
}
