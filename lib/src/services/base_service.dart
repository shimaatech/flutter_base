import 'package:flutter_base/src/abstract/abstract.dart';

abstract class BaseService extends Initializable {

}


/// A simple service that doesn't need initialization
abstract class SimpleService extends BaseService {

  /// [SimpleService] should be initialized in the constructor.
  @override
  bool get initialized => true;

  /// Don't override the [doInitialize] method, as simple service should
  /// be initialized in the constructor
  @deprecated
  @override
  Future<void> doInitialize() async {}

}