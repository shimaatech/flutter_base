import 'package:flutter/foundation.dart';

abstract class BaseService {

  BaseService() {
    _initialize();
  }

  Future<void> _initialized;
  Future<void> get initialized => _initialized;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  @protected
  Future<void> initialize();

  void dispose() {}

  Future<void> _initialize() async {
    _initialized = initialize();
    await _initialized;
    _isInitialized = true;
  }

}