int puzzle1(List<String> input) {
  File rootFolder = File.folder('/');
  File currentFolder = rootFolder;
  for (var inputLine in input) {
    if (inputLine.startsWith('\$')) {
      String command = inputLine.replaceAll('\$ ', '');
      if (command.startsWith('cd')) {
        List<String> parts = command.split(' ');
        String targetFolder = parts[1];
        currentFolder = '/' == targetFolder
            ? rootFolder
            : (currentFolder.cd(targetFolder) ?? rootFolder);
      }
    } else {
      currentFolder.listFolderResult(inputLine);
    }
  }

  return rootFolder.foldersWhichSizeIsLessOrEqualsTo(100000).fold(
      0, (previousValue, element) => previousValue + element.childrenSize());
}

class File {
  late File? parent;
  String name;
  int size = -1;
  bool folder = false;
  Set<File> children = {};

  File.folder(this.name, [this.parent]) {
    folder = true;
  }

  File.file(this.name, this.size, this.parent) {
    folder = false;
  }

  File? cd(String name) {
    if (name == '..') {
      return parent;
    }
    return children.where((child) => child.name == name && child.folder).first;
  }

  void listFolderResult(String content) {
    List<String> contentParts = content.split(' ');
    contentParts[0] == 'dir'
        ? children.add(File.folder(contentParts[1], this))
        : children
            .add(File.file(contentParts[1], int.parse(contentParts[0]), this));
  }

  int childrenSize() {
    return children.fold(
        0,
        (previousValue, element) =>
            previousValue +
            (element.folder ? element.childrenSize() : element.size));
  }

  Set<File> foldersWhichSizeIsLessOrEqualsTo(int size) {
    Set<File> folders = {};
    for (File child in children) {
      if (child.folder) {
        if (child.childrenSize() <= size) {
          folders.add(child);
        }
        folders.addAll(child.foldersWhichSizeIsLessOrEqualsTo(size));
      }
    }

    return folders;
  }
}
