# Flutter LoginUI with Localiation resources

A Flutter project using i18n resources with Intl.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Commands:
flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/localizations.dart 
flutter pub run intl_translation:generate_from_arb --output-dir=lib/l10n use-deferred-loading=false lib/localizations.dart lib/l10n/intl_en.arb
flutter pub run intl_translation:generate_from_arb --output-dir=lib/l10n use-deferred-loading=false lib/localizations.dart lib/l10n/intl_pt.arb



