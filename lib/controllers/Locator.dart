import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import 'package:marutiseva/widgets/navigation_bar_web.dart';
import 'package:marutiseva/utils/index_incrementer.dart';

GetIt getItLocator = GetIt.instance;
Future<dynamic> setupLocator() async {
  // getItLocator.registerLazySingleton(() => NavigationBarCustom());
  getItLocator.registerSingleton(const NavigationBarCustom());
  IndexIncrementNotifier dashboardValueNotifier = IndexIncrementNotifier(
    value: IndexIncrement(tabIndex: ValueNotifier<int>(0)),
  );
  getItLocator.registerSingleton(dashboardValueNotifier);
}
