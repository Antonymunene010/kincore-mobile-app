import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'select_language': 'Select Your Language!',
      'language_desc':
      'Choose your preferred language for the app.',
      'confirm_language': 'Confirm language',
      'english': 'English',
      'chinese': 'Chinese',
    },
    'zh_CN': {
      'select_language': '选择您的语言',
      'language_desc': '选择您喜欢的应用语言',
      'confirm_language': '确认语言',
      'english': '英语',
      'chinese': '中文',
    },
  };
}
