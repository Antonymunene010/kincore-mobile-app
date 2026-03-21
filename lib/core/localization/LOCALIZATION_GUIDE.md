/// Localization Guide for Kincore App
/// 
/// This guide explains how to use the localization system in the app.
/// The app uses GetX Translations for complete multilingual support.
/// 
/// ============================================================
/// SUPPORTED LANGUAGES
/// ============================================================
/// - English (en_US)
/// - Chinese Simplified (zh_CN)
/// - Spanish (es_ES)
/// - Malay (ms_MY)
/// - Japanese (ja_JP)
/// 
/// ============================================================
/// BASIC USAGE IN WIDGETS
/// ============================================================
/// 
/// 1. Simple Text Translation:
/// ```dart
/// AppText('home.welcome'.tr)
/// ```
/// 
/// 2. Using with Text widget:
/// ```dart
/// Text('btn.confirm'.tr)
/// ```
/// 
/// 3. In CustomButton:
/// ```dart
/// CustomButton(
///   text: 'auth.login_btn'.tr,
///   onPressed: () {},
/// )
/// ```
/// 
/// 4. In CustomInputField:
/// ```dart
/// CustomInputField(
///   label: 'auth.email_label'.tr,
///   hint: 'auth.email_hint'.tr,
/// )
/// ```
/// 
/// ============================================================
/// CHANGING LANGUAGE AT RUNTIME
/// ============================================================
/// 
/// Use LocalizationService to switch languages:
/// ```dart
/// import 'package:kincore_app/core/localization/localization_service.dart';
/// 
/// // Change to Chinese
/// await LocalizationService.changeLanguage('zh_CN');
/// 
/// // Change to Spanish
/// await LocalizationService.changeLanguage('es_ES');
/// 
/// // Get current locale
/// var currentLocale = LocalizationService.locale;
/// ```
/// 
/// ============================================================
/// ADDING NEW TRANSLATION KEYS
/// ============================================================
/// 
/// 1. Add the key to ALL language files:
///    - en_US.dart
///    - zh_CN.dart
///    - es_ES.dart
///    - ms_MY.dart
///    - ja_JP.dart
/// 
/// Example in en_US.dart:
/// ```dart
/// 'new_key': 'Your English text here',
/// ```
/// 
/// Example in zh_CN.dart:
/// ```dart
/// 'new_key': '您的中文文本在这里',
/// ```
/// 
/// 2. Use in your widget:
/// ```dart
/// Text('new_key'.tr)
/// ```
/// 
/// ============================================================
/// KEY NAMING CONVENTIONS
/// ============================================================
/// 
/// Follow this hierarchical naming pattern:
/// 
/// Category.Subcategory.Item
/// 
/// Examples:
/// - 'auth.login_btn' - Authentication > Login Button
/// - 'home.welcome' - Home Screen > Welcome Message
/// - 'family.add_member' - Family > Add Member
/// - 'error.required_field' - Error > Required Field
/// - 'success.saved' - Success > Saved Message
/// - 'hint.search' - Hint > Search Placeholder
/// 
/// Common Categories:
/// - app.* - General app strings
/// - auth.* - Authentication
/// - btn.* - Button text
/// - nav.* - Navigation
/// - home.* - Home screen
/// - family.* - Family members
/// - event.* - Events
/// - feed.* - Feed/Posts
/// - memory.* - Memories
/// - profile.* - Profile
/// - mall.* - Shopping/K-Mall
/// - redeem.* - Coin redemption
/// - tree.* - Family tree
/// - error.* - Error messages
/// - success.* - Success messages
/// - hint.* - Placeholder/hint text
/// - msg.* - General messages
/// 
/// ============================================================
/// WORKING WITH GETX TRANSLATIONS
/// ============================================================
/// 
/// The app uses GetX's Translations class. Key points:
/// 
/// 1. All translations are in language files (en_US.dart, zh_CN.dart, etc.)
/// 2. Use .tr extension to translate any string
/// 3. Automatic locale detection is NOT enabled (we use default)
/// 4. Manual language switching via LocalizationService
/// 
/// ============================================================
/// EXAMPLE: UPDATE A SCREEN TO USE LOCALIZATION
/// ============================================================
/// 
/// Before:
/// ```dart
/// AppText(
///   "Welcome to Your Family Tree",
///   fontSize: 20,
/// )
/// ```
/// 
/// After:
/// ```dart
/// AppText(
///   'home.welcome'.tr,
///   fontSize: 20,
/// )
/// ```
/// 
/// ============================================================
/// TESTING TRANSLATIONS
/// ============================================================
/// 
/// 1. Change language in language selection screen
/// 2. All text should update automatically
/// 3. Missing translations will show key name (e.g., 'key.name')
/// 
/// ============================================================
/// SPECIAL CASES
/// ============================================================
/// 
/// Pluralization (if needed in future):
/// Use GetX's translation with parameters:
/// ```dart
/// // In translation file:
/// 'family.members_count': '{count} members',
/// 
/// // In code:
/// 'family.members_count'.trParams({'count': '5'})
/// ```
/// 
/// ============================================================
/// NEXT STEPS FOR FULL IMPLEMENTATION
/// ============================================================
/// 
/// 1. Update all screen files to use .tr for hardcoded strings
/// 2. Update all widget files to use .tr for hardcoded strings
/// 3. Test all screens with different languages
/// 4. Add SharedPreferences to persist user's language choice
/// 5. (Optional) Add RTL support for Arabic if needed
/// 
/// ============================================================
/// FILE ORGANIZATION
/// ============================================================
/// 
/// lib/core/localization/
/// ├── app_translations.dart        # Main translations class
/// ├── localization_service.dart    # Language switching service
/// ├── en_US.dart                   # English translations
/// ├── zh_CN.dart                   # Chinese translations
/// ├── es_ES.dart                   # Spanish translations
/// ├── ms_MY.dart                   # Malay translations
/// └── ja_JP.dart                   # Japanese translations
/// 
/// ============================================================
/// RESOURCES
/// ============================================================
/// 
/// - GetX Documentation: https://github.com/jonataslaw/getx
/// - GetX Translations: https://github.com/jonataslaw/getx/wiki/Translations
/// 
/// ============================================================
