import 'package:flutter/foundation.dart';
import 'package:flutter_base/src/mixins/disposable.dart';

abstract class Initializable with Disposable {

  Future<void> _initialized;
  Future<void> get initialized => _initialized;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  @protected
  Future<void> initialize() async {}

  Future<void> _initialize() async {
    _initialized = initialize();
    await _initialized;
    _isInitialized = true;
  }

  Initializable() {
    _initialized = _initialize();
  }

  @mustCallSuper
  void dispose() {}
}