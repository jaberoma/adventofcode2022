int puzzle1(String buffer) {
  String fourDifferentChars = '';
  for (int idx = 0; idx < buffer.length; idx++) {
    String char = buffer[idx];
    if (!fourDifferentChars.contains(char)) {
      fourDifferentChars += char;
      if (fourDifferentChars.length == 4) {
        return idx + 1;
      }
    } else {
      fourDifferentChars =
          fourDifferentChars.substring(fourDifferentChars.indexOf(char) + 1) +
              char;
    }
  }
  return -1;
}
