import 'package:flutter/cupertino.dart';

mixin Disposable {

  @mustCallSuper
  Future<void> dispose();
}