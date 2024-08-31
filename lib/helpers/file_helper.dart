import 'dart:io';
import 'package:flutter_clean_architecture_cli/extensions/extension.dart';

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
    String endOfClass = '',
    String biginOfClass = '',
    String importContent = '',
  }) {
    final file = File(path);

    final String fileString = file.readAsStringSync();

    fileString.trim();
    String newFileContent = fileString;

    final beginClassIndex = newFileContent.whereFirst('{');
    final endClassIndex = newFileContent.whereLast('}');

    newFileContent = """
${importContent.trim()}
${newFileContent.substring(0, beginClassIndex)} {
$biginOfClass
${newFileContent.substring(beginClassIndex + 1, endClassIndex)}
$endOfClass
}
""";

    file.writeAsStringSync(newFileContent, mode: FileMode.write);
  }
}
