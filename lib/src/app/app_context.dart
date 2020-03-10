import 'package:flutter/cupertino.dart';

import '../../flutter_base.dart';

abstract class AppContext {

  Locator _locator;

  AppContext() {
    _locator = setupLocator();
  }

  @protected
  Locator setupLocator() {
    return KiwiLocator();
  }

  @protected
  Locator get locator => _locator;

  T locate<T>([String name]) => locator.locate<T>(name);

  Future<void> configure();

}

abstract class ContextConfiguration {
  Future<void> configure(Locator locator);
}

