import 'package:get/get.dart';
import 'package:kincore_app/core/localization/en_US.dart';
import 'package:kincore_app/core/localization/zh_CN.dart';
import 'package:kincore_app/core/localization/zh_CN_new.dart';

import 'es_ES.dart';
import 'es_ES_new.dart';
import 'ja_JP.dart';
import 'ja_JP_new.dart';
import 'ms_MY.dart';
import 'ms_MY_new.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'zh_CN': zhCN,
    'es_ES': esES,
    'ms_MY': msMY,
    'ja_JP': jaJP,
  };
}
