import 'package:flutter/foundation.dart';
import 'package:flutter_base/src/mixins/disposable.dart';


/// Initialized directly when constructed
abstract class Initializable with Disposable {

  Future<void> _initFuture;

  bool _initialized = false;
  bool get initialized => _initialized;


  @protected
  Future<void> doInitialize();

  Future<void> _initialize() async {
    await doInitialize();
    _initialized = true;
  }


  /// Does some async initializations.
  /// The object will be initialized once even if this method was called
  /// multiple times
  Future<void> initialize() => _initFuture;

  void assertInitialized() {
    assert(_initialized);
  }


  Initializable() {
    // initialize directly when constructing the service
    _initFuture = _initialize();
  }

  @mustCallSuper
  Future<void> dispose() async {
  }
}