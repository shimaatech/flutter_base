
import 'package:flutter/foundation.dart';

mixin Disposable {

  @mustCallSuper
  Future<void> dispose();
}