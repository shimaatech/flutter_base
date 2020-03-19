import 'package:flutter/foundation.dart';
import 'package:flutter_base/src/mixins/disposable.dart';

/// Initialized directly when constructed
abstract class Initializable with Disposable {
  Future<void> _initFuture;

  bool _initialized = false;

  bool get initialized => _initialized;

  @protected
  Future<void> doInitialize();

  Future<void> initialize() async {
    await _initFuture;
    _initialized = true;
  }

  void ensureInitialized() {
    if (!initialized) {
      throw NotInitializedException();
    }
  }

  Initializable() {
    // initialize directly when constructing the service
    _initFuture = doInitialize();
  }

  @mustCallSuper
  Future<void> dispose() async {}

}


class NotInitializedException implements Exception {

  final String message;
  NotInitializedException([this.message]);

}
