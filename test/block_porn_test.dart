import 'package:test/test.dart';
import 'package:block_porn/block_porn.dart';

void main() {
  group('Blocker Tests', () {
    test('isBlocked should return true for blocked URLs', () {
      // Initialize Blocker with a custom block list
      final blocker = Blocker(customBlocks: ['example.com', 'blocked.org']);

      expect(blocker.isBlocked('http://example.com'), isTrue);
      expect(blocker.isBlocked('https://example.com'), isTrue);
      expect(blocker.isBlocked('http://blocked.org'), isTrue);
      expect(blocker.isBlocked('https://allowed.net'), isFalse);
    });

    test('isCustomBlocked should return true for custom blocked URLs', () {
      // Initialize Blocker with a custom block list
      final blocker = Blocker(customBlocks: ['customblock.net']);

      expect(blocker.isCustomBlocked('http://customblock.net'), isTrue);
      expect(blocker.isCustomBlocked('https://customblock.net'), isTrue);
      expect(blocker.isCustomBlocked('http://example.com'), isFalse);
    });

    test('cleanLink should remove protocols from URLs', () {
      final blocker = Blocker();

      expect(blocker.cleanLink('http://example.com'), equals('example.com'));
      expect(blocker.cleanLink('https://example.com'), equals('example.com'));
      expect(blocker.cleanLink('example.com'), equals('example.com'));
    });

    test('extractBase should return base URL', () {
      final blocker = Blocker();

      expect(blocker.extractBase('example.com/path'), equals('example.com'));
      expect(blocker.extractBase('example.com'), equals('example.com'));
    });
  });
}
