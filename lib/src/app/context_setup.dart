import '../../flutter_base.dart';

abstract class ContextSetup {
  Future<void> setup(Locator locator);
}
