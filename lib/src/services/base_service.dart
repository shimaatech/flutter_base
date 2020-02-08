import 'package:flutter_base/src/abstract/abstract.dart';

abstract class InitializableService extends Initializable {

}


/// A simple service that doesn't need initialization
abstract class BaseService extends InitializableService {

  /// [SimpleService] should be initialized in the constructor.
  @override
  bool get initialized => true;

  /// Don't override the [doInitialize] method, as simple service should
  /// be initialized in the constructor
  @deprecated
  @override
  Future<void> doInitialize() async {}

}