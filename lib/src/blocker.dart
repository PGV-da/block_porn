import 'dart:io';
import 'scripted.dart';

class Blocker {
  List<String> blockList;
  List<String> customBlockList;

  Blocker({List<String>? customBlocks})
      : blockList = [],
        customBlockList = customBlocks ?? [] {
    blockList = readBlock();
  }

  /// Extracts the base part of a URL by splitting it at `/`.
  String extractBase(String url) {
    final parts = url.split("/");
    return parts[0];
  }

  /// Cleans the incoming URL by removing the protocol (http:// or https://).
  String cleanLink(String url) {
    if (url.startsWith(Scripted.httpPrefix)) {
      return url.replaceFirst(Scripted.httpPrefix, "");
    } else if (url.startsWith(Scripted.httpsPrefix)) {
      return url.replaceFirst(Scripted.httpsPrefix, "");
    }
    return url;
  }

  /// Checks if the incoming URL matches any entry in the custom block list.
  bool isCustomBlocked(String url) {
    final cleaned = cleanLink(url);
    final baseUrl = extractBase(cleaned);
    return customBlockList.contains(baseUrl);
  }

  /// Checks if the incoming URL matches any entry in the block list.
  bool isBlocked(String url) {
    final cleaned = cleanLink(url);
    final baseUrl = extractBase(cleaned);
    return blockList.contains(baseUrl);
  }

  /// Reads the block list file and returns the list of blocked URLs.
  List<String> readBlock() {
    final scriptPath = File(Scripted.blockedFilePath).absolute.path;
    final file = File(scriptPath);
    final lines = file.readAsLinesSync();
    if (customBlockList.isNotEmpty) {
      lines.addAll(customBlockList);
    }
    return lines;
  }
}
