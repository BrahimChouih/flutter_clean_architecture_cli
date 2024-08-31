import 'dart:io';

class FileHelper {
  static void createFile(String path, String content) {
    final file = File(path);
    file.createSync(recursive: true);
    file.writeAsStringSync(content);
  }

  static void addToTheBeginOfFile(String path, String content) {
    final file = File(path);

    final String fileString = file.readAsStringSync();

    fileString.trim();

    String newFileContent = "${content.trim()}\n$fileString}";

    file.writeAsStringSync(newFileContent, mode: FileMode.write);
  }

  static void addToTheClass(
    String path, {
    String? endOfClass,
    String? biginOfClass,
    String? importContent,
  }) {
    final file = File(path);

    final String fileString = file.readAsStringSync();

    fileString.trim();
    String newFileContent = fileString;

    if (importContent != null) {
      newFileContent = "${importContent.trim()}\n$newFileContent}";
    }

    if (biginOfClass != null) {
      int lastIndex = newFileContent.indexOf('{');
      newFileContent =
          "${newFileContent.substring(0, lastIndex)}\n { ${biginOfClass.trim()}\n${newFileContent.substring(lastIndex)}";
    }

    if (endOfClass != null) {
      int lastIndex = newFileContent.lastIndexOf('}');
      newFileContent =
          "${newFileContent.substring(0, lastIndex)} \n ${endOfClass.trim()} \n}";
    }

    file.writeAsStringSync(newFileContent, mode: FileMode.write);
  }
}
