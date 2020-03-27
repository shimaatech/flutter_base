import 'package:flutter/cupertino.dart';

import '../../flutter_base.dart';

abstract class AppContext {

  Locator _locator;

  AppContext() {
    _locator = setupLocator();
  }

  @protected
  Locator get locator => _locator;

  List<BeanConfig> get configs;

  @protected
  Locator setupLocator() {
    return KiwiLocator();
  }


  T locate<T>([String name]) => locator.locate<T>(name);

  Future<void> configure() async {
    await configureInstances();
    for (BeanConfig config in configs) {
      config.configure(locator);
    }
  }

  Future<void> configureInstances() async {}

  @mustCallSuper
  Future<void> clear() async {
    locator.clear();
  }

}


abstract class BeanConfig<S, T extends S> {
  @protected
  configure(Locator locator);

  S create(Locator locator);
}


abstract class SingletonBeanConfig<S, T extends S> extends BeanConfig<S, T> {
  @override
  @protected
  void configure(Locator locator) {
    locator.registerSingleton<S,T>((locator) => create(locator));
  }
}


abstract class FactoryBeanConfig<S, T extends S> extends BeanConfig<S, T> {

  @override
  @protected
  configure(Locator locator) {
    locator.registerFactory<S,T>((locator) => create(locator));
  }

}


