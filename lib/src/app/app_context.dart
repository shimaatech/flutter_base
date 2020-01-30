import 'package:flutter/cupertino.dart';

import '../../flutter_base.dart';

abstract class BaseAppContext {

  @protected
  final Locator locator = KiwiLocator();

  T locate<T>([String name]) => locator.locate<T>(name);

  Future<void> setup();

}

