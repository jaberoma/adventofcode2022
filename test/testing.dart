import 'dart:io';

List<String> loadFile(String filename) {
  var file = File('test/data/$filename');
  return file.readAsLinesSync();
}
