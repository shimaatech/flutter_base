import 'package:flutter/foundation.dart';
import 'package:flutter_base/src/mixins/disposable.dart';

abstract class Initializable with Disposable {

  Future<void> _initFuture;

  bool _initialized = false;
  bool get initialized => _initialized;

  @protected
  Future<void> doInitialize() async {}

  Future<void> _initialize() async {
    await doInitialize();
    _initialized = true;
  }

  Future<void> initialize() => _initFuture;

  Initializable() {
    // initialize directly when constructing the service
    _initFuture = _initialize();
  }

  @mustCallSuper
  void dispose() {}
}