import 'package:block_porn/block_porn.dart';

void main() {
  // ======[ BLOCK URL ]======
  final url1 = "https://xxx.com";

  final blocker1 = Blocker();
  final resu1 = blocker1.isBlocked(url1);

  print("Is '$url1' blocked? $resu1");

  // ======[ ADD MORE SITES ]======
  final url2 = "https://xxx.dc";
  final customBlocks = ["xxx.db", "xxx.dc"];

  final blocker2 = Blocker(customBlocks: customBlocks);
  final resu2 = blocker2.isBlocked(url2);

  print("Is '$url2' blocked with custom blocks? $resu2");

  // ======[ CUSTOM BLOCK ]======
  final url3 = "https://xxx.me";
  final customBlocks2 = ["xxx.me", "xxx.ms"];

  final blocker3 = Blocker(customBlocks: customBlocks2);
  final resu3 = blocker3.isCustomBlocked(url3);

  print("Is '$url3' custom blocked? $resu3");

  // ======[ LOAD FILE ]======
  final loader = LoadeR();
  final path = "assets/blocked.txt";

  final resu4 = loader.loadFile(path);
  print("Number of blocked sites in file: ${resu4.length}");
}
