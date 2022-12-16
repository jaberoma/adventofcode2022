String _alphabet = "abcdefghijklmnopqrstuvwxyz";

int puzzle1(List<String> rucksacksContent) {
  int prioritiesSum = 0;

  for (var content in rucksacksContent) {
    Set<String> firstHalf =
        _stringToSet(content.substring(0, content.length ~/ 2));
    Set<String> secondHalf =
        _stringToSet(content.substring(content.length ~/ 2));
    Set<String> commonContent = firstHalf.intersection(secondHalf);
    prioritiesSum += _calculatePriority(commonContent.first);
  }

  return prioritiesSum;
}

int puzzle2(List<String> rucksacksContent) {
  int prioritiesSum = 0;

  String previousContent = '';
  Set<String> commonContentInGroup = {};
  for (int idx = 0; idx < rucksacksContent.length; idx++) {
    String content = rucksacksContent.elementAt(idx);
    if (previousContent.isEmpty) {
      previousContent = content;
    } else {
      int mod = (idx + 1) % 3;
      if (mod == 0) {
        commonContentInGroup =
            commonContentInGroup.intersection(_stringToSet(content));
        prioritiesSum += _calculatePriority(commonContentInGroup.first);

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

int _calculatePriority(String symbol) {
  return _alphabet.contains(symbol)
      ? _alphabet.indexOf(symbol) + 1
      : _alphabet.length + _alphabet.toUpperCase().indexOf(symbol) + 1;
}
