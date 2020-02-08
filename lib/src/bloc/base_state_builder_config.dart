import 'package:bloc_component/bloc_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

final _logger = Logger();

class BaseStateBuilderConfig extends StateBuilderConfig {
  @override
  Widget onError(BuildContext context, StateError error) {
    _logger.e(error.message, error.exception, error.stackTrace);
    return Text(error.message);
  }

  @override
  Widget onLoading(BuildContext context, StateLoading loading) {
    return Center(
      child: loadingIndicator(context, loading),
    );
  }

  @override
  Widget onOther(BuildContext context, BlocState state) {
    return Center(
      child: loadingIndicator(context),
    );
  }

  @protected
  Widget loadingIndicator(BuildContext context, [StateLoading loading]) =>
      CircularProgressIndicator();
}
