import 'package:flutter/foundation.dart';
import 'package:flutter_base/src/mixins/disposable.dart';

/// Initialized directly when constructed
abstract class Initializable with Disposable {

  Future<void> _initFuture;

  bool _initialized = false;

  bool get initialized => _initialized;

  @protected
  Future<void> initialize();

  Future<void> ensureInitialized() async {
    await _initFuture;
    _initialized = true;
  }

  Initializable() {
    // initialize directly when constructing the service
    _initFuture = initialize();
  }

  @mustCallSuper
  Future<void> dispose() async {}

}

