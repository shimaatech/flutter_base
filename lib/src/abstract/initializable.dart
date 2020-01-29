import 'package:flutter/foundation.dart';

abstract class Initializable {

  Future<void> _initialized;
  Future<void> get initialized => _initialized;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  @protected
  Future<void> initialize();

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