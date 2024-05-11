import 'package:kunlesany/shared/network/local/cache_helper.dart';
Future<bool> onBoarding = CacheHelper.saveData(key: "onBoarding",value: false);
Future<bool> isDark = CacheHelper.saveData(key: "isDark", value: false);