import 'package:bloc_component/bloc_component.dart';
import 'package:flutter/material.dart';

abstract class BasePageView<B extends BaseBloc> extends ComponentView <B>{
  BasePageView(B bloc) : super(bloc);

  Widget buildContent(BuildContext context);

  List<Widget> appBarActions(BuildContext context) => [];

  FloatingActionButton get floatingAction => null;

  String title(BuildContext context);

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: appBarActions(context),
        title: Text(title(context)),
      ),
      floatingActionButton: floatingAction,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: buildContent(context),
      ),
    );
  }

  @override
  Widget onInitializing(BuildContext context, StateLoading loadingData) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title(context)),
      ),
      body: onPageInitializing(context, loadingData),
    );
  }

  @protected
  Widget onPageInitializing(BuildContext context, StateLoading loadingData) {
    return super.onInitializing(context, loadingData);
  }

}
