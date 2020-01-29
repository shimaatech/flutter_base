import 'package:equatable/equatable.dart';

class Pair<T1,T2> extends Equatable {

  final T1 first;
  final T2 second;

  Pair(this.first, this.second);

  @override
  List<Object> get props => [first, second];
}