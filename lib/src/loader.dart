import 'dart:io';
import 'scripted.dart';

class LoadeR {
  /// Reads the file from the given location and returns its content as a list of lines.
  List<String> loadFile(String filePath) {
    final file = File(filePath);
    return file.readAsLinesSync();
  }

  /// Reads the predefined file (Scripted.blockedFilePath) and returns its content as a list of lines.
  List<String> readFile() {
    final scriptPath = File(Scripted.blockedFilePath).absolute.path;
    final file = File(scriptPath);
    return file.readAsLinesSync();
  }
}
