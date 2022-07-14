import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stoptimer_event.dart';
part 'stoptimer_state.dart';

class StoptimerBloc extends Bloc<StoptimerEvent, StoptimerState> {
  StoptimerBloc() : super(StoptimerInitial());

  @override
  Stream<StoptimerState> mapEventToState(StoptimerEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
