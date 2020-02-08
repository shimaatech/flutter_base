import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

final _logger = Logger();

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    _logger.d('$bloc: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _logger.d('$bloc: $transition');
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    _logger.d('Error: $bloc', error, stacktrace);
  }
}
