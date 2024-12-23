# Changelog

## [1.0.0] - initial version

### Added

- Initial release of the `block_porn` package.
- Added `Blocker` class for URL blocking functionality.
- Included predefined list of blocked URLs in `assets/blocked.txt`.
- Added support for custom URL blocking through `customBlocks` parameter.
- Implemented utility methods:
  - `isBlocked` to check if a URL is blocked.
  - `isCustomBlocked` to check if a URL matches custom blocked URLs.
  - `cleanLink` to normalize URLs by removing protocols.
  - `extractBase` to extract the base domain from URLs.
