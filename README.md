# block_porn

A Dart package to block and filter inappropriate or unwanted URLs. Designed to help developers integrate URL filtering capabilities into their applications with custom and predefined blocked lists.

## Features

- Block predefined URLs using the included `blocked.txt` file.
- Add custom URLs to your block list.
- Lightweight and easy-to-use API.
- Includes utility methods for URL cleaning and validation.

## Getting Started

### Installation

Add `block_porn` to your Dart project's `pubspec.yaml` file:

```yaml
dependencies:
  block_porn: ^1.0.0
```

Then run:

```bash
dart pub get
```

### Import the Package

```dart
import 'package:block_porn/block_porn.dart';
```

## Usage

### 1. Blocking a URL

Use the `Blocker` class to check if a URL is blocked:

```dart
import 'package:block_porn/block_porn.dart';

void main() {
  final blocker = Blocker();

  final url = 'https://example.com';
  final isBlocked = blocker.isBlocked(url);

  print('Is "$url" blocked? $isBlocked');
}
```

### 2. Adding Custom Blocked URLs

Add custom URLs to the block list:

```dart
import 'package:block_porn/block_porn.dart';

void main() {
  final customBlocks = ['customblock.net', 'example.org'];
  final blocker = Blocker(customBlocks: customBlocks);

  final url = 'https://customblock.net';
  print('Is "$url" blocked? ${blocker.isCustomBlocked(url)}');
}
```

## Assets

The package includes a file `assets/blocked.txt` with a large list of predefined blocked URLs. You can add more entries to this file if needed.

## License

This package is licensed under the [MIT License](LICENSE).
