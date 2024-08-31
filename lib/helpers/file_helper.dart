import 'dart:io';

class FileHelper {
  static void createFile(String path, String content) {
    final file = File(path);
    file.createSync(recursive: true);
    file.writeAsStringSync(content);
  }

  static void addToTheBeginOfFile(String path, String content) async {
    final file = File(path);

    final String fileString = await file.readAsString();

    fileString.trim();

    String newFileContent = "${content.trim()}\n$fileString}";

    file.writeAsString(newFileContent, mode: FileMode.write);
  }

  static void addToTheEndOfClass(String path, String content) async {
    final file = File(path);

    final String fileString = await file.readAsString();

    fileString.trim();

    int lastIndex = fileString.lastIndexOf('}');

    String newFileContent =
        "${fileString.substring(0, lastIndex)} \n ${content.trim()} \n }";

    file.writeAsString(newFileContent, mode: FileMode.write);
  }
}
