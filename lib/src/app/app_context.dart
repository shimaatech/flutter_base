import '../../flutter_base.dart';

abstract class BaseAppContext {

  final Locator _locator = KiwiLocator();

  T locate<T>([String name]) => _locator.locate<T>(name);

  Future<void> setup();

}

