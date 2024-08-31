import 'dart:io';

class FileHelper {
  static void createFile(String path, String content) {
    final file = File(path);
    file.createSync(recursive: true);
    file.writeAsStringSync(content);
  }

  static Future<void> addToTheBeginOfFile(String path, String content) async {
    final file = File(path);

    final String fileString = await file.readAsString();

    fileString.trim();

    String newFileContent = "${content.trim()}\n$fileString}";

    await file.writeAsString(newFileContent, mode: FileMode.write);
  }

  static Future<void> addToTheEndOfClass(
    String path,
    String content, {
    String? importContent,
  }) async {
    final file = File(path);

    final String fileString = await file.readAsString();

    fileString.trim();

    int lastIndex = fileString.lastIndexOf('}');
    String newFileContent =
        "${importContent?.trim()}\n${fileString.substring(0, lastIndex)} \n ${content.trim()} \n}";

    await file.writeAsString(newFileContent, mode: FileMode.write);
  }
}
